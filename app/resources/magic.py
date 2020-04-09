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
    def put(self, project_id, magic_id):
        if 'username' not in session:
            abort(403)
        if not request.json:
            abort(400)
        row = getFromDb('getProject', (project_id))
        if not row:
            abort(404)
        if session['username'] != row[0]['owner']:
            collabs = getFromDb('collaboratorsInProjects', project_id)
            if not session['username'] in [d['username'] for d in collabs] :
                abort(403)
        
        row = getFromDb("getMagic", project_id, magic_id)
        newSortId = request.json['sort_id'] if 'sort_id' in request.json else row[0]['sort_id']
        
        newName = request.json['name'] if 'name' in request.json else row[0]['name']
        newDesc = request.json['description'] if 'description' in request.json else row[0]['description']
        newAnimation = request.json['animation'] if 'animation' in request.json else row[0]['animation']
        newLabel = request.json['label'] if 'label' in request.json else row[0]['label']
        
        newCharId = request.json['character_id'] if 'character_id' in request.json else row[0]['character_id']
        newCatId = request.json['category_id'] if 'category_id' in request.json else row[0]['category_id']
        newType = request.json['type_id'] if 'type_id' in request.json else row[0]['type_id']
        newElement = request.json['element_id'] if 'element_id' in request.json else row[0]['element_id']
        
        newTargetType = request.json['target_type_id'] if 'target_type_id' in request.json else row[0]['target_type_id']
        newTargetRange = request.json['target_range'] if 'target_range' in request.json else row[0]['target_range']
        newTargetSize = request.json['target_size'] if 'target_size' in request.json else row[0]['target_size']
        
        newEffect1Id = request.json['effect1_id'] if 'effect1_id' in request.json else row[0]['effect1_id']
        newEffect1Data1 = request.json['effect1_data1'] if 'effect1_data1' in request.json else row[0]['effect1_data1']
        newEffect1Data2 = request.json['effect1_data2'] if 'effect1_data2' in request.json else row[0]['effect1_data2']
        
        newEffect2Id = request.json['effect2_id'] if 'effect2_id' in request.json else row[0]['effect2_id']
        newEffect2Data1 = request.json['effect2_data1'] if 'effect2_data1' in request.json else row[0]['effect2_data1']
        newEffect2Data2 = request.json['effect2_data2'] if 'effect2_data2' in request.json else row[0]['effect2_data2']
        
        newCastDelay = request.json['cast_delay'] if 'cast_delay' in request.json else row[0]['cast_delay']
        newRecoveryDelay = request.json['recovery_delay'] if 'recovery_delay' in request.json else row[0]['recovery_delay']
        newCost = request.json['cost'] if 'cost' in request.json else row[0]['cost']
        
        newUnbalance = request.json['unbalance'] if 'unbalance' in request.json else row[0]['unbalance']
        newLevelLearn = request.json['level_learn'] if 'level_learn' in request.json else row[0]['level_learn']
        
        row = postToDb('editMagic', project_id, magic_id, newSortId,
                       newName, newDesc, newAnimation, newLabel,
                       newCharId, newCatId, newType, newElement,
                       newTargetType, newTargetRange, newTargetSize,
                       newEffect1Id, newEffect1Data1, newEffect1Data2,
                       newEffect2Id, newEffect2Data1, newEffect2Data2,
                       newCastDelay, newRecoveryDelay, newCost,
                       newUnbalance, newLevelLearn)
        uri = 'https://'+settings.APP_HOST+':'+str(settings.APP_PORT)
        uri = uri+'/projects'+'/'+ project_id+'/magics/'+magic_id
        return make_response(jsonify( { "uri" : uri } ), 200)
    
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