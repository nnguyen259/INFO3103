import pymysql.cursors
import os
import struct

path = '../output/t_magic.tbl'
os.makedirs(os.path.dirname(path), exist_ok=True)
f = open(path, 'wb')

connection = pymysql.connect(host='localhost',
                             user='root',
                             password='maria',
                             db='project',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

with connection.cursor() as cursor:
    sql = "select * from magics"
    cursor.execute(sql)
    output = cursor.fetchall()
    
print(struct.pack("<H", len(output)))
f.write(struct.pack("<H", len(output)))

for magic in output:
    print(magic)
    f.write('magic'.encode())
    f.write(b'\x00')
    length = len(magic.get('label')) + len(magic.get('name')) + len(magic.get('description')) + len(magic.get('animation')) + 32
    f.write(struct.pack("<H", length))
    f.write(struct.pack("<H", magic.get('magic_id')))
    f.write(struct.pack("<H", magic.get('character_id')))
    f.write(magic.get('label').encode() + b'\x00')
    f.write(struct.pack("B", magic.get('category_id')))
    f.write(struct.pack("B", magic.get('type_id')))
    f.write(struct.pack("B", magic.get('element_id')))
    f.write(struct.pack("B", magic.get('target_type_id')))
    f.write(struct.pack("B", magic.get('target_range')))
    f.write(struct.pack("B", magic.get('target_size')))
    f.write(struct.pack("B", magic.get('effect1_id')))
    f.write(struct.pack("<H", magic.get('effect1_data1')))
    f.write(struct.pack("<H", magic.get('effect1_data2')))
    f.write(struct.pack("B", magic.get('effect2_id')))
    f.write(struct.pack("<H", magic.get('effect2_data1')))
    f.write(struct.pack("<H", magic.get('effect2_data2')))
    f.write(struct.pack("B", magic.get('cast_delay')))
    f.write(struct.pack("B", magic.get('recovery_delay')))
    f.write(struct.pack("<H", magic.get('cost')))
    f.write(struct.pack("B", magic.get('unbalance')))
    f.write(struct.pack("B", magic.get('level_learn')))
    f.write(struct.pack("<H", magic.get('sort_id')))
    f.write(magic.get('animation').encode() + b'\x00')
    f.write(magic.get('name').encode() + b'\x00')
    f.write(magic.get('description').encode() + b'\x00')
    