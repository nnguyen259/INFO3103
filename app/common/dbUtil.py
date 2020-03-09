from flask import Flask, jsonify, abort, request, make_response, session
import pymysql.cursors
import settings
####################################################################################
#
# Database Generic
#

#
# Generic method to submit changes to db
#
def postToDb(sqlFunction, *args):
	try:
		dbConnection = pymysql.connect(settings.MYSQL_HOST,
			settings.MYSQL_USER,
			settings.MYSQL_PASSWD,
			settings.MYSQL_DB,
			charset='utf8mb4',
			cursorclass= pymysql.cursors.DictCursor)
		sql = sqlFunction
		cursor = dbConnection.cursor()
		sqlArgs = args # Must be a collection
		cursor.callproc(sql,sqlArgs) # stored procedure, with arguments
		row = cursor.fetchone()
		dbConnection.commit() # database was modified, commit the changes
	except:
		abort(500) # Nondescript server error
	finally:
		cursor.close()
		dbConnection.close()
	return row

#
# Generic method to get data from db
#
def getFromDb(sqlFunction, *args):
	try:
		dbConnection = pymysql.connect(settings.MYSQL_HOST,
			settings.MYSQL_USER,
			settings.MYSQL_PASSWD,
			settings.MYSQL_DB,
			charset='utf8mb4',
			cursorclass= pymysql.cursors.DictCursor)
		sql = sqlFunction
		cursor = dbConnection.cursor()
		sqlArgs = args # Must be a collection
		cursor.callproc(sql,sqlArgs) # stored procedure, with arguments
		rows = cursor.fetchall()
	except:
		abort(500) # Nondescript server error
	finally:
		cursor.close()
		dbConnection.close()
	return rows

