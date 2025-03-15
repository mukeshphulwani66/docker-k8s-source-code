const express = require('express')
const cors = require('cors')
const mongoose = require('mongoose')
const app = express()

require('./JokeSchema')

const jokeModel = mongoose.model('joke')

main().catch(err => console.log(err));


async function main() {
//    await mongoose.connect('mongodb://host.docker.internal:7000/mukeshdb');  
//    await mongoose.connect('mongodb://172.17.0.2:27017/mukeshdb');  
//    await mongoose.connect('mongodb://mongodb:27017/mukeshdb');  
   await mongoose.connect(`${process.env.MONGOURI}`);  
}

mongoose.connection.on('connected',()=>{
    console.log("conneted to mongo yeahh")
})
mongoose.connection.on('error',(err)=>{
    console.log("err connecting",err)
})

app.use(express.json())
app.use(cors())

app.get('/api/getJokes',async (req,res)=>{
       const jokes = await jokeModel.find({});
       res.json({jokes})
})

app.get('/api',(req,res)=>{
   res.json({message:"application is up and running v1"})
})

app.post('/api/post-joke',async (req,res)=>{
    try{
        const newJoke =  await jokeModel.create({
            joke:req.body.joke
        })
        res.json({newJoke:newJoke})
    }catch(err){
        console.log(err)
    }
   
})


app.listen(5000,()=>{
    console.log("server running on 5000")
})