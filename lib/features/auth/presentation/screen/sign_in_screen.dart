import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/app/extensions/utils_extension.dart';
import 'package:craftybay/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/app_logo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = '/sign-In';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

// LanguageSwitcher()
//ThemeSwitcher()

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   bool _isObscured = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 48,),
                  AppLogo(width: 100, height: 100),
                  const SizedBox(height: 16,),
                  Text(
                    context.l10n.loginTitle,
                    style: context.textTheme.titleLarge,
                  ),
                  Text(
                    context.l10n.loginDescription,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 24,),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                  ),

                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isObscured,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton( icon: Icon(_isObscured ? Icons.visibility_off : Icons.visibility), onPressed: (){
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      })
                    ),
                  ),
                  const SizedBox(height: 16,),
                  FilledButton(
                      onPressed: _onTapSignInButton, child: Text('Sign In')),

                  const SizedBox(height: 16,),
                  TextButton(onPressed: _onTapSignUpButton, child: Text('Sign Up'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton(){}
  void _onTapSignUpButton(){
    Navigator.pop(context);
  }

  @override
  void dispose() {
   _emailController.dispose();
   _passwordController.dispose();
    super.dispose();
  }

}




