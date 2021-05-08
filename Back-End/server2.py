from flask import Flask, jsonify, request, session
from flask_mqtt import Mqtt
from flask_pymongo import PyMongo   # pip install Flask-PyMongo
import datetime
import json
import random


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
    try :
        for p in coll:
            pass
        return int(p["_id"]) + 1
    except :
        return 1

def getLastIdTopic():
    coll = mongo.db.topics.find()
    for p in coll:
        pass
    return int(p["_id"]) + 1

def isEmpty(word):
    if word:
        return False
    return True


def newPwd() :
    nbr = ''
    for e in range(6):
        nbr = nbr + str(random.randint(1,9))
    return nbr


def sendmail(mail):
    import smtplib
    server = smtplib.SMTP_SSL("smtp.gmail.com")
    server.login("abdouelaaroub@gmail.com", "AbdouDUT05")
    server.sendmail("abdouelaaroub@gmail.com", mail, "Sign up by this passwword : \t" + newPwd())
    server.quit()

# -- mqtt messages & inserssion in database
@mqtt.on_message()
def handle_mqtt_message(client, userdata, message):
   
    data = dict(
        topic=message.topic,
        payload=message.payload.decode()
    )
    """
    if int(datetime.datetime.utcnow().hour) >= 9 and int(datetime.datetime.utcnow().hour) <= 16:
        lastId = getLastIdCounter()
        mongo.db.counter.insert_one({
            "_id": lastId,
            'topic' : message.topic, 
            'payload':message.payload.decode(), 
            'date': datetime.datetime.utcnow()
        })
    """

    print(data ,' ==>  ', datetime.datetime.utcnow())
    


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

@app.route('/topics', methods = ["Get"])
def testApi():
    allTopics = mongo.db.topics.find()
    topics = []
    for e in allTopics:
        topics.append(e['topic'] + 'counter')
    print('flutter !! =============================================')
    return jsonify({"topics" : topics, "name" : "abdou"})

#mqtt.publish('F01/R01/M04/flow', 22)


# -- login api
@app.route('/login', methods = ["Get", "POST"])
def Login():
    global Email
    global Password
    if request.method == "POST":
        print('respons ---------------------------------/////')
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        Email = request_data['Email']
        Password = request_data['Password']
        print('++++++++++++++++++++++++++++++++++++++++++++++ Hi ', Email, "your password is  ", Password)
       
    User = mongo.db.employees.find_one({"Email":Email, "Password": Password})

    if isEmpty(User): 
        return jsonify({"status" : False})
    else :
        session["Name"] = User["Name"]
        session["id"] = User["_id"]
        session["Email"] = User["Email"]
        session["Password"] = User["Password"]
        session["Role"] = User["Role"]
        return jsonify({
            "status" : True,
            "Name" : User["Name"],
            "id" : User["_id"],
            "Email" : User["Email"],
            "Role" : User["Role"]
        })


# -- Sign In api
@app.route('/signin', methods = ["Get", "POST"])
def SignIn():
    
    if request.method == "POST" :
        print('respons  <---------------------------------------------------|')
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))
        
        if request_data['Password'] != request_data['R_Password'] :
            return jsonify({"status" : "Wrong repeatation of password"})
        print('---------------------------------->', request_data['Name'])
        try:
            mongo.db.employees.insert_one({
            "_id": request_data['CIN'],
            "Name": request_data['Name'],
            "Email": request_data['Email'],
            "Password" : request_data['Password'],
            "Role": "Controleur"
            })
        except:
            print('Mayb alredy existe..')









if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)