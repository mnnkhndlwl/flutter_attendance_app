import { db } from "../config.js";

export const ShowStudents = async (req, res, next) => {
  var q =
    "select name,enrollment_no,department,section,semester from student where `department` = ? and `section` = ? and `semester` = ?;";

  var values = [
    req.body.department,
    req.body.section,
    req.body.semester
  ];

  db.query(q, [...values], (err, data) => {
    if (err) return res.json(err);
    return res.json(data);
  });
};
