import { db } from "../config.js";

const currentDate = new Date();

export const displaySubjects = async (req, res, next) => {
  var q =
    "select * from subjects where teacherName = ? ";

  var values = [
    req.body.teacherName
  ];

  db.query(q, [...values], (err, data) => {
    if (err) return res.json(err);
    return res.status(200).send(data);
  });
};
