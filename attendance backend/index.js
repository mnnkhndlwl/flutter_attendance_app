import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import teacherRoute from "./routes/teacher.js";
import attendanceRoute from "./routes/attendance.js";
import subjectsRoute from "./routes/subjects.js";

dotenv.config();
const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use("/api/teacher",teacherRoute);
app.use("/api/attendance",attendanceRoute);
app.use("/api/subjects",subjectsRoute);

app.listen(8800,"0.0.0.0" ,() => {
    console.log("Connected to backend.");
  });
  