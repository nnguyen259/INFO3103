#!/usr/bin/env python3
import sys
from flask import Flask, jsonify, abort, request, make_response, session
from flask_restful import reqparse, Resource, Api
from flask_session import Session
import json
from ldap3 import Server, Connection, ALL
from ldap3.core.exceptions import *
import ssl #include ssl libraries

import settings # Our server and db settings, stored in settings.py

from resources.signin import SignIn
from resources.category import Category, CategoryList
from resources.character import Character, CharacterList
from resources.effect import Effect, EffectList
from resources.element import Element, ElementList
from resources.targetType import TargetType, TargetTypeList
from resources.type import Type, TypeList
from resources.project import Project, ProjectList, ProjectsByUser, CollaboratorsInProject, projectsWithCollaborator
from resources.magic import Magic, MagicList

app = Flask(__name__)
# Set Server-side session config: Save sessions in the local app directory.
app.secret_key = settings.SECRET_KEY
app.config['SESSION_TYPE'] = 'filesystem'
app.config['SESSION_COOKIE_NAME'] = 'peanutButter'
app.config['SESSION_COOKIE_DOMAIN'] = settings.APP_HOST
Session(app)


####################################################################################
#
# Error handlers
#
@app.errorhandler(400) # decorators to add to 400 response
def not_found(error):
	return make_response(jsonify( { 'status': 'Bad request' } ), 400)

@app.errorhandler(404) # decorators to add to 404 response
def page_not_found(error):
	return make_response(jsonify( { 'status': 'Resource not found' } ), 404)



####################################################################################
#
# Identify/create endpoints and endpoint objects
#
api = Api(app)
api.add_resource(SignIn, '/signin')
api.add_resource(CategoryList, '/categories', '/categories/')
api.add_resource(Category, '/categories/<category_id>')
api.add_resource(CharacterList, '/characters', '/characters/')
api.add_resource(Character, '/characters/<character_id>')
api.add_resource(EffectList, '/effects', '/effects/')
api.add_resource(Effect, '/effects/<effect_id>')
api.add_resource(ElementList, '/elements', '/elements/')
api.add_resource(Element, '/elements/<element_id>')
api.add_resource(TargetTypeList, '/targetTypes', '/targetTypes/')
api.add_resource(TargetType, '/targetTypes/<targetType_id>')
api.add_resource(TypeList, '/types', '/types/')
api.add_resource(Type, '/types/<type_id>')
api.add_resource(ProjectList, '/projects', '/projects/')
api.add_resource(Project, '/projects/<project_id>')
api.add_resource(MagicList, '/projects/<project_id>/magics')
api.add_resource(Magic, '/projects/<project_id>/magics/<magic_id>')
api.add_resource(ProjectsByUser, '/user/<username>/projects')
api.add_resource(CollaboratorsInProject, '/projects/<project_id>/shared')
api.add_resource(projectsWithCollaborator, '/user/projects/shared')

#############################################################################
# xxxxx= last 5 digits of your studentid. If xxxxx > 65535, subtract 30000
if __name__ == "__main__":
	#
	context = ('cert.pem', 'key.pem') # Identify the certificates you've generated.
	app.run(
		host=settings.APP_HOST,
		port=settings.APP_PORT,
		ssl_context=context,
		debug=settings.APP_DEBUG)
