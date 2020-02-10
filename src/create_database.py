import pymysql.cursors
import os

connection = pymysql.connect(host='localhost',
                             user='root',
                             password='maria',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

for path in os.listdir('../sql'):
    f = open('../sql/' + path)
    sql = f.read().replace('\n', '')
    connection.cursor().execute(sql)
