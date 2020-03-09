from flask import Flask, jsonify, abort, request, make_response, session
from flask_restful import reqparse, Resource, Api

from common.dbUtil import *

class Effect(Resource):
	def get(self, effect_id):
		row = getFromDb('getEffect', (effect_id))
		if not row:
			abort(404)
		return make_response(jsonify({'effect': row}), 200)

class EffectList(Resource):
	def get(self):
		rows = getFromDb('getEffects')
		print(rows)
		return make_response(jsonify({'effects': rows}), 200)
