from flask import Flask, jsonify, abort, request, make_response, session
from flask_restful import reqparse, Resource, Api

from common.dbUtil import *
import settings

class Project(Resource):
	def get(self, project_id):
		row = getFromDb('getProject', (project_id))
		if not row:
			abort(404)
		return make_response(jsonify({'project': row}), 200)
	def delete(self, project_id):
		if 'username' not in session:
			abort(403)
		row = postToDb('deleteProject', project_id)
		uri = 'http://'+settings.APP_HOST+':'+str(settings.APP_PORT)
		uri = uri+str(request.url_rule)+'/'
		return make_response(jsonify( { "uri" : uri } ), 200)

class ProjectList(Resource):
	def get(self):
		rows = getFromDb('getProjects')
		print(rows)
		return make_response(jsonify({'projects': rows}), 200)

	def post(self):
		if 'username' not in session:
			abort(403)
		if not request.json or not 'Name' in request.json:
			abort(400) # bad request

		name = request.json['Name']
		publicStatus = request.json['Visibility'] == 'True'

		row = postToDb('createProject', name, session['username'], publicStatus)
		uri = 'http://'+settings.APP_HOST+':'+str(settings.APP_PORT)
		uri = uri+str(request.url_rule)+'/'+str(row['LAST_INSERT_ID()'])
		return make_response(jsonify( { "uri" : uri } ), 201) # successful resource creation
