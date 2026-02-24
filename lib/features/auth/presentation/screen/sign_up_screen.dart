import 'package:craftybay/app/app_colors.dart';
import 'package:craftybay/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

import '../widgets/app_logo.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

// LanguageSwitcher()
//ThemeSwitcher()

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
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
                  AppLogo(width: 100, height: 100),
                  const SizedBox(height: 16,),
                  Text(
                    context.l10n.createAcc,
                    style: context.textTheme.titleLarge,
                  ),
                  Text(
                    context.l10n.getStart,
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
                    controller: _firstNameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: 'First Name',
                    ),
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _lastNameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                    ),
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Phone',
                    ),
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _cityController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'City',
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
                      onPressed: _onTapSignUpButton, child: Text('Sign Up')),

                  const SizedBox(height: 16,),
                  TextButton(onPressed: _onTapSignInButton, child: Text('Sign In'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton(){}
  void _onTapSignInButton(){}

  @override
  void dispose() {
   _emailController.dispose();
   _firstNameController.dispose();
   _lastNameController.dispose();
   _passwordController.dispose();
   _cityController.dispose();
   _passwordController.dispose();
    super.dispose();
  }

}




