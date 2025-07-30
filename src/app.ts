import express from "express";
const PORT = 3000;
const TIME = 15 * 60 * 1000; // 15 minutos en milisegundos
const app = express();
import csrf from "csurf";
import passport from "passport";
import path from "path";
import session from "express-session";
import dotenv from "dotenv";
// Usar variables seguras
dotenv.config();

// Configurar la sesion
app.use(
    session({
        secret: process.env.SESSION_SECRET!,
        resave: false,
        saveUninitialized: false,
        rolling: true,
        cookie: { maxAge: TIME },
    })
);

// parsear informacion a objetos de typescript
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Manejo de sesiones
app.use(passport.initialize());
app.use(passport.session());

// Agregar proteccion contra ataques CSRF asignando tokens
const csrf_protection = csrf();
app.use(csrf_protection);

// Asignar carpeta publica para archivos del cliente
app.use(express.static(path.join(__dirname, "public")));

// Configurar motor de vistas
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

import users_router from "./routes/users";
app.use("/", users_router);

app.listen(PORT, () => {
    console.log(`Servidor escuchando en el puerto ${PORT}`);
});
