import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalpas_as/element/custom_button.dart';
import 'package:kalpas_as/homePage.dart';
import 'package:kalpas_as/signupPage.dart';
import 'package:kalpas_as/api/login_signup_api.dart';
LoginSignup api=LoginSignup();
class LoginPage extends StatelessWidget{
  LoginPage({Key?key}):super(key: key);
  final _key = GlobalKey<FormState>();
  Map loginUser={"email": "" , "password": ""};
  @override
  Widget build(context)=>Scaffold(
    body: SingleChildScrollView(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img.jpeg'),
                fit: BoxFit.cover
              )
            ),
            child: const Text('\n\n\n\n      Welcome!!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(28),
            height: 505,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(40),topRight:Radius.circular(40)),
              color: Colors.white
            ),
            child: Column(
              children: [
                 const Text('Sign In',
                  style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                  ),
                 ),
                const SizedBox(height:35,),
                Form(
                  key: _key,
                    child: Column(
                      children:  [
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration:  const InputDecoration(
                                fillColor: Color.fromARGB(210,188, 143, 116), filled: true,
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                )
                            ),
                            onSaved: (value){
                              loginUser["email"]=value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                          ),
                        const SizedBox(height: 25,),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration:  const InputDecoration(
                              fillColor: Color.fromARGB(210,188, 143, 116), filled: true,
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                          ),
                          onSaved: (value){
                            loginUser["password"]=value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [TextButton(
                            onPressed: (){}, child: const Text('Forgot Password?'))
                          ],
                        ),
                        CustomButton(context, 'Sign in', () async{
                          _key.currentState!.save();
                          if(_key.currentState!.validate()){
                            api.loginUser(loginUser);
                            Get.off(()=>const Home());
                          }

                        }),
                        const SizedBox(height: 25,),
                        const Text("-----------------  Or Sign In With  ----------------",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: (){},
                              icon:  const Icon(FontAwesomeIcons.google,size: 40,),
                              color: Colors.redAccent,
                            ),
                            const SizedBox(width: 30,),
                            IconButton(
                                onPressed: (){},
                                icon:  const Icon(FontAwesomeIcons.facebook,size: 40,),
                                color: Colors.blue,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? ",style: TextStyle(color: Colors.grey),),
                            InkWell(
                              onTap: (){
                                Get.off(()=> SignupPage());
                              },
                              child:  const Text("Sign Up", style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.w700
                              ),),
                            )
                          ],
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}