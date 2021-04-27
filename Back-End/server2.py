from flask import Flask
from flask_mqtt import Mqtt
from flask_pymongo import PyMongo   # pip install Flask-PyMongo
import datetime


app = Flask(__name__)

app.secret_key = 'ELAAROUB_QEZIBRI'

app.config["MONGO_URI"] = "mongodb://localhost:27017/MQTT"
mongo = PyMongo(app)

app.config['MQTT_BROKER_URL'] = '144.91.113.92'  
app.config['MQTT_BROKER_PORT'] = 1883 
app.config['MQTT_USERNAME'] = 'siti' 
app.config['MQTT_PASSWORD'] = 'siti@2021'  
app.config['MQTT_KEEPALIVE'] = 30 

mqtt = Mqtt(app)



@mqtt.on_connect()
def handle_connect(client, userdata, flags, rc):
    allTopics = mongo.db.topics.find()
    for e in allTopics:
        mqtt.subscribe(e['topic'])
    
    

def getLastIdcounter():
    coll, d = mongo.db.counter.find(), {}
    for p in coll:
        pass
    d = p
    return int(d["_id"])


@mqtt.on_message()
def handle_mqtt_message(client, userdata, message):
    
    DATE = datetime.datetime.now()
    jour = DATE.strftime("%d")
    mois = DATE.strftime("%m")
    annee = DATE.year
    heure = DATE.strftime("%H")
    minutes = DATE.strftime("%M")
    seconds = DATE.strftime("%S")


    data = dict(
        topic=message.topic,
        payload=message.payload.decode()
    )
    
    dateFormate = {
        'annee': str(annee), 'mois' : mois, 'jour': jour, 'heure' : heure, 'minutes' : minutes, 'seconds' : seconds
    }

    lastId = getLastIdcounter() + 1

    mongo.db.counter.insert_one({
        "_id": lastId,
        'topic' : message.topic, 
        'payload':message.payload.decode(), 
        'date': dateFormate
        })


    print(data ,' ==>  ', dateFormate)
    


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)