import { Request, Response } from "express";
// import { User } from "../interfaces/users";

export const get_root = (_req: Request, res: Response) => {
    res.render("home");
};
