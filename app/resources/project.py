from flask import Flask, jsonify, abort, request, make_response, session
from flask_restful import reqparse, Resource, Api

from common.dbUtil import *
import settings

class Project(Resource):
	def get(self, project_id):
		row = getFromDb('getProject', (project_id))
		if not row:
			abort(404)
		if not row[0]['isPublic']:
			if 'username' not in session:
				abort(403)
			if session['username'] != row[0]['owner']:
				collabs = getFromDb('collaboratorsInProjects', project_id)
				print(collabs)
				if not session['username'] in [d['username'] for d in collabs] :
					abort(403)
		return make_response(jsonify({'project': row}), 200)
	def delete(self, project_id):
		if 'username' not in session:
			abort(403)
		row = getFromDb('getProject', project_id)
		if not row:
			abort(404)
		if row[0]['owner'] != session['username']:
			abort(403, 'User not authorized')
		row = postToDb('deleteProject', project_id)
		uri = 'http://'+settings.APP_HOST+':'+str(settings.APP_PORT)
		uri = uri+'/projects'
		return make_response(jsonify( { "uri" : uri } ), 200)
	def put(self, project_id):
		if 'username' not in session:
			abort(403)
		if not request.json:
			abort(400)
		row = getFromDb('getProject', project_id)
		if not row:
			abort(404)
		if row[0]['owner'] != session['username']:
			abort(403)
		
		newName = request.json['Name'] if 'Name' in request.json else row[0]['Name']
		newPublicStatus = request.json['Visibility'] == 'True' if 'Visibility' in request.json else row[0]['Visibility']
		
		row = postToDb('editProject', project_id, newName, newPublicStatus)
		uri = 'http://'+settings.APP_HOST+':'+str(settings.APP_PORT)
		uri = uri+'/projects'+'/'+ project_id
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
		if not 'Base' in request.json:
			baseId = 1
		else: baseId = request.json['Base']

		name = request.json['Name']
		publicStatus = request.json['Visibility'] == 'true'

		row = postToDb('createProject', name, session['username'], publicStatus)
		
		baseProject = getFromDb('getProject', baseId)
		if not baseProject:
			baseProject = getFromDb('getProject')
			baseId = 1
		
		postToDb('duplicateProject', baseId, row['LAST_INSERT_ID()'])
		
		uri = 'https://'+settings.APP_HOST+':'+str(settings.APP_PORT)
		uri = uri+str(request.url_rule)+'/'+str(row['LAST_INSERT_ID()'])
		return make_response(jsonify( { "uri" : uri } ), 201) # successful resource creation
	
class ProjectsByUser(Resource):
	def get(self, username):
		if 'username' in session:
			if username == session['username']:
				rows = getFromDb('getProjectsByUser', username, False)
			else:
				rows = getFromDb('getProjectsByUser', username, True)
		else:
			rows = getFromDb('getProjectsByUser', username, True)
		return make_response(jsonify({'projects': rows}), 200)
	
class CollaboratorsInProject(Resource):
	def get(self, project_id):
		row = getFromDb('getProject', (project_id))
		if not row:
			abort(404)
		if not row[0]['isPublic']:
			if 'username' not in session:
				abort(403)
			if session['username'] != row[0]['owner']:
				collabs = getFromDb('collaboratorsInProjects', project_id)
				if not session['username'] in [d['username'] for d in collabs] :
					abort(403)
		rows = getFromDb('collaboratorsInProjects', project_id)
		return make_response(jsonify({'collaborators': rows}), 200)
	def post(self, project_id):
		if 'username' not in session:
			abort(403)
		if not request.json or not 'User Name' in request.json:
			abort(400)
		row = getFromDb('getProject', project_id)
		if not row:
			abort(404)
		if row[0]['owner'] != session['username']:
			abort(403, 'User not authorized')
			
		nameIn = request.json['User Name']
		postToDb('addCollaborator', nameIn, project_id)
		uri = 'http://'+settings.APP_HOST+':'+str(settings.APP_PORT)
		uri = uri+'/'+'projects/'+project_id+'/shared'
		return make_response(jsonify( { "uri" : uri } ), 200)
	def delete(self, project_id):
		if 'username' not in session:
			abort(403)
		if not request.json or not 'User Name' in request.json:
			abort(400)
		row = getFromDb('getProject', project_id)
		if not row:
			abort(404)
		if row[0]['owner'] != session['username']:
			abort(403, 'User not authorized')
			
		nameIn = request.json['User Name']
		postToDb('deleteCollaborator', nameIn, project_id)
		uri = 'http://'+settings.APP_HOST+':'+str(settings.APP_PORT)
		uri = uri+'/'+'projects/'+project_id+'/shared'
		return make_response(jsonify( { "uri" : uri } ), 200)
	
class projectsWithCollaborator(Resource):
	def get(self):
		if 'username' not in session:
			abort(403)
		row = getFromDb('projectsWithCollaborator', session['username'])
		return make_response(jsonify( { "projects" : row } ), 200)
		