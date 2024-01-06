import 'package:mobileapp/Auth/api_service.dart';
import 'package:mobileapp/Auth/login_request_model.dart';
import 'package:mobileapp/Auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/utill/User_cons.dart';
import 'package:mobileapp/utill/User_func.dart';
import 'package:mobileapp/components/cusText.dart';
import 'package:mobileapp/components/custextField.dart';
import 'package:mobileapp/components/cusButton.dart';
import 'package:mobileapp/components/cusIconcon.dart';
import 'package:mobileapp/pages/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQueryData.size.height * 0.02),
              child: Column(
                children: [
                  SizedBox(height: mediaQueryData.size.height * 0.01),
                  Column(
                    children: [
                      SizedBox(height: mediaQueryData.size.height * 0.05),
                      CustomText(
                        "Login",
                        fontSize: mediaQueryData.size.height * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: mediaQueryData.size.height * 0.04),
                      CustomTextFeild(
                        lable: "Enter your email",
                        mediaQueryData: mediaQueryData,
                        keyboardType: TextInputType.emailAddress,
                         onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      SizedBox(height: mediaQueryData.size.height * 0.01),
                      CustomTextFeild(
                        lable: "Enter password",
                        obscure: true,
                        mediaQueryData: mediaQueryData,
                        keyboardType: TextInputType.visiblePassword,
                        
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                      SizedBox(height: mediaQueryData.size.height * 0.01),
                      SizedBox(height: mediaQueryData.size.height * 0.07),
                      InkWell(
                      onTap: () {

                        if(validateAndSave()){
                          setState((){
                            isAPIcallProcess = true;
                            });
                            login_request_model model =  login_request_model(
                              email: email!, 
                              password: password!,
                              );
                              APIService.login(model).then((response){
                                if (response){
                                  Navigator.pushNamedAndRemoveUntil(context,'/home', (route) => false,);
                                }else{

                                }
                              });
                        }
                                  
                              
                          
                        
                      },
                      child: CustomButton(
                        "Login",
                        
                        mediaQueryData: mediaQueryData,
                        width: mediaQueryData.size.width,
                    
                      ),
                    ),
                    
                    InkWell(
                      onTap: () {

                        UtilFunction.navigateForward(
                            context, const Signup());
                      },
                      child: CustomButton(
                        "Sign Up",
                        mediaQueryData: mediaQueryData,
                        width: mediaQueryData.size.width,
                      ),
                    ),
                    ],
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.04),
                  CustomText(
                    "Or login with social account",
                    fontSize: mediaQueryData.size.height * 0.018,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: mediaQueryData.size.height * 0.025),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomIconContainer(
                        imgPath: UtilConstants.googleImagePath,
                        mediaQueryData: mediaQueryData,
                      ),
                      CustomIconContainer(
                        imgPath: UtilConstants.facebookImagePath,
                        mediaQueryData: mediaQueryData,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  bool validateAndSave() {
  if (email != null && password != null ) {
    if ( email!.isEmpty || password!.isEmpty ) {
      // Handle empty fields
      return false;
    } else {
      return true;
    }
  }
  return false;
  
}
}