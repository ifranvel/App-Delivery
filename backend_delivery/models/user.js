const db = require("../config/config");

const User = {};

User.create = (user, result) => {

    const sql = `
        INSER INTO
        user(
            email, name, lastname, phone, image, password, created_at, updated_at
        )
        VALUES(?,?,?,?,?,?,?,?)
    `;
    
    db.query(
        sql,
        [
            user.email,
            user.name,
            user.lastname,
            user.phone,
            user.image,
            new Date(),
            new Date()
        ],
        (err,res) => {
            if(err){
                console.log("Error");
                result(err, null);
            }else{
                console.log("ID DEL NUEVO USUARIO: ", res.insertId);
                result(null, res.insertId);
            }
        }
    );
}

module.exports = User;