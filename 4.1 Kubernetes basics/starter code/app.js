const express = require('express')
const app = express()

app.get('/',(req,res)=>{
   res.json({message:"Welcome to kubernetes"})
})

app.get('/crash',(req,res)=>{
    res.send('Server is crashing...');
    setTimeout(() => process.exit(1), 100);
})

app.listen(5000,()=>{
    console.log("server running on 5000")
})