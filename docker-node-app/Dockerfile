# โหลด image ของ node จาก docker hub
FROM node:alpine

# กำหนด directory ที่จะใช้เก็บไฟล์ของโปรเจค
WORKDIR /app

# คัดลอกไฟล์ package.json และ package-lock.json ไปยัง directory ที่กำหนดไว้
COPY package*.json ./

# ติดตั้ง package ที่ระบุในไฟล์ package.json
RUN npm install

# ติดตั้ง nodemon เพื่อใช้ในการรันโปรเจค
RUN npm install -g nodemon

# คัดลอกไฟล์ทั้งหมดไปยัง directory ที่กำหนดไว้
COPY . .

# ระบุ port ที่จะใช้
EXPOSE 3000

# รันคำสั่ง npm run dev เมื่อ container ถูกสร้างขึ้น
CMD ["npm", "run", "dev"]