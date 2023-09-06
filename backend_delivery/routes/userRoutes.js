const usersController = require("../controllers/usersController");

module.exports = (app) => {
    
    //GET -> OBTENER DATOS
    //POST Almacenar datos
    //PUT ACTUALIZAR DATOS
    //DELETE ELIMINAR DATOS

    app.post("/api/users/create", usersController.register);
    app.post("/api/users/login", usersController.login);
}