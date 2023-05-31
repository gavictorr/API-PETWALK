import express from "express"
import { routes } from "./routes";

const app = express();

app.use(express.json());

app.use(routes);

app.listen(6379, () => console.log("Server está rodando na porta 6379"));