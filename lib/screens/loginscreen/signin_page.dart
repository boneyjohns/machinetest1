import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test1/const/const.dart';
import 'package:machine_test1/controller/signin_controller.dart';
import 'package:machine_test1/functions/email_login.dart';
import 'package:machine_test1/functions/google_signin.dart';
import 'package:machine_test1/screens/loginscreen/forgetpassword.dart';
import 'package:machine_test1/screens/loginscreen/signup_Page.dart';
import 'package:machine_test1/widgets/login_page_animation.dart';
import 'package:machine_test1/widgets/my_appbar.dart';
import 'package:machine_test1/widgets/my_text_field.dart';

class Signinpage extends StatelessWidget {
  Signinpage({
    super.key,
  });
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final signincontroller = Get.put(Signincontroller());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Myappbar(title: 'Login'),
        Form(
            key: signincontroller.loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                kheight20,
                const Loginpageanimation(),
                kheight20,
                Mytextformfield(
                  validator: (value) {
                    return signincontroller.validateemail(value!);
                  },
                  hide: false,
                  keyboardtype: TextInputType.emailAddress,
                  text: 'Email',
                  preicon: Icons.mail,
                  mycontroller: emailcontroller,
                ),
                kheight20,
                Mytextformfield(
                    validator: (value) {
                      return signincontroller.validatepassword(value!);
                    },
                    keyboardtype: TextInputType.visiblePassword,
                    text: 'passsword',
                    preicon: Icons.lock,
                    hide: true,
                    mycontroller: passwordcontroller),
                kheight20,
                InputChip(
                    backgroundColor: kblue,
                    onPressed: () async {
                      signincontroller.checkLogin();

                      await emaillogin(
                          useremail: emailcontroller.text.trim(),
                          userpassword: passwordcontroller.text.trim());
                    },
                    label: const SizedBox(
                      width: 100,
                      child: Center(
                        child: Text(
                          'Login',
                        ),
                      ),
                    )),
                kheight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputChip(
                      onPressed: () {
                        signinwithgoogle();
                      },
                      label: CircleAvatar(
                        backgroundColor: kwhite,
                        child: Image.network(
                          'https://is4-ssl.mzstatic.com/image/thumb/Purple126/v4/36/78/12/36781208-0ba2-33a8-e76f-c7609ae1b908/logo_gsa_ios_color-0-1x_U007emarketing-0-0-0-6-0-0-0-85-220-0.png/246x0w.webp',
                        ),
                      ),
                      pressElevation: 30,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SignUp(),
                        transition: Transition.circularReveal,
                        duration: const Duration(seconds: 1));
                  },
                  child: const Card(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Don't have an account signUp",
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(ForgotPassword()),
                  child: const Card(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Forgot password",
                        )),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
