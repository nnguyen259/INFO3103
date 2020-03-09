from flask import Flask, jsonify, abort, request, make_response, session
from flask_restful import reqparse, Resource, Api

from common.dbUtil import *

class Character(Resource):
	def get(self, character_id):
		row = getFromDb('getCharacter', (character_id))
		if not row:
			abort(404)
		return make_response(jsonify({'character': row}), 200)

class CharacterList(Resource):
	def get(self):
		rows = getFromDb('getCharacters')
		print(rows)
		return make_response(jsonify({'characters': rows}), 200)
