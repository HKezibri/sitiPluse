from flask import Flask
from flask_pymongo import PyMongo 
import datetime
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
 
DATE = datetime.datetime.now()
jour = DATE.strftime("%d")
mois = DATE.strftime("%m")
annee = DATE.year
heure = DATE.strftime("%H")
minutes = DATE.strftime("%M")
seconds = DATE.strftime("%S")
"""
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
        "Name" : "Abdellah-ELAAROUB",
        "Email" : "abdouelaaroub@gmail.com",
        "Password" : "abdouidsd",
        "Role" : "admin"
    },
    {
        "_id": "JM22222",
        "Name" : "Hiba-QEZIBRI",
        "Email" : "qezibrihiba@gmail.com",
        "Password" : "hibaidsd",
        "Role" : "admin"
    },
    {
        "_id": "JB33333",
        "Name" : "Walid-DAMOU",
        "Email" : "damou.walid.2015@gmail.com",
        "Password" : "walididsd",
        "Role" : "Controleur"
    },
    {
        "_id": "JB44444",
        "Name" : "Khawla-HAMOUICHOU",
        "Email" : "hamouichoukhawla@gmail.com",
        "Password" : "khawlaidsd",
        "Role" : "Controleur"
    }
    
]

for employee in emps:
    try:
        mongo.db.employees.insert_one(employee)
        print("successfuly")
    except:
        print('alredy axist')

import smtplib
server = smtplib.SMTP_SSL("smtp.gmail.com")
server.login("abdouelaaroub@gmail.com", "AbdouDUT05")
server.sendmail("abdouelaaroub@gmail.com", "kezibri.hiba@gmail.com", "Hi Hiba, jsut sending email test using python")
server.quit()
"""


allTopics = mongo.db.counter.find({"topic" : "F01/R01/M01/counter"})
listDay = []
for e in allTopics:
    #print(e, '  ==>  ')
    #print(e["date"].month)
    listDay.append(e['date'])
print(len(listDay))
print(int(str(listDay[6] - listDay[0]).split(':')[1]))