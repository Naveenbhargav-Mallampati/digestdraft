import 'package:digestdraft/Screens/onboarding/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dob_input_field/dob_input_field.dart';

class LocationScreen extends ConsumerWidget {
  LocationScreen({super.key});
  String name = '';
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
                    name = value;
                  }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const DobInputField(),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const GenderWidget(),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  LocationButton(title: 'Location')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GenderWidget extends ConsumerWidget {
  const GenderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Row(
        children: [
          Gendertile(
            title: 'Male',
          ),
          Gendertile(
            title: 'Female',
          ),
          Gendertile(
            title: 'Others',
          ),
        ],
      ),
    );
  }
}

class LocationButton extends ConsumerWidget {
  LocationButton({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Text(title),
      ),
    );
  }
}

class Gendertile extends ConsumerWidget {
  Gendertile({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: Text(title),
        ),
      ),
    );
  }
}

class DobInputField extends StatelessWidget {
  const DobInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("DOB input field"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: DOBInputField(
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            showLabel: true,
            showCursor: true,
            autovalidateMode: AutovalidateMode.always,
            fieldLabelText: "With label",
          ),
        ),
      ),
    );
  }
}
