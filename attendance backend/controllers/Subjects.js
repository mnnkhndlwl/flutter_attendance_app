import { db } from "../config.js";

const currentDate = new Date();

export const displaySubjects = async (req, res, next) => {
  var q =
    "select * from subjects where teacherName = ? and department = ?;";

  var values = [
    req.body.teacherName,
    req.body.department,
  ];

  db.query(q, [...values], (err, data) => {
    if (err) return res.json(err);
    return res.status(200).send(JSON.stringify(data));
  });
};
