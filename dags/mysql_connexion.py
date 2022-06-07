import mysql.connector as msql

conn = msql.connect(host='127.0.0.1', user='root',password='Anasaar123@', database="tp2_mysql")
cursor = conn.cursor()

#tables des dimensions
cursor.execute("CREATE TABLE IF NOT EXISTS prices_rang(id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, pricerange VARCHAR (30), "
               "rankingposition INT)")
cursor.execute("CREATE TABLE IF NOT EXISTS hotels(id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, name VARCHAR (100), awards INT, "
               "rating DOUBLE )")
cursor.execute("CREATE TABLE IF NOT EXISTS hotel_reviews(id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, numberofreviews INT, "
               "hotelclass DOUBLE , "
               "rating DOUBLE )")
#Table de fait
cursor.execute("CREATE TABLE IF NOT EXISTS fact_offers(pricesrange_id INT, hotels_id INT, reviews_id INT, "
               "number_of_hotels INT, number_ofrange_prices   INT, max_hotelclass INT, min_hotelclass INT, "
               "max_ofreviews INT, min_ofreviews INT,KEY pricesrange_id (pricesrange_id), KEY hotels_id (hotels_id), "
               "KEY reviews_id (reviews_id), CONSTRAINT fact_offers_ibfk_1 FOREIGN KEY (pricesrange_id) REFERENCES "
               "prices_rang (id), CONSTRAINT fact_offers_ibfk_2 FOREIGN KEY (hotels_id) REFERENCES hotels (id), "
               "CONSTRAINT fact_offers_ibfk_3 FOREIGN KEY (reviews_id) REFERENCES hotel_reviews (id))")