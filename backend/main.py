from fastapi import FastAPI , HTTPException
import tensorflow as tf
import numpy as np
import pandas as pd
from pydantic import BaseModel
from contextlib import asynccontextmanager
import psycopg2
from database import db
from fastapi.middleware.cors import CORSMiddleware


# load model
try:
    model = tf.keras.models.load_model("ensemble_model.h5")
    print("✅ AI Model Loaded Successfully")
except Exception as e:
    print("❌ Error Loading Model:", e)

# Connect DataBase
@asynccontextmanager
async def lifespan(app: FastAPI):
    print("🔄 Connecting to database...")
    await db.connect()
    yield
    print("❌ Disconnecting from database...")
    await db.disconnect()

app = FastAPI(lifespan=lifespan)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  
    allow_credentials=True,
    allow_methods=["*"],  
    allow_headers=["*"], 
)
class HealthInput(BaseModel):
    age: int
    gender: int
    cholesterol: float
    blood_pressure: float
    glucose: float
    bmi: float
    smoking: int
    alcohol: int
    physical_activity: int
    family_history: int
    diet: int
    sleep_hours: float
    stress_level: int
    medication: int
    heart_rate: int
    systolic_bp: float
    diastolic_bp: float
    waist_size: float

@app.post("/predict")
async def predict_health(data: HealthInput):
    try:
        input_data = np.array([[
            data.age, data.gender, data.cholesterol, data.blood_pressure, data.glucose, data.bmi,
            data.smoking, data.alcohol, data.physical_activity, data.family_history, data.diet,
            data.sleep_hours, data.stress_level, data.medication, data.heart_rate,
            data.systolic_bp, data.diastolic_bp, data.waist_size
        ]])
        prediction = model.predict(input_data)[0][0]

        # บันทึกข้อมูลลงฐานข้อมูลผ่าน Prisma
        result = await db.prediction.create(
            data={
                "age": data.age,
                "gender": data.gender,
                "cholesterol": data.cholesterol,
                "blood_pressure": data.blood_pressure,
                "glucose": data.glucose,
                "bmi": data.bmi,
                "smoking": data.smoking,
                "alcohol": data.alcohol,
                "physical_activity": data.physical_activity,
                "family_history": data.family_history,
                "diet": data.diet,
                "sleep_hours": data.sleep_hours,
                "stress_level": data.stress_level,
                "medication": data.medication,
                "heart_rate": data.heart_rate,
                "systolic_bp": data.systolic_bp,
                "diastolic_bp": data.diastolic_bp,
                "waist_size": data.waist_size,
                "prediction": float(prediction),
            }
        )

        return {"id": result.id, "prediction": float(prediction)}
    except Exception as e:
        return {"error": str(e)}

# API สำหรับดูข้อมูลที่บันทึกไว้ทั้งหมด
@app.get("/predictions")
async def get_predictions():
    try:
        predictions = await db.prediction.find_many()
        return predictions
    except Exception as e:
        return {"error": str(e)}