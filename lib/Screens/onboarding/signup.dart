import 'package:digestdraft/config/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

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
                  emailTextField(size),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  passwordTextField(size),
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  //sign in button & sign in with text
                  signInButton(size, 'Signup'),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  signInWithText(),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  InkWell(
                    onTap: () {},
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
                    child: footerText(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget emailTextField(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 11,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 1.0,
          color: const Color(0xFFEFEFEF),
        ),
      ),
      child: TextField(
        style: TextStyles().paraStyle,
        maxLines: 1,
        cursorColor: const Color(0xFF15224F),
        decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyles().paraStyle,
            border: InputBorder.none),
      ),
    );
  }

  static Widget passwordTextField(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 11,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 1.0,
          color: const Color(0xFFEFEFEF),
        ),
      ),
      child: TextField(
        style: TextStyles().paraStyle,
        maxLines: 1,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        cursorColor: const Color(0xFF15224F),
        decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyles().paraStyle,
            border: InputBorder.none),
      ),
    );
  }

  static Widget signInButton(Size size, String label) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: const Color(0xFF21899C),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4C2E84).withOpacity(0.2),
            offset: const Offset(0, 15.0),
            blurRadius: 60.0,
          ),
        ],
      ),
      child: Text(
        label,
        style: TextStyles().paraStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  static Widget signInWithText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(child: Divider()),
        const SizedBox(
          width: 16,
        ),
        Text(
          'Or Sign in with',
          style: TextStyles().paraStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          width: 16,
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  //sign up text here
  static Widget footerText() {
    return Text.rich(
      TextSpan(
        style: TextStyles().paraStyle,
        children: const [
          TextSpan(
            text: 'Don’t have an account ?',
          ),
          TextSpan(
            text: ' ',
            style: TextStyle(
              color: Color(0xFF21899C),
            ),
          ),
          TextSpan(
            text: 'Sign up',
            style: TextStyle(
              color: Color(0xFF21899C),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class SignInOneSocialButton extends StatelessWidget {
  String? iconPath;
  String? text;
  SignInOneSocialButton({Key? key, required this.iconPath, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        border: Border.all(
          width: 1.0,
          color: const Color(0xFF134140),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: SvgPicture.asset(iconPath!),
          ),
          Expanded(
            flex: 2,
            child: Text(
              text!,
              style: TextStyles().paraStyle,
            ),
          ),
        ],
      ),
    );
  }
}
