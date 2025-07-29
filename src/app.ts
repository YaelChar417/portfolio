import express from "express";

const app = express();
app.use(express.json());

const PORT = 3000;

app.get("/", (_req, res) => {
    res.send("Hola mundo");
});

app.listen(PORT, () => {
    console.log(`Servidor escuchando en el puerto ${PORT}`);
});
