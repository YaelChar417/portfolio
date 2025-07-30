import mysql from "mysql2/promise";
import { ConnectionOptions } from "mysql2";
import dotenv from "dotenv";
dotenv.config();

const config_options: ConnectionOptions = {
    host: process.env.HOST,
    user: process.env.USER,
    password: process.env.PASSWORD,
    database: process.env.DATABASE,
    port: Number(process.env.MYSQL_PORT) || 3000,
};

const pool = mysql.createPool(config_options);

export default pool;
