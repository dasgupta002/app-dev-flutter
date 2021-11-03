const mongoose = require("mongoose");

const contactSchema = new mongoose.Schema({
    name: { type: String, required: true },
    mail: { type: String, required: true }
});

module.exports = mongoose.model("Contact", contactSchema);