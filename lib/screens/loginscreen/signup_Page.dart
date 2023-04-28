// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test1/const/const.dart';
import 'package:machine_test1/controller/signin_controller.dart';
import 'package:machine_test1/functions/signup_function.dart';
import 'package:machine_test1/widgets/login_page_animation.dart';
import 'package:machine_test1/widgets/my_text_field.dart';

final TextEditingController usernamecontroller = TextEditingController();
final TextEditingController emailcontroller = TextEditingController();
final TextEditingController passwordcontroller = TextEditingController();
final TextEditingController phonecontroller = TextEditingController();

class SignUp extends StatelessWidget {
  SignUp({
    super.key,
  });
  final User? currentuser = FirebaseAuth.instance.currentUser;
  final signincontroller = Get.put(Signincontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Signup',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: signincontroller.signupformkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                kheight20,
                const Loginpageanimation(),
                kheight20,
                Mytextformfield(
                  validator: (value) {
                    return signincontroller.validateusername(value!);
                  },
                  hide: false,
                  keyboardtype: TextInputType.name,
                  text: 'Username',
                  preicon: Icons.person,
                  mycontroller: usernamecontroller,
                ),
                kheight20,
                Mytextformfield(
                    validator: (value) {
                      return signincontroller.validatephone(value!);
                    },
                    hide: false,
                    keyboardtype: TextInputType.phone,
                    text: 'Phone',
                    preicon: Icons.phone,
                    mycontroller: phonecontroller),
                kheight20,
                Mytextformfield(
                    validator: (value) {
                      return signincontroller.validateemail(value!);
                    },
                    hide: false,
                    keyboardtype: TextInputType.emailAddress,
                    text: 'Email',
                    preicon: Icons.mail,
                    mycontroller: emailcontroller),
                kheight20,
                Mytextformfield(
                    validator: (value) {
                      return signincontroller.validatepassword(value!);
                    },
                    hide: true,
                    keyboardtype: TextInputType.visiblePassword,
                    text: 'Password',
                    preicon: Icons.lock,
                    mycontroller: passwordcontroller),
                kheight20,
                ElevatedButton(
                    onPressed: () async {
                      signincontroller.checkSignup();
                      await signupfun(
                          phone: phonecontroller.text.trim(),
                          useremail: emailcontroller.text,
                          username: usernamecontroller.text,
                          userpassword: passwordcontroller.text);
                    },
                    child: const Text(
                      'Sign Up',
                    )),
                GestureDetector(
                  onTap: Get.back,
                  child: const Card(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Already have an account ",
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
