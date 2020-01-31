import os
import pymysql.cursors

path = '../data/text/dat_us/t_magic.tbl'
f = open(path, 'rb')
f.read(2)

connection = pymysql.connect(host='localhost',
                             user='root',
                             password='maria',
                             db='project',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

while f.tell() < os.path.getsize(path):
    f.read(5)  # magic
    f.read(1)  # skip 00

    f.read(1)  # length
    f.read(1)  # skip 00

    id = int.from_bytes(f.read(2), byteorder='little')

    character_id = int.from_bytes(f.read(2), byteorder='little')

    label = ""
    temp = f.read(1)
    while temp != b'\x00':
        label += temp.decode('utf-8')
        temp = f.read(1)
    # print("label=%s" % label)

    category = int.from_bytes(f.read(1), byteorder='little')
    type = int.from_bytes(f.read(1), byteorder='little')
    element = int.from_bytes(f.read(1), byteorder='little')

    target_type = int.from_bytes(f.read(1), byteorder='little')
    target_range = int.from_bytes(f.read(1), byteorder='little')
    target_size = int.from_bytes(f.read(1), byteorder='little')

    e1 = int.from_bytes(f.read(1), byteorder='little')
    e1d1 = int.from_bytes(f.read(2), byteorder='little')
    e1d2 = int.from_bytes(f.read(2), byteorder='little')

    e2 = int.from_bytes(f.read(1), byteorder='little')
    e2d1 = int.from_bytes(f.read(2), byteorder='little')
    e2d2 = int.from_bytes(f.read(2), byteorder='little')

    cast_delay = int.from_bytes(f.read(1), byteorder='little')
    recovery_delay = int.from_bytes(f.read(1), byteorder='little')
    cost = int.from_bytes(f.read(2), byteorder='little')
    unbalance = int.from_bytes(f.read(1), byteorder='little')
    level_learn = int.from_bytes(f.read(1), byteorder='little')

    sort_id = int.from_bytes(f.read(2), byteorder='little')

    animation = ""
    temp = f.read(1)
    while temp != b'\x00':
        animation += temp.decode('utf-8')
        temp = f.read(1)
    # print("animation=%s" % animation)

    name = ""
    temp = f.read(1)
    while temp != b'\x00':
        name += temp.decode('utf-8')
        temp = f.read(1)
    # print("name=%s" % name)

    desc = ""
    temp = f.read(1)
    while temp != b'\x00':
        desc += temp.decode('utf-8')
        temp = f.read(1)
    # print("desc=%s" % desc)
    # print()
    
    
    with connection.cursor() as cursor:
        # Create a new record
        sql = "addMagic"
        cursor.callproc(sql, [1, id, sort_id, name, desc, animation, label, character_id, category, type, element, target_type, target_range, target_size, e1, e1d1, e1d2, e2, e2d1, e2d2, cast_delay, recovery_delay, cost, unbalance, level_learn])

    # connection is not autocommit by default. So you must commit to save
    # your changes.
    connection.commit()
