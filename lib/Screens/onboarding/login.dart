import 'package:digestdraft/Screens/MainScreens/MainScreen.dart';
import 'package:digestdraft/Screens/onboarding/signup.dart';
import 'package:digestdraft/controllers/onboarding/onBoardingController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SigninScreen extends ConsumerWidget {
  SigninScreen({super.key});

  String Email = '';
  String Password = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  //email & password section
                  SignupScreen.emailTextField(size, (value) {
                    Email = value;
                  }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SignupScreen.passwordTextField(size, (value) {
                    Password = value;
                  }),
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  //sign in button & sign in with text
                  SignupScreen.signInButton(size, 'Signup'),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SignupScreen.signInWithText(),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      final result = ref.watch(
                          loginrovider({'email': Email, 'password': Password}));
                      result.when(
                          data: (data) {
                            print(data);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const MainScreen();
                              },
                            ));
                          },
                          error: (er, stack) {
                            print(er);
                          },
                          loading: () {});
                    },
                    child: SignInOneSocialButton(
                      iconPath: "assets/google_logo.svg",
                      text: "Sign up with Google",
                    ),
                  ),
                  // signInAppleButton(size),
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  //sign up text here
                  Center(
                    child: SignupScreen.footerText(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
