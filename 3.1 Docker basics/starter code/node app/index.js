const express = require('express')
const fileUpload = require("express-fileupload");
const path = require('path')
var fs = require('fs');

const app = express()
const PORT = 5000

app.use(fileUpload());
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

app.post("/upload", function (req, res) {
  if (req.files && Object.keys(req.files).length !== 0) {
    const uploadedFile = req.files.uploadFile;
    console.log(uploadedFile);
    const uploadPath = './uploads';

    if (!fs.existsSync(uploadPath)){
        fs.mkdirSync(uploadPath);
    }

    uploadedFile.mv(`${uploadPath}/${uploadedFile.name}`, function (err) {
      if (err) {
        console.log(err);
        res.send("Failed !!");
      } else res.send("Successfully Uploaded !!");
    });
  } else res.send("No file uploaded !!");
});


app.get("/",(req,res)=>{
    res.send("hello world")
})

app.get("/image-upload",(req,res)=>{
    res.sendFile(__dirname + "/index.html");
})

app.listen(PORT,()=>{
    console.log(`server is running ${PORT}`)
})