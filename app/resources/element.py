from flask import Flask, jsonify, abort, request, make_response, session
from flask_restful import reqparse, Resource, Api

from common.dbUtil import *

class Element(Resource):
	def get(self, element_id):
		row = getFromDb('getElement', (element_id))
		if not row:
			abort(404)
		return make_response(jsonify({'element': row}), 200)

class ElementList(Resource):
	def get(self):
		rows = getFromDb('getElements')
		print(rows)
		return make_response(jsonify({'elements': rows}), 200)
