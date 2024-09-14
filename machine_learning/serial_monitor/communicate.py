import serial
import time
import firebase_admin
from firebase_admin import credentials, firestore

cred = credentials.Certificate(r'C:\Users\pavan\StudioProjects\VIT_Hackathon\machine_learning\serial_monitor\general-firebase-affd9-firebase-adminsdk-3hqrc-22fe66b56c.json')
firebase_admin.initialize_app(cred)
db = firestore.client()

ser = serial.Serial('COM3', 115200, timeout=1)
time.sleep(2)

def push_to_firebase(data):
    doc_ref = db.collection('sensorData').document('latestData')
    doc_ref.set(data)

try:
    while True:
        if ser.in_waiting > 0:
            line = ser.readline().decode('utf-8', errors='ignore').rstrip()
            print(line)

            if "MQ2" in line: 
                data = {}
                parts = line.split(',')  

                for part in parts:
                    key, value = part.split(':')
                    key = key.strip()
                    value = value.strip()

                    if key == 'Temp':
                        data['Temperature'] = float(value.replace('C', '').strip())  
                    elif key == 'Humidity':
                        data['Humidity'] = float(value.replace('%', '').strip())  
                    else:
                        data[key] = float(value)  

                
                push_to_firebase(data)

                time.sleep(2)

except KeyboardInterrupt:
    print("Program interrupted")
finally:
    ser.close()
