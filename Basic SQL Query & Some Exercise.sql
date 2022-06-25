/* SQL DATABASE RECORD
* ALL Basic Query SQL
* Exercise at the Bottom of Query 
* Execute Syntax per Block, Because not all have final statement (;)
*/

CREATE TABLE penjualan (id_produk int, product_name varchar(255), harga int, primary key(id_produk);

/* primary key digunakan untuk menghindari duplikasi data dalam sebuah kolom */

--Memasukan nilai/record
INSERT INTO penjualan (id_produk, product_name, harga)
VALUES
(1,'Avanza',10000),
(2,'Panther',20000)

--ngecek data pada table
SELECT * FROM penjualan

--insert versi lain

INSERT INTO penjualan
VALUES (3,'Pajero',30000)

--DROPING OBJECT
--DROP TABLE
DROP TABLE penjualan

--DROP DATABASE
DROP DATABASE bootcamp_ds

--ALTER ADD
ALTER TABLE penjualan
ADD quantity int

--ALTER DROP COLUMN
ALTER TABLE penjualan

DROP COLUMN quantity

-- ALTER - ALTER COLUMN
ALTER TABLE penjualan

ALTER COLUMN harga type bigint

---------------------------------------------------------

--SELECT STATEMENT
SELECT user_id, product_name

FROM sales

-- SELECT Asterisk
SELECT * FROM sales

-- WHERE
SELECT * FROM sales
WHERE price_per_kg > 10000
--
SELECT product_name 
FROM sales
WHERE price_per_kg > 10000
--
SELECT DISTINCT(product_name) 
FROM sales
WHERE price_per_kg > 10000

-- AND
SELECT * FROM sales
WHERE price_per_kg > 10000 
AND store_city_id < 5
-- AND mengikat/mengikuti

-- OR
SELECT * FROM sales
WHERE price_per_kg > 10000 
OR store_city_id < 5
--sifatnya opsional tidak mengikat/mengikuti
--
SELECT * FROM sales
WHERE product_name ='Jeruk' 
OR product_name ='Pisang'
OR product_name ='Anggur'

-- NOT
SELECT * FROM sales
WHERE NOT product_name ='Jeruk'
--
SELECT * FROM sales
WHERE product_name !='Jeruk'
--
SELECT * FROM sales
WHERE product_name <> 'Jeruk'
--
--IN
SELECT * FROM sales
WHERE product_name 
IN('Mangga','Apel')

--NOT IN
SELECT * FROM sales
WHERE product_name 
NOT IN('Jeruk','Semangka')

/*Klausa IN dan NOT IN berguna memasukkan 2 atau lebih variabel yang ada 
di dalam field, alternatif penggunaan OR NOT IN merupakan kebalikan dari IN */

--IS NULL & IS NOT NULL
SELECT * 
FROM employees
WHERE email IS NULL

SELECT * 
FROM employees
WHERE email IS NOT NULL
--IS NULL & IS NOT NULL merupakan klausa untuk menguji 
--nilai kosong(null) dan tidak

--BETWEEN
SELECT * FROM employees
WHERE hire_date 
BETWEEN '2018-01-01' AND '2020-01-01'
--Mencari nilai di antara 2 Variabel
--Between sendiri dibaca >= & <= (Lebih dari sama dengan dan kurang dari sama degan)

/*LAKUKAN QUERY yang menampilkan data karyawan data analyst dengan email lengkap dan hire datenya 
 * ditahun 2018-2019 dan salary 2021-2022 tidak ditampilkan */

1. column yang ditampilkan = employee_id, first_name, last_name, email,
hire_date, salary_2020
2. kondisi yang ditampilkan = department 'Data Analyst', hire_date antara
2018-2019
--
SELECT employee_id, 
	first_name, 
	last_name, 
	email, 
	hire_date, 
	salary_2020 
FROM employees
WHERE department IN ('Data Analyst') 
AND hire_date
BETWEEN '2018-01-01' AND '2019-01-01'
--

/*DELETE digunakan untuk isi data dalam table, Berbeda dengan DROP yang menghapus keseluruhan Table DELETE hanya menghapus isi dari table yang 
 * diinginkan Bahkan jika menerapkan DELETE ALL pada isi table hanya isinya yang akan hilang, namun Table nya tidak.*/

SELECT * FROM penjualan

DELETE FROM penjualan
WHERE product_name = 'sarimie'

DELETE FROM penjualan

--
--PATTER MATCHING 'LIKE'
SELECT * FROM employees
WHERE first_name LIKE 'G%'

SELECT * FROM employees
WHERE first_name LIKE 'A___%'
--
--ORDER BY
SELECT * FROM employees
ORDER BY hire_date ASC

SELECT * FROM employees
WHERE department ='Payroll'
ORDER BY hire_date ASC

SELECT * FROM employees
WHERE department ='Data Analyst'
ORDER BY salary_2020 DESC
--ORDER BY ada diposisi paling bawah setelah klausa lainnya

--LIMIT
--Perintah LIMIT digunakan untuk menentukan jumlah record 
--yang akan ditampilkan.
SELECT * FROM employees
LIMIT 100

SELECT * FROM employees
WHERE department ='Data Analyst'
ORDER BY salary_2020 DESC
LIMIT 10
--limit juga harus berada diposisi paling bawah, bahkan setelah
--ORDER BY / GROUP BY

DISTINCT
/* Dalam tabel sering kali terdapat duplikat, untuk menampilkan daftar nilai 
yang berbeda maka menggunakan SELECT DISTINCT. Biasanya digunakan untuk Column 
yang memiliki banyak data dengan isi yang sama. */

DISTINCT
SELECT DISTINCT(product_name)
FROM sales
--
PREFIX DAN ALIAS
/* PREFIX digunakan untuk menambahkan nama table di depan nama kolom. Digunakan 
jika mengambil data dari dua tabel, seperti menggabungkan dua tabel menggunakan 
JOIN. PREFIX Biasanya digunakan saat menggunakan perintah JOIN. 

Lalu ALIAS sendiri digunakan untuk mempersingkat nama table menjadi lebih mudah 
dibaca. ALIAS ini dibuat dengan kata kunci AS. Alias sendiri sering dikombinasikan 
dengan Prefix */
--
SELECT employees.first_name, 
		employees.department, 
		employees.salary_2021
FROM employees
ORDER BY salary_2021 ASC

SELECT *, quantity*price_per_kg AS Total
FROM sales

--SKALAR MATHEMATIC
--SQRT nilai akar kuadrat dari nilai input.
SELECT SQRT(quantity)
FROM sales

-- SQRT
SELECT quantity, SQRT(quantity) 
FROM sales

--SUBSTRING
SELECT * FROM sales
SELECT SUBSTRING('purchase_date' FROM 1 FOR 4)
FROM sales

SELECT SUBSTRING('This is test data' FROM 9)

SELECT SUBSTRING('This is test data' FROM 1 FOR 4)

--REPLACE
SELECT * FROM employees

SELECT REPLACE (department, 'Human Resources', 'HR')
FROM employees

--POSITION
SELECT email, POSITION('@' IN email)
FROM employees

SELECT email, POSITION('@' IN email)
FROM employees
ORDER BY POSITION ASC

--KOMBINASI POSITION + SUBSTRING
SELECT first_name, last_name, email, 
SUBSTRING(email, POSITION('@' IN email))
FROM employees

--FUNGSI AGGREGAT
--MIN, MAX, SUM, COUNT
SELECT * FROM sales

SELECT MIN(quantity) FROM sales

SELECT MAX(quantity) FROM sales

SELECT SUM(quantity) FROM sales

SELECT SUM(price_per_kg) FROM sales

SELECT COUNT(price_per_kg) FROM sales

SELECT SUM(DISTINCT price_per_kg) FROM sales

SELECT COUNT(DISTINCT price_per_kg) FROM sales
--

/* Dengan data Employees coba lakukan QUERY yang menampilkan total Salary 2022
dengan nama karyawan first_name yang berawalan dengan huruf 'C' */

1. column yang ditampilkan first_name dan total salary_2022
2. Case nya adalah total salary_2022 dengan first_name nama karyawan berawalan
huruf 'C'

SELECT * FROM employees

SELECT first_name, salary_2022 FROM employees
WHERE first_name LIKE 'C%'

SELECT SUM(salary_2022) FROM employees
WHERE first_name LIKE 'C%'

--GROUP BY
/* GROUP BY digunakan untuk mengelompokkan baris yang memiliki nilai yang sama ke dalam baris ringkasan. Biasanya GROUP BY sering digunakan dengan fungsi 
 * agregat COUNT(), MAX(), MIN(), AVG() untuk mengelompokkan kumpulan hasil menurut satu atau beberapa kolom. */
--
SELECT * FROM sales

SELECT product_name, store_city_id, 
SUM(quantity) 
AS total FROM sales
GROUP BY product_name, store_city_id
ORDER BY product_name

SELECT product_name, store_city_id, 
SUM(quantity) 
AS total FROM sales
GROUP BY product_name, store_city_id
ORDER BY product_name, store_city_id

SELECT product_name, store_city_id, 
SUM(quantity) 
AS total FROM sales
WHERE purchase_date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY product_name, store_city_id
ORDER BY product_name, store_city_id

/* Definisi GROUP BY harus sama dengan apa yang di panggil oleh SELECT berbeda dengan ORDER BY yang tidak wajin sama dengan yang difinisikan SELECT dan jika 
 * ingin di berikan kondisi WHERE harus sebelum ORDER dan GROUP kecuali menggunakan HAVING */

TIPS: UNTUK KARAKTER DATE dan STRING dibutuhkan tanda ('')

--HAVING
--HAVING CLAUSE digunakan karena klausa WHERE tidak dapat digunakan dengan fungsi agregat. 

SELECT product_name, store_city_id, 
SUM(quantity) 
AS total FROM sales
WHERE purchase_date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY product_name, store_city_id
HAVING product_name IN ('Mangga','Jeruk')
ORDER BY product_name, store_city_id

SELECT product_name, store_city_id, 
SUM(quantity) 
AS total FROM sales
WHERE purchase_date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY product_name, store_city_id
HAVING SUM(quantity) > 50
ORDER BY product_name, store_city_id

--
/* Dengan menggunakan data employees carilah total salary_2020, lalu kelompokkan
karyawan berdasarkan store_city_id dan urutkan secara Ascending berdasarkan store_city_id */
--
SELECT employee_id, first_name, last_name, store_city_id,
SUM(salary_2020) 
AS "total" FROM employees
GROUP BY employee_id, first_name, last_name, store_city_id
ORDER BY store_city_id ASC

SELECT store_city_id,
SUM(salary_2020) 
AS "total" FROM employees
GROUP BY store_city_id
ORDER BY store_city_id ASC

SUBQUERY
/* Subquery merupakan query dalam query dan ada pada klausa WHERE bisa juga disebut permintaan dalam permintaan. 
 * Subsquery digunakan untuk mengembalikan data yang akan digunakan dalam query utama sebagai syarat 
 * untuk lebih membatasi data yang akan diambil */

--SUBQUERY WHERE
SELECT * FROM sales 
	WHERE store_city_id IN (SELECT store_city_id FROM region 
	WHERE region IN ('Jawa Timur','Jawa Tengah'))

--SUBQUERY FROM
SELECT * FROM sales

SELECT * FROM (                
SELECT * FROM sales
	WHERE store_city_id IN (SELECT store_city_id FROM region 
     WHERE region IN('Jawa Timur','Jawa Tengah'))

SELECT * FROM 
	(SELECT * FROM sales WHERE product_name= 'Anggur') 
	AS Table_Anggur

--SUBQUERY juga bisa digunakan pada perintah SELECT, ANY & ALL 

CONDITIONAL EXPRESSION

CASE 

/* Dengan menggunakan "data sales" dan "store_data" lakukan query yang 
mengembalikan/menampilkan record total pendapatan dari hasil penjualan buah 
di luar pulau jawa dan jawa, kategorikan daerah berdasarkan pulaunya, misalnya 
Bandung adalah termasuk dari pulau Jawa. 
Clue: kombinasikan antara metode Conditional Expression dan Subquery! */

/* Kolom yang ditampilkan: 
 * total pendapatan dari hasil penjualan buah beserta kolom pulau jawa jawal & luar pulau jawa
 * 
 * Kondisi yang dibutuhkan: 
 * total_pendapatan dari quantity*price_per_kg dan klasifikasikan store_city_id yang berada di Pulau Jawa dan luar pulau jawa */

SELECT * FROM sales
SELECT * FROM region

SELECT 
CASE WHEN store_city_id IN (SELECT store_city_id FROM region
           WHERE region IN('Yogyakarta','Jawa Timur','Jawa Barat','Jakarta','Bandung','Jawa Tengah')) THEN 'Pulau Jawa'
     WHEN store_city_id IN (SELECT store_city_id FROM region
           WHERE region IN('Sumatera','Sulawesi','Bali','Kalimantan')) THEN 'Luar Pulau Jawa'
	END AS pulau,
SUM(quantity*price_per_kg) AS total_pendapatan
FROM sales
GROUP BY pulau

-- OR Gunakan ELSE

SELECT 
CASE WHEN store_city_id IN (SELECT store_city_id FROM region
           WHERE region IN('Yogyakarta','Jawa Timur','Jawa Barat','Jakarta','Bandung','Jawa Tengah')) THEN 'Pulau Jawa'
     ELSE 'Luar Pulau Jawa'
	END AS pulau,
SUM(quantity*price_per_kg) AS total_pendapatan
FROM sales
GROUP BY pulau

--TIMESTAMP

EXTRACT TIMESTAMP

SELECT user_id, 
		product_name, 
		quantity, 
		purchase_date, 
		store_city_id,
	EXTRACT (YEAR FROM purchase_date) AS Tahun,
	EXTRACT (MONTH FROM purchase_date) AS Bulan
	FROM sales
--
SELECT user_id, 
	  product_name, 
	  quantity, 
	  purchase_date, 
	  store_city_id,
	EXTRACT (YEAR FROM purchase_date) AS Tahun,
	EXTRACT (MONTH FROM purchase_date) AS Bulan,
	EXTRACT (DAY FROM purchase_date) AS Hari
	FROM sales

--DATEDIFF

SELECT first_name
		hire_date,
		CURRENT_TIME
FROM employees

--Lama karyawan bekerja, menarik waktu Tahun_Kerja dengan menggunakan DATEFDIFF
--NOTE: DATETIFF di setiap database SQL bisa saja berbeda DATEPART, DATEDIFF Dll.

SELECT first_name, 
	  hire_date, 
	  CURRENT_DATE,
	  DATE_PART('year', CURRENT_DATE) - DATE_PART('year', hire_date) AS Tahun_Kerja
     FROM employees;

--

SELECT first_name, 
	   hire_date, 
	   CURRENT_DATE, DATE_PART
	   ('year','month','day', CURRENT_DATE) - DATE_PART('year','month','day', hire_date) AS Years
FROM employees;

--JOIN
--Using Data Vendor 1 dan 2

CREATE TABLE vendor_1 (
vendor_id int,
vendor_name varchar(255),
vendor_type varchar(255),
region varchar(255),
cooperation_date date,
primary key (vendor_id)
);

INSERT INTO vendor_1 VALUES
(1, 'HQ', 'Packaging', 1, '2021-01-01'),
(2, 'STP', 'Packaging', 1, '2021-05-08'),
(3, 'PackaNew', 'Packaging', 1, '2022-01-01');

--

CREATE TABLE vendor_2 (
vendor_id int,
vendor_name varchar(255),
vendor_type varchar(255),
region varchar(255),
cooperation_date date,
primary key (vendor_id)
);

INSERT INTO vendor_2 VALUES
(3, 'PackaNew', 'Ekspedisi', 1, '2022-03-01'),
(4, 'Herlin', 'Ekspedisi', 2, '2021-03-01'),
(5, 'Mota', 'Ekspedisi', 5, '2022-04-01');
--

SELECT * FROM vendor_1

SELECT * FROM vendor_2
--

--INNER JOIN
SELECT v1.vendor_id, v1.vendor_name, v1.vendor_type FROM vendor_1 v1
INNER JOIN vendor_2 AS V2
ON v1.vendor_id = v2.vendor_id

SELECT * FROM sales
SELECT * FROM region

--LEFT JOIN
SELECT s.*, r.region FROM sales AS s
LEFT JOIN region AS r
ON s.store_city_id = r.store_city_id
ORDER BY quantity

SELECT s.user_id, s.product_name, s.store_city_id, r.region FROM sales AS s
LEFT JOIN region AS r
ON s.store_city_id = r.store_city_id
ORDER BY quantity

SELECT * FROM sales
SELECT * FROM region

--RIGHT JOIN
SELECT * FROM region AS reg
RIGHT JOIN sales AS s
ON reg.store_city_id = s.store_city_id

--FULL OUTER JOIN
SELECT vendor_1.vendor_name, vendor_2.vendor_id
FROM vendor_1
FULL OUTER JOIN vendor_2 ON vendor_1.vendor_id=vendor_2.vendor_id
ORDER BY vendor_1.vendor_name;
--
SELECT vendor_1.vendor_name, vendor_2.vendor_id
FROM vendor_1
FULL JOIN vendor_2 ON vendor_1.vendor_id=vendor_2.vendor_id
ORDER BY vendor_1.vendor_name;

--SELF JOIN

--Gunakan Data vendor 1 & 2, lakukan LEFT JOIN dan ambil vendor_id, vendor_name dan vendor_type
--Tanggal kerjasama ambil dari kedua Vendor (Ditampilkan 2 kolom)

SELECT * FROM vendor_1

SELECT * FROM vendor_2

SELECT v1.vendor_id, v1.vendor_name, 
		v1.vendor_type AS vendor_type_v1, 
		v2.vendor_type AS vendor_type_v2,
		v1.cooperation_date AS cooperation_date_v1, 
		v2.cooperation_date AS cooperation_date_v2 
FROM vendor_1 AS v1
LEFT JOIN vendor_2 AS v2
ON v1.vendor_id =v2.vendor_id

--UNION
SELECT * FROM vendor_1
UNION
SELECT * FROM vendor_2
--
SELECT vendor_id, vendor_name FROM vendor_1
UNION
SELECT vendor_id, vendor_name FROM vendor_2
ORDER BY vendor_id

--UNION ALL
SELECT vendor_id, vendor_name FROM vendor_1
UNION ALL
SELECT vendor_id, vendor_name FROM vendor_2

SELECT vendor_id, vendor_name FROM vendor_1
UNION ALL
SELECT vendor_id, vendor_name FROM vendor_2
ORDER BY vendor_id
/* UNION ALL Mengembalikan DUPLIKAT yang ada, berbeda dengan UNION saja yang justru
tidak ditampilkan/dihilangkan */

--OVER

/* OVER Digunakan untuk mengelompokkan data pada jendela tertentu, Klausa OVER mendefinisikan 
 * jendela atau kumpulan baris yang ditentukan oleh pengguna dalam kumpulan query */

/* Dalam Over Clause juga dapat menggunakan fungsi aggregat yaitu MIN(), MAX(), AVG(), 
 * SUM(), COUNT() dengan memasukkan fungsi aggregat */


SELECT * FROM employees

SELECT first_name, department, 
COUNT (*) OVER()
FROM employees

--OVER PARTITION BY
SELECT first_name, department, 
COUNT (*) OVER(PARTITION BY department)
FROM employees
--
SELECT first_name, department, 
COUNT (*) OVER()
FROM employees
WHERE store_city_id = 3

--Membuat kumulatif Data
SELECT first_name,
		salary_2021,
		SUM(salary_2021) OVER(ORDER BY first_name, salary_2021) AS Total
	FROM employees
ORDER BY first_name


/* Misal Kita ingin melihat karyawan, jumlah karyawan, store_city_id, dan jumlah store_city_id
 * yang berwilayah di wilayah tersebut dipartisi berdasarkan department */

SELECT * FROM employees
--
SELECT first_name, department,
COUNT(*) OVER (PARTITION BY department) AS jumlah_department, store_city_id, 
COUNT(*) OVER (PARTITION BY store_city_id) AS jumlah_store
FROM employees
ORDER BY department
--OR
ORDER BY jumlah_store
--OR
ORDER BY jumlah_department
--

-----
--RANK
--
SELECT * FROM employees

SELECT first_name, email, department, salary_2020,
RANK() OVER(PARTITION BY department ORDER BY salary_2020 DESC) 
FROM employees

SELECT first_name, email, department, salary_2020,
DENSE_RANK() OVER(PARTITION BY department ORDER BY salary_2020 DESC) 
FROM employees


--RANKING dan SUBQUERY
--Mencari ranking secara spesific
SELECT * FROM (
SELECT first_name, email, department, salary_2020,
RANK() OVER(PARTITION BY department ORDER BY salary_2020 DESC) 
FROM employees )
AS Ranking
WHERE RANK = 11
--
--NTILE
SELECT first_name, email, department, salary_2020,
NTILE(5) OVER(PARTITION BY department ORDER BY salary_2020 DESC) 
FROM employees

--FIRST_VALUE
--Kasus dimana kita ingin melihat gaji terbesar dan perbandingannya dari setiap department
SELECT first_name, email, department, salary_2020,
FIRST_VALUE(salary_2020) OVER(PARTITION BY department ORDER BY salary_2020 DESC) 
FROM employees

--NTH_VALUE
SELECT first_name, email, department, salary_2020,
NTH_VALUE(salary_2020, 5) OVER(PARTITION BY department ORDER BY salary_2020 DESC) 
FROM employees

--LEAD 
SELECT first_name, last_name, salary_2021,
LEAD(salary_2021) OVER() next_salary --Still the same with or without AS 
FROM employees

--LAG
SELECT first_name, last_name, salary_2021,
LAG(salary_2021) OVER() previous_salary 
FROM employees

-- WITH CTE
/* CTE adalah set hasil satu kali yang hanya ada untuk durasi Query. Ini digunakan untuk merujuk 
 * ke data dalam satu pilihan terpilih, memasukkan, memperbarui, menghapus, membuat 
 * tampilan, atau menggabungkan lingkup eksekusi pernyataan. */
--

SELECT product_name, 
       store_city_id,
       SUM(quantity*price_per_kg) as total 
FROM sales
GROUP BY product_name, store_city_id 
ORDER BY store_city_id 

--
SELECT store_city_id,
       AVG(total) AS avg_total
FROM (
SELECT product_name, 
       store_city_id,
       SUM(quantity*price_per_kg) as total 
FROM sales
GROUP BY product_name, store_city_id 
ORDER BY store_city_id ) AS table_a
GROUP BY store_city_id
--
WITH table_a AS (
    SELECT product_name, 
       store_city_id,
       SUM(quantity*price_per_kg) as total 
FROM sales
GROUP BY product_name, store_city_id 
ORDER BY store_city_id
)

SELECT store_city_id,
       AVG(total) AS avg_total
FROM table_a
GROUP BY store_city_id

--
WITH table_a AS (
    SELECT product_name, 
       store_city_id,
       SUM(quantity*price_per_kg) as total 
FROM sales
GROUP BY product_name, store_city_id 
ORDER BY store_city_id
),

avg_amount_per_region AS (SELECT store_city_id,
                          AVG(total) AS avg_total
FROM table_a
GROUP BY store_city_id)

SELECT * FROM avg_amount_per_region
WHERE store_city_id IN (1,2,3)
/* Subquery hanya bisa dilakukan 2x dalam 1x perintah, berbeda dengan WITH yang tidak terbatas.
 * Bahkan WITH bisa dikombinasikan dengan WITH dan Subquery lagi.
 * Subquery jauh lebih kaku dibanding dengan WITH.
 */



--EXERCISE TO DO
Exercise 1
1. Dengan menggunakan data di tabel “sales” lakukan query yang menampilkan record:
	a. Data hasil penjualan buah di store 3, 4 dan 5 dimana produk buah yang memiliki harga per kg di atas 11000.
	b. Data hasil penjualan buah setelah hari raya Idul Fitri tahun 2022.
	c. Data hasil penjualan buah Mangga serta Jeruk di semua store kecuali store 1,6,7.
2. Dengan menggunakan data di tabel “employees” lakukanlah query yang menampilkan record:
	a. Tampilkan data karyawan beserta gajinya di tahun 2021.
	b. Tampilkan nama-nama karyawan yang bekerja di store 3,4,7 dan bergaji diatas $5000 di tahun 2022.

Exercise 2
1. Dengan menggunakan Data di tabel “sales” lakukan query yang menampilkan record total quantity buah Mangga dan Apel 
	selama 3 pekan setelah Hari Raya Idul Fitri 2022. Dengan Kondisi kolom yang hanya ditampilkan hanya kolom nama produk dan total quantity.
2. Dengan menggunakan Data “employees” dan “region”, lakukan query yang menampilkan record seluruh karyawan 
	yang bekerja di daerah Bali dan Yogyakarta serta gunakan metode Subquery.
3. Dengan menggunakan Data “sales” dan “region” lakukan query yang menampilkan record total pendapatan 
	dari hasil penjualan buah di pulau jawa dan luar pulau jawa serta kategorikan daerah berdasarkan pulaunya, 
	Contoh Bandung adalah termasuk dari pulau Jawa. Dan juga Kombinasikan antara metode Conditional Expression dan Subquery.
	
--Answer
EXERCISE 1
--1A
SELECT * 
    FROM sales
    WHERE price_per_kg > 11000
    AND store_city_id IN (3,4,5)
    ORDER BY store_city_id;

 --1B
SELECT * 
    FROM sales 
    WHERE purchase_date >= '2022-05-02';

--1C
SELECT *
    FROM sales
    WHERE product_name IN ('Mangga','Jeruk')
    AND store_city_id NOT IN (1,6,7);
   
--2A
SELECT
    employee_id,
    store_city_id,
    first_name,
    last_name,
    email,
    department,
    hire_date,
    salary_2021
FROM employees;

--2B
SELECT 
    store_city_id, first_name, last_name, salary_2022
    FROM employees
    WHERE store_city_id IN (3,4,7)
    AND salary_2022 > 5000;

 --
 EXERCISE 2
 --1
SELECT product_name,
    SUM(quantity) As Total_Quantity FROM sales
    WHERE product_name IN ('Mangga','Apel')
    AND purchase_date BETWEEN '2022-05-01' AND '2022-05-22'
GROUP BY product_name;

--2
SELECT * FROM employees
    WHERE store_city_id IN
    (SELECT store_city_id FROM region WHERE region   IN('Bali','Yogyakarta')) --Subquery
ORDER BY employees_id ASC;

--3
SELECT
    CASE WHEN store_city_id IN (SELECT store_city_id FROM region
              WHERE region IN('Yogyakarta','Jawa Timur','Jawa Barat','Jakarta','Bandung','Jawa Tengah')) 
              THEN 'Pulau Jawa'
         WHEN store_city_id IN (SELECT store_city_id FROM regio
              WHERE region IN('Sumatera','Sulawesi','Bali', 'Kalimantan')) THEN 'Luar Pulau Jawa'
         END AS pulau,
SUM(quantity*price_per_kg) AS total
FROM sales
GROUP BY pulau;

