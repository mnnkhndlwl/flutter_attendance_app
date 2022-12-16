import { db } from "../config.js";

export const takeAttendance = async (req, res, next) => {

  var q =
    "INSERT INTO attendancedb(`enrollment_no`,`semester`,`date`,`isPresent`,`subjectid`,`section`,`department`) VALUES(?,?,?,?,?,?,?)";

  db.query(
    q,
    [
      req.body.enroll,
      req.body.sem,
      req.body.date,
      req.body.present,
      req.body.subjectid,
      req.body.section,
      req.body.department,
    ],
    (err, data) => {
      if (err) return res.json(err);
      return res.json(data);
    }
  );
};
