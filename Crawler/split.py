import json
import os

os.makedirs('sublist', exist_ok=True)

tot_cnt = 31
input_json_path = "activity_net.v1-3.min.json"
data = open(input_json_path, 'r')
data = json.load(data)
index = 0
out_list = [dict() for i in range(tot_cnt)]
for key in data["database"]:
    # print data["database"][key]
    out_list[index].setdefault(key, data["database"][key])
    index += 1
    if index >= tot_cnt:
        index -= tot_cnt
for i in range(tot_cnt):
    output={}
    output.setdefault('database', out_list[i])
    with open('sublist/sublist%d.json' % (i), 'w') as f:
        json.dump(output, f)
