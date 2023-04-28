import jwt from "jsonwebtoken";

export const auth = async (req, res, next) => {
  try {
    const token = req.header("token");
    if (!token)
      return res.status(401).json({ msg: "No auth token, access denied" });

    const verified = jwt.verify(token, process.env.key);
    if (!verified)
      return res
        .status(401)
        .json({ msg: "Token verification failed, authorization denied." });

    req.teacherName = verified.teacherName;
    req.token = token;
    next();
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
