import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_books/cubits/login_cubit/login_cubit.dart';
import 'package:flutter_firestore_books/utils/my_utils.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/my_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key, required this.onClickedSignIn}) : super(key: key);

  final VoidCallback onClickedSignIn;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerPasswordConfirm =
      TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool switched = true;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyBoardVisible) {
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
                    controller: controllerPasswordConfirm,
                    text: 'password confirm',
                    obscureText: switched,
                    validator: (value) {
                      if (value!.length <= 3 && value.isNotEmpty) {
                        return "enter the valid password";
                      } else {
                        return null;
                      }
                    },
                  ),
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
                      "Sigh Up",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.grey, fontSize: 18),
                      text: "Already have an account? ",
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignIn,
                          text: "Login",
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
    });
  }

  void toggleElement() {
    setState(() {
      switched = !switched;
    });
  }

  void onPressed()async{
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;
    if(controllerPassword.text != controllerPasswordConfirm.text){
      MyUtils.getMyToast(message: "parol xato");
      return;
    }
    context.read<LoginCubit>().signUp(
      email: controllerEmail.text.trim(),
      password: controllerPassword.text.trim(),
    );
    controllerPassword.text = "";
    controllerPasswordConfirm.text = "";
    controllerEmail.text = "";
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerPasswordConfirm.dispose();
    super.dispose();
  }
}
