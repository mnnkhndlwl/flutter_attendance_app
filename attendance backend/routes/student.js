import express from "express";
import { ShowStudents } from "../controllers/Student.js";

const router = express.Router();

// take attendance
router.post("/showstudents", ShowStudents);

export default router;