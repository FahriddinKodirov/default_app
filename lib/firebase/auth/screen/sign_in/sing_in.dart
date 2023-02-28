import 'package:default_package/firebase/auth/cubit/auth_cubit.dart';
import 'package:default_package/firebase/utils/my_utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:default_package/utils/my_icons.dart';
import 'package:default_package/utils/my_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  final VoidCallback onClickSignIp;

  const SignInScreen({super.key, required this.onClickSignIp});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignIn Screen'),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width(context)*0.04,vertical: height(context)*0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                    validator: (value) =>
                        value != null && !EmailValidator.validate(value)
                            ? 'Email address is incorrect'
                            : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorHeight: 22,
                    controller: emailController,
                    decoration: getInputDecoration(
                        icon: Icons.email_outlined,
                        word: 'Email Adress',
                        eye: icon())),
                SizedBox(height: height(context) * 0.022),
          
                TextFormField(
                  validator: (password) => password != null && password.length < 6
                      ? 'Password is incorrect'
                      : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: isTrue,
                  controller: passwordController,
                  decoration: getInputDecoration(
                      icon: Icons.lock_outline_sharp,
                      word: 'Password',
                      eye: icon()),
                  cursorHeight: 22,
                ),
                SizedBox(height: height(context)*0.02,),
                Center(
                  child:RichText(text:
                  TextSpan(
                    text: 'SignUp',
                    style: const TextStyle(color: Colors.black),
                    recognizer: TapGestureRecognizer()..onTap = widget.onClickSignIp,
                  ) )),
                Center(
                  child: ElevatedButton(onPressed: () => signInScreen(),
                  child: const Text('Accept')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInScreen() async {
   final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    await BlocProvider.of<AuthCubit>(context).singIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget icon() {
    return isTrue
        ? IconButton(
            icon: SvgPicture.asset(MyIcons.hideEye, color: Colors.black54),
            onPressed: () {
              setState(() {
                isTrue = !isTrue;
              });
            },
          )
        : IconButton(
            icon: SvgPicture.asset(MyIcons.eye, color: Colors.black54),
            onPressed: () {
              setState(() {
                isTrue = !isTrue;
              });
            },
      );
  }
}

