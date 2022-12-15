import express from "express";
import cors from "cors";
import dotenv from "dotenv";

dotenv.config();
const app = express();
app.use(cors());
app.use(express.json());



app.listen(8800, () => {
    console.log("Connected to backend.");
  });
  