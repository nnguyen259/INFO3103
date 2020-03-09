from flask import Flask, jsonify, abort, request, make_response, session
from flask_restful import reqparse, Resource, Api

from common.dbUtil import *

class Type(Resource):
	def get(self, type_id):
		row = getFromDb('getType', (type_id))
		if not row:
			abort(404)
		return make_response(jsonify({'type': row}), 200)

class TypeList(Resource):
	def get(self):
		rows = getFromDb('getTypes')
		print(rows)
		return make_response(jsonify({'types': rows}), 200)
