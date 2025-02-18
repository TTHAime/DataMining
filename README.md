# Project DataMining
## Status
-BackEnd ไม่ 100% ต้องรอ model เสร็จ DB ได้แล้ว แต่ api ไม่ชัว
-Front เอา component ปรับเอา

## 🚀 Features
- 🏥 Predicts possible diseases based on user input.
- 🧠 Uses machine learning to analyze patterns.
- 🌐 Web-based with **Next.js**, **Python**, and **PostgreSQL**.

## 🛠 Tool
Frontend	    Next.js + TailwindCSS
Backend	      FastAPI (Python)
Database	    PostgreSQL + Prisma ORM
AI Model	    TensorFlow (Keras)
API Testing	  Postman

## Extension
โหลดเกี่ยว node react next prisma python
## ติดตั้ง BackEnd
Python 3.12.9
# in cmd
pip install fastapi uvicorn tensorflow numpy pandas psycopg2-binary prisma

setup DataBase
- prisma init
create Datamining Database in pgAdmin
prisma migrate dev --name migratename

in env
DATABASE_URL="postgresql://username:password@localhost:5432/Datamining?schema=public"

running backend
uvicorn main:app --reload --host 0.0.0.0 --port 8000

running frontend
- npm run dev
- เข้าไปที่ http://localhost:3000

