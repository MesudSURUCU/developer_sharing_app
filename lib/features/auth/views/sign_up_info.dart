import 'package:flutter/material.dart';
import 'package:flutter_auth_app/common/colors.dart';
import 'package:flutter_auth_app/common/paths.dart';
import 'package:flutter_auth_app/features/auth/controller/auth_controller.dart';
import 'package:flutter_auth_app/features/home/views/home.dart';
import 'package:flutter_auth_app/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpInfo extends StatefulWidget {
  const SignUpInfo({super.key, required this.email});
  final String email;

  @override
  State<SignUpInfo> createState() => _SignUpInfoState();
}

class _SignUpInfoState extends State<SignUpInfo> {

final TextEditingController _namecontroller = TextEditingController();
final TextEditingController _surnamecontroller = TextEditingController();
final TextEditingController _usernameController = TextEditingController();
final _formKey = GlobalKey<FormState>();

@override
  void dispose() {
    _namecontroller.dispose();
    _surnamecontroller.dispose();
    _usernameController.dispose();
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
                image: DecorationImage(image: const AssetImage(signUpNewImage),
                fit: BoxFit.cover,
                ),
              ),
            ),
            AspectRatio(aspectRatio: 0.9,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: scaffoldBGColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), 
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
                      child: Text("Sign Up", 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 24
                        ),
                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        controller: _namecontroller,
                        validator: (value) {
                          if (value!.isEmpty){
                            return "Name is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                            filled: true,
                            hintText: "Name",
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
                        controller: _surnamecontroller,
                        validator: (value) {
                          if (value!.isEmpty){
                            return "Surname is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                            filled: true,
                            hintText: "Surname",
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
                        controller: _usernameController,                     
                        validator: (value) {
                          if (value!.isEmpty){
                            return "Username is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                            filled: true,
                            hintText: "Username",
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
                    Consumer(
                      builder: (context, ref, child,){
                      return  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: MaterialButton(
                       onPressed: (){
                        if(_formKey.currentState!.validate()){
                          UserModel userModel = UserModel( name: _namecontroller.text, 
                          surname: _surnamecontroller.text, 
                          username: _usernameController.text, 
                          email: widget.email );
                        ref 
                              .read(authControllerProvider)
                              .storeUserInfoToFirebase(userModel)
                              .whenComplete(() => Navigator.pushAndRemoveUntil(context, 
                              MaterialPageRoute(builder: (_) => Home()), (route) => false));
                              
                        }
                       },
                       shape: RoundedRectangleBorder( 
                      borderRadius: BorderRadius.circular(4),
                      ),
                      color: activeColor,
                      minWidth: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("Sign Up",
                        style: TextStyle(color: containerColor),
                        ),
                      ),
                      ),
                    ) ;
                    }
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