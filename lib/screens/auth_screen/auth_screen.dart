import 'package:apple/components/buttons/custom_button.dart';
import 'package:apple/screens/auth_screen/widgets/custom_text_field.dart';
import 'package:apple/screens/home_page/home_page.dart';
import 'package:apple/utils/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String type = 'signup';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/banner.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type == 'signup'
                        ? "Create Account"
                        : type == 'signin'
                        ? "Sign In"
                        : "Forgot Password",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  Text(
                    type == 'signup'
                        ? "Sign Up with Your User Account"
                        : type == 'signin'
                        ? "Sign In to Your Account"
                        : "Reset Your Password with Your Email",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    hintText: 'Email',
                    prefixIcon: Icons.email_outlined,
                  ),
                  type != 'forgot'
                      ? CustomTextField(
                          hintText: 'Password',
                          prefixIcon: Icons.lock_outlined,
                          isPassword: true,
                        )
                      : SizedBox(),
                  type != 'signin'
                      ? SizedBox()
                      : Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                type = 'forgot';
                              });
                            },
                            child: Text(
                              "Forgot Password?",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ),
                        ),
                  type == 'signup'
                      ? CustomTextField(
                          hintText: 'Confirm Password',
                          prefixIcon: Icons.lock_outlined,
                          isPassword: true,
                        )
                      : SizedBox(),
                  SizedBox(height: 20),
                  CustomButton(
                    size: size,
                    text: type == 'signup'
                        ? "Sign Up"
                        : type == 'signin'
                        ? "Sign In"
                        : "Reset Password",
                    ontap: () {
                      CustomNavigator.push(context, HomePage());
                    },
                  ),
                  CustomButton(
                    size: size,
                    text: type == 'signup'
                        ? "Sign In"
                        : type == 'signin'
                        ? "Sign Up"
                        : "Cancel",
                    ontap: () {
                      setState(() {
                        if (type == 'signin') {
                          type = 'signup';
                        } else if (type == 'signup') {
                          type = 'signin';
                        } else {
                          type = 'signup';
                        }
                      });
                    },
                    bgcolor: Colors.white,
                    fontColor: Colors.black,
                    borderColor: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
