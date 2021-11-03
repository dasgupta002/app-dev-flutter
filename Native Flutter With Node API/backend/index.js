const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");

const Contact = require("./models/contact.js");

const app = express();

app.use(cors());
app.use(express.json());

mongoose.connect("mongodb+srv://admin:100@cluster0.yayfg.mongodb.net/db?retryWrites=true&w=majority")
        .catch((error) => next(error));

app.get("/store/fetch", async (req, res) => {
    const data = await Contact.find();
    return res.send(data);
});

app.post("/store/add", async (req, res) => {
    const data = new Contact({ "name": req.body.name, "mail": req.body.mail });
    await data.save();
    return res.send({ "message": "data added" });
});

app.post("/store/edit/:id", async (req, res) => {
    const data = { "name": req.body.name, "mail": req.body.mail };
    await Contact.findByIdAndUpdate(mongoose.Types.ObjectId(req.params.id), data);
    return res.send({ "message": "data updated" });
});

app.post("/store/delete/:id", async (req, res) => {
    await Contact.findByIdAndDelete(mongoose.Types.ObjectId(req.params.id));
    return res.send({ "message": "data erased" });
});

app.listen(40);