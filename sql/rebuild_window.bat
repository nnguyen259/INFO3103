copy /b *.sql all.sql
mysql -u root -p < all.sql
del /f all.sql