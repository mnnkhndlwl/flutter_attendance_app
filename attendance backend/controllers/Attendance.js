import { db } from "../config.js";

const currentDate = new Date();

export const takeAttendance = async (req, res, next) => {
  var q =
    "INSERT INTO attendancedb(`enrollment_no`,`semester`,`date`,`isPresent`,`subjectid`,`section`,`department`) VALUES(?,?,?,?,?,?,?)";

  var values = [
    req.params.enrollment_no,
    req.body.sem,
    currentDate.toLocaleDateString(),
    req.body.present,
    req.body.subjectid,
    req.body.section,
    req.body.department,
  ];

  db.query(q, [...values], (err, data) => {
    if (err) return res.json(err);
    return res.json(data);
  });
};
