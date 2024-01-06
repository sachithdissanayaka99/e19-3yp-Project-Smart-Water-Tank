import 'package:flutter/material.dart';
import 'package:mobileapp/Auth/api_service.dart';
import 'package:mobileapp/Auth/sign_request_model.dart';
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

  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
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
                  onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                ),
                SizedBox(height: mediaQueryData.size.height * 0.01),
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
                  lable: "Create password",
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
                CustomTextFeild(
                  lable: "Confirm password",
                  obscure: true,
                  mediaQueryData: mediaQueryData,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {
                          setState(() {
                            confirmPassword = value;
                          });
                        },
                ),
                SizedBox(height: mediaQueryData.size.height * 0.07),
                 InkWell(
                      onTap:(){
                        if(validateAndSave()){
                          print ("name: $name");
                          setState((){
                            isAPIcallProcess = true;
                            });
                            sign_request_model model =  sign_request_model(
                              fullname: name!,
                              email: email!, 
                              password: password!,
                              );
                              APIService.register(model).then((response){
                                print("response: $response");
                                print("full name: $name");

                                if (response !=null ){
                                  Navigator.pushNamedAndRemoveUntil(context,'/login', (route) => false,);
                                }else{

                                }
                              });
                        }
                        

                       

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
    
  }
    bool validateAndSave() {
    if (name != null && email != null && password != null && confirmPassword != null) {
    if (name!.isEmpty || email!.isEmpty || password!.isEmpty || confirmPassword!.isEmpty) {
      // Handle empty fields
      return false;
    } else if (password != confirmPassword) {
      // Handle password mismatch
      return false;
    } else {
      return true;
    }
  }
  return false;
  
}
}