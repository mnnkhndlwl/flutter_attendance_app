import express from "express";
import { takeAttendance } from "../controllers/Attendance.js";

const router = express.Router();

// take attendance
router.post("/takeAttendance/:enrollment_no", takeAttendance);

export default router;