import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_books/cubits/login_cubit/login_cubit.dart';
import 'package:flutter_firestore_books/ui/widgets/my_text_field.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.onClickSignUp}) : super(key: key);

  final VoidCallback onClickSignUp;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool switched = true;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyBoardVisible) {
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    isKeyBoardVisible
                        ? const SizedBox()
                        : Image.asset("assets/images/book.png"),
                    SizedBox(height: 30.h),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 32.h,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    MyTextField(
                      prefixIcon: const Icon(Icons.email_outlined),
                      controller: controllerEmail,
                      text: 'email',
                      obscureText: false,
                      validator: (value) {
                        if (!RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$')
                            .hasMatch(value!) &&
                            value.isNotEmpty) {
                          return "Invalid email!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 10.h),
                    MyTextField(
                        prefixIcon: const Icon(
                          Icons.lock_open_outlined,
                          color: Colors.blue,
                        ),
                        suffixIcon: IconButton(
                          onPressed: toggleElement,
                          icon: switched
                              ? const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.red,
                          )
                              : const Icon(
                            Icons.remove_red_eye,
                            color: Colors.green,
                          ),
                        ),
                        controller: controllerPassword,
                        text: 'password',
                        isDone: true,
                        obscureText: switched,
                        validator: (value) {
                          if (value!.length <= 3 && value.isNotEmpty) {
                            return "enter the valid password";
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(height: 30.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: Size(300.w, 80.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.sp),
                        ),
                      ),
                      onPressed: onPressed,
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.grey, fontSize: 18),
                        text: "Don’t have an account?  ",
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickSignUp,
                            text: "Register now",
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void onPressed()async{
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;

    context.read<LoginCubit>().loginIn(
      email: controllerEmail.text.trim(),
      password: controllerPassword.text.trim(),
    );
    controllerPassword.text = "";
    controllerEmail.text = "";
  }

  void toggleElement() {
    setState(() {
      switched = !switched;
    });
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }
}
