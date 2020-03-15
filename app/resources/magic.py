from flask import Flask, jsonify, abort, request, make_response, session
from flask_restful import reqparse, Resource, Api

from common.dbUtil import *

def format(magic):
    category = getFromDb('getCategory', magic['category_id'])[0]
    magic['category'] = category
    magic.pop('category_id')
    
    character = getFromDb('getCharacter', magic['character_id'])[0]
    magic['character'] = character
    magic.pop('character_id')
    
    type = getFromDb('getType', magic['type_id'])[0]
    magic['type'] = type
    magic.pop('type_id')
    
    element = getFromDb('getElement', magic['element_id'])[0]
    magic['element'] = element
    magic.pop('element_id')
    
    targetType = getFromDb('getTargetType', magic['target_type_id'])[0]
    magic['target_type'] = targetType
    magic.pop('target_type_id')
    
    project = getFromDb('getProject', magic['project_id'])[0]
    magic['project'] = project
    magic.pop('project_id')
    
    effect1 = getFromDb('getEffect', magic['effect1_id'])[0]
    magic['effect1'] = effect1
    magic['effect1']['data1'] = magic['effect1_data1']
    magic['effect1']['data2'] = magic['effect1_data2']
    magic.pop('effect1_id')
    magic.pop('effect1_data1')
    magic.pop('effect1_data2')
    
    effect2 = getFromDb('getEffect', magic['effect2_id'])[0]
    magic['effect2'] = effect2
    magic['effect2']['data1'] = magic['effect2_data1']
    magic['effect2']['data2'] = magic['effect2_data2']
    magic.pop('effect2_id')
    magic.pop('effect2_data1')
    magic.pop('effect2_data2')
    return magic

class Magic(Resource):
    def get(self, project_id, magic_id):
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
        row = getFromDb('getMagic', project_id, magic_id)
        if not row:
            abort(404)
        magic = row[0]
        magic = format(magic)
        
        
        return make_response(jsonify({'magic': row}), 200)
    
class MagicList(Resource):
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
        row = getFromDb('getMagics', project_id)
        if not row:
            abort(404)
        keyToKeep = ['id', 'project_id', 'magic_id', 'name', 'description']
        for magic in row:
            for key in list(magic):
                if key not in keyToKeep:
                    magic.pop(key)
        return make_response(jsonify({'magic': row}), 200)