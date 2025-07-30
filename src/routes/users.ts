import { Router } from "express";
import { get_root } from "../controllers/users";
const router = Router();

router.get("/", get_root);

export default router;
