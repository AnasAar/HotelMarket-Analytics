import json
import pandas as pd
from airflow.models import DAG
from airflow.operators.python import PythonOperator
import pendulum
import mysql_connexion as ms

input = '/home/anasaar/airflow/data_input/marrakech_hotels.json'


def load_file():
    with open(input, 'r') as f:
        data = json.load(f)
    return data


def transform_apifydata(path: str):
    apifydata = load_file()
    transformed_data = []
    try:
        for DataRow in apifydata:
            transformed_data.append({
                'ID': DataRow['id'],
                'Name': DataRow['name'],
                'Type': DataRow['type'],
                'rating': DataRow['rating'],
                'Awards': len(DataRow['awards']),
                'RankingPosition': DataRow['rankingPosition'],
                'HotelClass': DataRow['hotelClass'],
                'NumberOfReviews': DataRow['numberOfReviews'],
                'priceRange': DataRow['priceRange']
            })
    except:
        pass
    marakech_df1 = pd.DataFrame(transformed_data)
    marakech_df1.to_csv(path, index=False)


def prices_rang_data(path: str):
    apifydata = load_file()
    transformed_data = []
    try:
        for DataRow in apifydata:
            transformed_data.append({
                'priceRange': DataRow['priceRange'],
                'RankingPosition': DataRow['rankingPosition']
            })
    except:
        pass
    prices_rang_df1 = pd.DataFrame(transformed_data)
    prices_rang_df1.to_csv(path, index=False)


def hotels_data(path: str):
    apifydata = load_file()
    transformed_data = []
    try:
        for DataRow in apifydata:
            transformed_data.append({
                'Name': DataRow['name'],
                'Awards': len(DataRow['awards']),
                'rating': DataRow['rating']
            })
    except:
        pass
    hotels_data_df1 = pd.DataFrame(transformed_data)
    hotels_data_df1.to_csv(path, index=False)


def hotel_reviews_data(path: str):
    apifydata = load_file()
    transformed_data = []
    try:
        for DataRow in apifydata:
            transformed_data.append({
                'NumberOfReviews': DataRow['numberOfReviews'],
                'HotelClass': DataRow['hotelClass'],
                'rating': DataRow['rating']
            })
    except:
        pass
    hotel_reviews_df1 = pd.DataFrame(transformed_data)
    hotel_reviews_df1.to_csv(path, index=False)


def data_dimensions_insertion():
    csvdata = pd.read_csv('/home/anasaar/airflow/data_output/marrakech1.csv', index_col=False, delimiter=',')
    csvdata.head()
    for i, row in csvdata.iterrows():
        sql = "INSERT INTO prices_rang(pricerange, rankingposition) VALUES (%s,%s)"
        ms.cursor.execute(sql, tuple(row))
        ms.conn.commit()

    csvdata1 = pd.read_csv('/home/anasaar/airflow/data_output/marrakech2.csv', index_col=False, delimiter=',')
    csvdata1.head()
    for i, row in csvdata1.iterrows():
        sql = "INSERT INTO hotels( name, awards, rating) VALUES (%s,%s,%s)"
        ms.cursor.execute(sql, tuple(row))
        ms.conn.commit()

    csvdata2 = pd.read_csv('/home/anasaar/airflow/data_output/marrakech3.csv', index_col=False, delimiter=',')
    csvdata2.head()
    for i, row in csvdata2.iterrows():
        sql = "INSERT INTO hotel_reviews(numberofreviews, hotelclass, rating) VALUES (%s,%s,%s)"
        ms.cursor.execute(sql, tuple(row))
        ms.conn.commit()


def data_fact_insertion():
    sql="insert into fact_offers(number_of_hotels, number_ofrange_prices, max_hotelclass, min_hotelclass, " \
        "max_ofreviews, min_ofreviews) select count(name), count(pricerange), max(hotelclass), min(hotelclass), " \
        "max(numberofreviews), min(numberofreviews) from hotels, prices_rang, hotel_reviews; "
    ms.cursor.execute(sql)
    ms.conn.commit()


with DAG(
        dag_id='TripAdvisor_Hotels_dag',
        start_date=pendulum.datetime(2022, 1, 1, tz="UTC"),
        schedule_interval='@Daily',
        catchup=False
) as dag:
    task_extract_ApifyData = PythonOperator(
        task_id='extract_ApifyData',
        python_callable=load_file,
        dag=dag
    )
    task_transform_ApifyData = PythonOperator(
        task_id='transform_ApifyData',
        python_callable=transform_apifydata,
        op_kwargs={'path': '/home/anasaar/airflow/data_output/marrakech.csv'},
        dag=dag
    )
    task_prices_rang_data = PythonOperator(
        task_id='prices_rang_data',
        python_callable=prices_rang_data,
        op_kwargs={'path': '/home/anasaar/airflow/data_output/marrakech1.csv'},
        dag=dag
    )
    task_hotels_data = PythonOperator(
        task_id='hotels_data',
        python_callable=hotels_data,
        op_kwargs={'path': '/home/anasaar/airflow/data_output/marrakech2.csv'},
        dag=dag
    )
    task_hotel_reviews_data = PythonOperator(
        task_id='hotel_reviews_data',
        python_callable=hotel_reviews_data,
        op_kwargs={'path': '/home/anasaar/airflow/data_output/marrakech3.csv'},
        dag=dag
    )
    task_insertion_dimension_tables = PythonOperator(
        task_id='data_dimensions_insertion',
        python_callable=data_dimensions_insertion,
        dag=dag
    )
    task_insertion_fact_table = PythonOperator(
        task_id='data_fact_insertion',
        python_callable=data_fact_insertion,
        dag=dag
    )

task_extract_ApifyData >> task_transform_ApifyData >> task_prices_rang_data >> task_hotels_data >> task_hotel_reviews_data >> task_insertion_dimension_tables >> task_insertion_fact_table
