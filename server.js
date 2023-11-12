require('dotenv').config()

const express = require('express');
const appRoute = require('./routes/route.js')
const app = express();
const port = process.env.PORT || 9999

app.use(express.json());

/** routes */
app.get("/", (req, res) => {
    res.send(`Server is running on ${port}!`)
})

app.use('/api/v1/', appRoute);



app.listen(port, () => {
    console.log(`Server is running on port ${port}`)
    console.log("Password: " + `${process.env.PASSWORD1} ${process.env.PASSWORD2} ${process.env.PASSWORD3} ${process.env.PASSWORD4}`)
})
