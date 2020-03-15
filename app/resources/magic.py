from flask import Flask, jsonify, abort, request, make_response, session
from flask_restful import reqparse, Resource, Api

from common.dbUtil import *

class Magic(Resource):
    def get(self, project_id, magic_id):
        row = getFromDb('getMagic', project_id, magic_id)
        if not row:
            abort(404)
        return make_response(jsonify({'magic': row}), 200)
    
class MagicList(Resource):
    def get(self, project_id):
        row = getFromDb('getMagics', project_id)
        if not row:
            abort(404)
        return make_response(jsonify({'magic': row}), 200)