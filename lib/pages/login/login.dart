import 'package:drive2ibiza/pages/calendar/calendar.dart';
import 'package:drive2ibiza/utils/styleguide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../navigation.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingBig),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title
              const Text(
                'Drive2Ibiza (Tba)',
                style: TextStyle(
                  fontSize: primaryHeading,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: spacingSmall),
              // Subtitle
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: secondaryHeading,
                  color: appSecondaryColor,
                ),
              ),

              // Spacer
              const SizedBox(height: spacingBig),
              // Email Field
              const EmailField(),
              // Spacer
              const SizedBox(height: spacingNormal),
              // Password Field
              const PasswordField(),
              // Forgot Password
              const ForgotPasswordBTN(),
              // Login BTN
              const LoginBTN(),
              // Spacer
              const SizedBox(height: spacingNormal),
              // Or Divider
              const OrDivider(),
              // Spacer
              const SizedBox(height: spacingNormal),

              // Social Login BTNs
              // Apple
              GestureDetector(
                onTap: () {
                  // TODO: Development function Login with Apple
                  print('Apple button pressed');
                },
                child: SizedBox(
                  width: double.infinity,
                  height: spacingXL,
                  child: SvgPicture.asset(
                    'assets/btn/Continue_with_Apple.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Spacer
              const SizedBox(height: spacingSmall),

              // Google
              GestureDetector(
                onTap: () {
                  // TODO: Development function Login with Google
                  print('Google button pressed');
                },
                child: SizedBox(
                  width: double.infinity,
                  height: spacingXL,
                  child: SvgPicture.asset(
                    'assets/btn/Continue_with_Google.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Spacer
              const SizedBox(height: spacingSmall),

              // Mail
              GestureDetector(
                onTap: () {
                  // TODO: Development function Login with Mail
                  print('Mail button pressed');
                },
                child: SizedBox(
                  width: double.infinity,
                  height: spacingXL,
                  child: SvgPicture.asset(
                    'assets/btn/SignInWithMail.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

            ],
        ),)
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusSmall),
        ),
      ),
    );
  }
}

// Password Field
class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  PasswordFieldState createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  bool isHidden = true;

  void togglePasswordVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isHidden,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your Password',
        suffixIcon: IconButton(
          icon: Icon(isHidden ? Icons.visibility : Icons.visibility_off),
          onPressed: togglePasswordVisibility,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusSmall),
        ),
      ),
    );
  }
}

// Forgot Password Field
class ForgotPasswordBTN extends StatelessWidget {
  const ForgotPasswordBTN({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {
            // TODO: Passwort vergessen Funktion
          },
          child: const Text(
            'Forgot Password?',
            style: TextStyle(color: appPrimaryColor),
          ),
      ),
    );
  }
}

// Login BTN
class LoginBTN extends StatelessWidget {
  const LoginBTN({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          //TODO: Login Funktion -> leitet zu Kalender Page weiter
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Navigation(currentIndex: 0,)),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: paddingNormal),
        ),
        child: const Text('Login'),
      ),
    );
  }
}

// Or Divider
class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingSmall),
          child: Text('Or'),
        ),
        Expanded(child: Divider(),)
      ],
    );
  }
}



