import express from "express";
import { checkToken, getTeacher, loginTeacher } from "../controllers/Teacher.js";
import { auth } from "../middlewares/auth.js";
const router = express.Router();

// login teacher
router.post("/login", loginTeacher);

router.post("/isValid", checkToken);

router.get("/",auth,getTeacher);

export default router;