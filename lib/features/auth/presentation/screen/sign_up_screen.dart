import 'package:craftybay/app/extensions/utils_extension.dart';
import 'package:craftybay/features/auth/data/models/sign_up_params.dart';
import 'package:craftybay/features/shared/presentation/widgets/center_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/validators.dart';
import '../../../shared/presentation/widgets/snack_bar_message.dart';
import '../providers/sign_up_provider.dart';
import '../widgets/app_logo.dart';
import 'sign_in_screen.dart';
import 'verify_otp_screen.dart';

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

   final SignUpProvider _signUpProvider = SignUpProvider();


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _signUpProvider,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      validator: (value) => Validators.validateEmail(value),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _firstNameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: 'First Name',
                      ),
                      validator: (value) => Validators.validateNullOrEmpty(value, 'First Name is required'),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _lastNameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                      ),
                      validator: (value) => Validators.validateNullOrEmpty(value, 'Last Name is required'),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Phone',
                      ),
                      validator: (value) => Validators.validateMobile(value),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _cityController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'City',
                      ),
                      validator: (value) => Validators.validateNullOrEmpty(value, 'City is required'),
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
                      validator: (value) => Validators.validatePassword(value),
                    ),
                    const SizedBox(height: 16,),
                    Consumer<SignUpProvider>(
                      builder: (context, _,_) {
                        if(_signUpProvider.signUpInProgress){
                          return CenterProgressIndicator();
                        }
                        return FilledButton(
                            onPressed: _onTapSignUpButton, child: Text('Sign Up'));
                      }
                    ),

                    const SizedBox(height: 16,),
                    TextButton(onPressed: _onTapSignInButton, child: Text('Sign In'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton(){
    //Navigator.pushNamed(context, VerifyOtpScreen.name);
    if(_formKey.currentState!.validate()){
      _signUp();
    }
  }

  Future<void> _signUp() async{
      SignUpParams params = SignUpParams
        (
          email: _emailController.text.trim(),
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          phone: _phoneController.text.trim(),
          city: _cityController.text.trim(),
          password: _passwordController.text
      );

      final bool isSuccess = await _signUpProvider.signUp(params);

      if(isSuccess){
        Navigator.pushNamed(context, VerifyOtpScreen.name);
      }else {
          showSnackBarMessage(context, _signUpProvider.errorMessage!);
      }
  }

  void _onTapSignInButton(){
    Navigator.pushNamed(context, SignInScreen.name);
  }

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




