import express from "express";
import { loginTeacher } from "../controllers/Teacher.js";

const router = express.Router();

// login teacher
router.post("/login", loginTeacher);

export default router;