from flask import Flask
from flask_pymongo import PyMongo 

app = Flask(__name__)
app.config["MONGO_URI"] = "mongodb://localhost:27017/MQTT"
mongo = PyMongo(app)
topic1 = 'F01/R01/M01/'
topic2 = 'F01/R01/M02/'
topic3 = 'F01/R01/M03/'
topic4 = 'F01/R01/M04/'
topic5 = 'F01/R01/M05/'
topic6 = 'F01/R01/M06/'
topic7 = 'F01/R01/M07/'
topic8 = 'F01/R01/M08/'
topic9 = 'F01/R01/M09/'

listTopics = [
    topic1, topic2, topic3, topic4, topic5, topic6, topic7, topic8, topic9
]


for numTopic, topic in enumerate(listTopics):
    try:
        mongo.db.topics.insert_one({
            "_id": numTopic + 1,
            'topic' : topic
        })
    except:
        print('alredy axist')

"""
allTopics = mongo.db.counter.find()
cpt = 0
for e in allTopics:
    if int(e["payload"]) == 0 :
        cpt = cpt + 1
        print(e["topic"])

print(cpt)
"""

"""
emps = [
    {
        "_id": "JM11111",
        "F-Name" : "Abdellah",
        "L-Name" : "ELAAROUB",
        "E-mail" : "abdouelaaroub@gmail.com",
        "Password" : "abdouidsd",
        "Grade" : "admin"
    },
    {
        "_id": "JM22222",
        "F-Name" : "Hiba",
        "L-Name" : "QEZIBRI",
        "E-mail" : "qezibrihiba@gmail.com",
        "Password" : "hibaidsd",
        "Grade" : "admin"
    },
    {
        "_id": "JB33333",
        "F-Name" : "Walid",
        "L-Name" : "DAMOU",
        "E-mail" : "damou.walid.2015@gmail.com",
        "Password" : "walididsd",
        "Grade" : "employee"
    },
    {
        "_id": "JB44444",
        "F-Name" : "Khawla",
        "L-Name" : "HAMOUICHOU",
        "E-mail" : "hamouichoukhawla@gmail.com",
        "Password" : "khawlaidsd",
        "Grade" : "employee"
    }
    
]

for employee in emps:
    try:
        mongo.db.employees.insert_one(employee)
        print("successfuly")
    except:
        print('alredy axist')
"""


