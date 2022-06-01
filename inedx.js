const express=require('express');
const res = require('express/lib/response');
const app=express();

app.use(express.json());
app.use(
    express.urlencoded({extended:true})
);

let users=new Map();

app.listen(3000,()=>{
    console.log("Connected");
})

//For GET Method
app.get('/api/login',(req,res)=>{
    if(users.has(req.body.email)){
        res.status(200).send({
            "Success":"Successfully login"
        })
    }else{
        res.status(404).send({
            "Success":"This email id not register"
        })
    }
})

//For POST Method
app.post('/api/signup',(req,res)=>{
    if(users.has(req.body.email)){
        res.status(404).send({
            "Success":"Email id already registered"
        })
    }else{
        const user={
            id: users.size+1,
            password: req.body.password
        }
        users.set(req.body.email,user);
        res.status(200).send(
            {
                "Success":"User Succesfully Register"
            }
        )
    }
}

)