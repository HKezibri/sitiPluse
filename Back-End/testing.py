from flask import Flask
from flask_pymongo import PyMongo 

app = Flask(__name__)
app.config["MONGO_URI"] = "mongodb://localhost:27017/MQTT"
mongo = PyMongo(app)
topic1 = 'F01/R01/M01/counter'
topic2 = 'F01/R01/M02/counter'
topic3 = 'F01/R01/M03/counter'
topic4 = 'F01/R01/M04/counter'
topic5 = 'F01/R01/M05/counter'
topic6 = 'F01/R01/M06/counter'
topic7 = 'F01/R01/M07/counter'
topic8 = 'F01/R01/M08/counter'
topic9 = 'F01/R01/M09/counter'

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
for e in allTopics:
    print(e['_id'])