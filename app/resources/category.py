from flask import Flask, jsonify, abort, request, make_response, session
from flask_restful import reqparse, Resource, Api

from common.dbUtil import *

class Category(Resource):
	def get(self, category_id):
		row = getFromDb('getCategory', (category_id))
		if not row:
			abort(404)
		return make_response(jsonify({'category': row}), 200)

class CategoryList(Resource):
	def get(self):
		rows = getFromDb('getCategories')
		print(rows)
		return make_response(jsonify({'categories': rows}), 200)
