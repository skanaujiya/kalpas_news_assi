import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalpas_as/api/login_signup_api.dart';
import 'package:kalpas_as/element/custom_button.dart';
import 'package:kalpas_as/loginPage.dart';
LoginSignup api=LoginSignup();
class SignupPage extends StatelessWidget{
  SignupPage({Key?key}):super(key: key);
  final _key = GlobalKey<FormState>();
  Map newUser={"email":"","password":""};
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
            height: 520,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft:Radius.circular(40),topRight:Radius.circular(40)),
                color: Colors.white
            ),
            child: Column(
              children: [
                const Text('Sign Up',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height:25,),
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
                            newUser["email"]=value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12,),
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
                             newUser["password"]=value;
                           },
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return 'Password is required';
                             }
                             return null;
                           },
                        ),
                        const SizedBox(height: 12,),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration:  const InputDecoration(
                            fillColor: Color.fromARGB(210,188, 143, 116), filled: true,
                            labelText: 'Re-Enter Password',
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        CustomButton(context, 'Sign Up',
                                () async{
                          _key.currentState!.save();
                          if(_key.currentState!.validate()){
                            await api.addUser(newUser);
                          }
                          Get.back();
                        }
                        ),
                        const SizedBox(height: 20,),
                        const Text("-----------------  Or Sign Up With  ----------------",
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
                            const Text("Have an account? ",style: TextStyle(color: Colors.grey),),
                            InkWell(
                              onTap: (){
                                Get.off(()=>LoginPage());
                              },
                              child:  const Text("Sign In", style: TextStyle(
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