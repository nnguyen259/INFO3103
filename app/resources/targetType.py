from flask import Flask, jsonify, abort, request, make_response, session
from flask_restful import reqparse, Resource, Api

from common.dbUtil import *

class TargetType(Resource):
	def get(self, targetType_id):
		row = getFromDb('getTargetType', (targetType_id))
		if not row:
			abort(404)
		return make_response(jsonify({'targetType': row}), 200)

class TargetTypeList(Resource):
	def get(self):
		rows = getFromDb('getTargetTypes')
		print(rows)
		return make_response(jsonify({'targetTypes': rows}), 200)
