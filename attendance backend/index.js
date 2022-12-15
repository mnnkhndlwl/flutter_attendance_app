import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import teacherRoute from "./routes/teacher.js";

dotenv.config();
const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use("/api/teacher",teacherRoute);

app.listen(8800, () => {
    console.log("Connected to backend.");
  });
  