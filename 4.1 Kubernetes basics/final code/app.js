const express = require('express')
const app = express()

app.get('/',(req,res)=>{
   res.json({message:"Welcome to kubernetes v2"})
})

app.get('/crash',(req,res)=>{
    res.send('Server is crashing...');
    setTimeout(() => process.exit(1), 100);
})



// Liveness example
app.get('/unresponsive', (req, res) => {
    console.log("Simulating unresponsive app...");
    while (true) {} 
});


// Readiness example
let dbConnected = true;

app.get('/ready', (req, res) => {
    if (dbConnected) {
        res.status(200).send("I am ready!");
    } else {
        res.status(500).send("Database not connected!");
    }
});

app.get('/disconnect-db', (req, res) => {
    dbConnected = false;
    res.send("Database disconnected!");
});

app.listen(5000,()=>{
    console.log("server running on 5000")
})