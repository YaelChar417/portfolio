import { Router } from "express";
const router = Router();

router.get("/", (_req, res) => {
    console.log("Felicidades estas en router");
    res.send("Estas en un archivo de router");
});

export default router;
