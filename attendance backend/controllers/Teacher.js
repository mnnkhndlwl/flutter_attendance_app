import { db } from "../config.js";
import jwt from "jsonwebtoken";

export const loginTeacher = async (req,res,next) => {
    const q = "Select * from teacher where `email` = ? and `password` = ?";
    
    const values = [req.body.email,req.body.password];

    db.query(q, [...values], (err, data) => {
        if (err) {
          console.log(err);
          return res.json(err);
        }
        const token = jwt.sign({teacherName : data[0].teacherName}, process.env.key );
        const {password, ...others } = data[0];
        return res.json({token,...others});
      });
};

export const checkToken = async (req,res,next) => {
  try {
    const token = req.header("token");
    if (!token) return res.json(false);
    const verified = jwt.verify(token, process.env.key);
    if (!verified) return res.json(false);

    // const user = await User.findById(verified.id);
    // if (!user) return res.json(false);
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

export const getTeacher = async (req,res,next) => {
  const q = "select * from teacher where `teacherName`=?";

  db.query(q, req.teacherName, (err, data) => {
    console.log(req.teacherName);
      if (err) {
        console.log(err);
        return res.json(err);
      }
      return res.json({token: req.token ,...data[0]});
    });
};