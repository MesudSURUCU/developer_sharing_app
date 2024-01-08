import 'package:flutter/material.dart';
import 'package:flutter_auth_app/common/colors.dart';
import 'package:flutter_auth_app/common/paths.dart';
import 'package:flutter_auth_app/features/auth/controller/auth_controller.dart';
import 'package:flutter_auth_app/features/auth/views/sign_up.dart';
import 'package:flutter_auth_app/features/home/views/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

final _emailcontroller = TextEditingController();
final _passwordcontroller = TextEditingController();
final _formKey = GlobalKey<FormState>();

@override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: const AssetImage(signInNewImage),
                fit: BoxFit.cover,
                ),
        
              ),
            ),
            AspectRatio(aspectRatio: 0.9,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: scaffoldBGColor,
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), 
                topRight: Radius.circular(20),
                ),
              ),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerLeft,
                      child: Text("Sign In", 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 24
                        ),
                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        controller: _emailcontroller,
                        validator: (value) {
                          if (value!.isEmpty){
                            return "Email is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: activeColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: borderColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                         Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        controller: _passwordcontroller,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty){
                            return "Password is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: activeColor
                          ),
                          border: OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: borderColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child,){
                      return  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: MaterialButton(
                       onPressed: (){
                        if(_formKey.currentState!.validate()){
                        ref.read(authControllerProvider).signInWithEmailAndPassword(email: _emailcontroller.text, 
                        password: _passwordcontroller.text
                        ).then((value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> Home()), 
                        (route) => false));
                        }
                       },
                       shape: RoundedRectangleBorder( 
                      borderRadius: BorderRadius.circular(4),
                      ),
                      color: activeColor,
                      minWidth: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Sıgn In",
                        style: TextStyle(color: containerColor),
                        ),
                      ),
                      ),
                    ) ;
                    }
                  ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(padding: EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        child: InkWell(
                          child: Text("Forgot Password ?", style: TextStyle(color: textButtontextColor, fontSize: 14),),
                      onTap: (){},
                      ),
                      ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5,), 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't haven't account ?", style: TextStyle(color: textButtontextColor, fontSize: 14),
                        ),
                        TextButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>const SignUp())),
                          child: Text("Sign Up",style: TextStyle(color: activeColor, 
                          fontSize: 14)) ,),
                      ],
                    ),
                    ),
                  ],
                  ),
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}