import { db } from "../config.js";

export const loginTeacher = async (req,res,next) => {
    const q = "Select * from teacher where `email` = ? and `password` = ?";
    
    const values = [req.body.email,req.body.password];

    db.query(q, [...values], (err, data) => {
        if (err) return res.json(err);
        return res.json(data);
      });
};