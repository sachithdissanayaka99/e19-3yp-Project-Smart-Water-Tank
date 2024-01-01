import 'package:flutter/material.dart';
import 'package:mobileapp/utill/User_func.dart';
import 'package:mobileapp/components/cusButton.dart';
import 'package:mobileapp/components/cusText.dart';
import 'package:mobileapp/components/custextField.dart';
import 'package:mobileapp/Auth/login.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState()=> _SignUpState();

}

class  _SignUpState extends State<Signup> {
  @override
  Widget build(BuildContext context) {

    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQueryData.size.height * 0.02),
            child: Column(
              children: [
                SizedBox(height: mediaQueryData.size.height * 0.05),
                //Align(
                 // alignment: Alignment.bottomLeft,
                  //child: InkWell(
                   // onTap: () {
                     // UtilFunction.navigateBackward(
                    //      context, const SignUpDescription());
                    //},
                   // child: const Icon(Icons.arrow_back_ios_new_outlined),
                  //),
                //),
                SizedBox(height: mediaQueryData.size.height * 0.05),
                CustomText(
                  "SignUp",
                  fontSize: mediaQueryData.size.height * 0.04,
                  fontWeight: FontWeight.w600,
                ),
                
                SizedBox(height: mediaQueryData.size.height * 0.05),
                CustomTextFeild(
                  lable: "Enter your full name",
                  mediaQueryData: mediaQueryData,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: mediaQueryData.size.height * 0.01),
                CustomTextFeild(
                  lable: "Enter your email",
                  mediaQueryData: mediaQueryData,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: mediaQueryData.size.height * 0.01),
                CustomTextFeild(
                  lable: "Create password",
                  obscure: true,
                  mediaQueryData: mediaQueryData,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: mediaQueryData.size.height * 0.01),
                CustomTextFeild(
                  lable: "Confirm password",
                  obscure: true,
                  mediaQueryData: mediaQueryData,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: mediaQueryData.size.height * 0.07),
                 InkWell(
                      onTap:(){
                        

                        UtilFunction.navigateForward(
                            context,  const Login());

                      },
                      child: CustomButton(
                        "Register",
                        mediaQueryData: mediaQueryData,
                        width: mediaQueryData.size.width,
                        
                      ),
                    ),
              ],
            ),
          ),
        ),

      )
        

     );
    
  }}