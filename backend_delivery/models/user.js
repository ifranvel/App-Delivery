const db = require("../config/config");
const bcrypt = require("bcryptjs");

const User = {};

User.findById = (id, result) => {

    const sql = `
    SELECT id, email, name, lastname, image, password FROM users WHERE id = ?
    `;

    db.query(
        sql, [id], (err,user) => {
            if(err){
                console.log("Error");
                result(err, null);
            }else{
                console.log("Usuario obtenido: ", user);
                result(null, user);
            }
        }
    )
}

User.findByEmail = (email, result) => {

    const sql = `
    SELECT id, email, name, lastname, phone, image, password FROM user WHERE email = ?
    `;

    db.query(
        sql, [email], (err,user) => {
            if(err){
                console.log("Error");
                result(err, null);
            }else{
                console.log("Usuario obtenido: ", user[0]);
                result(null, user[0]);
            }
        }
    )
}

User.create = async (user, result) => {

    const sql = `
        INSERT INTO user (email, name, lastname, phone, image, password, created_at, updated_at) VALUES (?,?,?,?,?,?,?,?)
    `;
    
    const hash = await bcrypt.hash(user.password, 10);

    db.query(
        sql,
        [
            user.email,
            user.name,
            user.lastname,
            user.phone,
            user.image,
            hash,
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