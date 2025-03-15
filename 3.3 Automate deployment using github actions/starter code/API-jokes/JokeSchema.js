const mongoose  =  require('mongoose');

const jokeSchema = new mongoose.Schema({
  joke:String
});

mongoose.model("joke",jokeSchema)