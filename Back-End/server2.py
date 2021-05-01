from flask import Flask, jsonify, request
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


# -- connect to mqtt brocker
@mqtt.on_connect()
def handle_connect(client, userdata, flags, rc):
    allTopics = mongo.db.topics.find()
    for e in allTopics:
        mqtt.subscribe(e['topic'] + 'counter')
    
    

def getLastIdCounter():
    coll = mongo.db.counter.find()
    for p in coll:
        pass
    return int(p["_id"]) + 1

def getLastIdTopic():
    coll = mongo.db.topics.find()
    for p in coll:
        pass
    return int(p["_id"]) + 1

# -- mqtt messages & inserssion in database
@mqtt.on_message()
def handle_mqtt_message(client, userdata, message):
   
    data = dict(
        topic=message.topic,
        payload=message.payload.decode()
    )
    
    lastId = getLastIdCounter()
    mongo.db.counter.insert_one({
        "_id": lastId,
        'topic' : message.topic, 
        'payload':message.payload.decode(), 
        'date': datetime.datetime.utcnow()
    })
    

    print(data ,' ==>  ', dateFormate)
    

# -- login api
@app.route('/login', methods = ["Get", "POST"])
def login():
    if request.method == "POST":
        email = request.form['email']
        password = request.form["password"]

        login = mongo.db.employees.find_one({"E-mail":email, "Password" : password})
        if login is not None :
            return jsonify(login)
    return jsonify({"status" : "not found"})

# -- add topic api
@app.route('/topic/add', methods = ["Get", "POST"])
def addTopic():

    topics = mongo.db.topics.find()
    allTopics = [e['topic'] for e in topics]
    id = getLastIdTopic()

    if request.method == "POST" :
        nameTopic = request.form['nameTopic']
        if nameTopic not in allTopics:
            mongo.db.topics.insert_one({
                "_id": id,
                'topic' : nameTopic
            })
            return jsonify({"status" : "Topic added successfully"})

    return jsonify({"status" : "Failed to add topic"})

# -- delete topic api
@app.route('/topic/delete', methods = ["Get", "POST"])
def deleteTopic():

    if request.method == "POST" :
        nameTopic = request.form['nameTopic']
        
        try :
            mongo.db.topics.delete_one({ 'topic' : nameTopic })
            return jsonify({"status" : "Topic deleted successfully"})
        except :                
            return jsonify({"status" : "Failed to delete topic"})

@app.route('/', methods = ["Get"])
def testApi():
    print('flutter !! =============================================')
    return jsonify({"status" : "test reussite !"})


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)