import 'package:apple/components/buttons/custom_button.dart';
import 'package:apple/screens/auth_screen/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignUp = true;

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
                    isSignUp ? "Create Account" : "Sign In",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  Text(
                    isSignUp
                        ? "Sign Up with Your User Account"
                        : "Sign In to Your Account",
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
                  CustomTextField(
                    hintText: 'Password',
                    prefixIcon: Icons.lock_outlined,
                    isPassword: true,
                  ),
                  isSignUp
                      ? SizedBox()
                      : Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
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
                  isSignUp
                      ? CustomTextField(
                          hintText: 'Confirm Password',
                          prefixIcon: Icons.lock_outlined,
                          isPassword: true,
                        )
                      : SizedBox(),
                  SizedBox(height: 20),
                  CustomButton(
                    size: size,
                    text: isSignUp ? "Sign Up" : "Sign In",
                    ontap: () {
                      setState(() {
                        isSignUp = !isSignUp;
                      });
                    },
                  ),
                  CustomButton(
                    size: size,
                    text: isSignUp ? "Sign In" : "Sign Up",
                    ontap: () {
                      setState(() {
                        isSignUp = !isSignUp;
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
