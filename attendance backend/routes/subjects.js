import express from "express";
import { displaySubjects } from "../controllers/Subjects.js";

const router = express.Router();

// take attendance
router.post("/displaySubjects/", displaySubjects);

export default router;