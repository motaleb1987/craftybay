import 'package:craftybay/features/auth/data/models/verify_otp_params.dart';
import 'package:craftybay/features/auth/presentation/providers/verify_otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../app/extensions/utils_extension.dart';
import '../../../../app/app_colors.dart';
import '../../../shared/presentation/screens/main_nav_holder_screen.dart';
import '../../../shared/presentation/widgets/snack_bar_message.dart';
import '../widgets/app_logo.dart';
import '../widgets/resend_otp_section.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});
  static const String name = '/verify-otp';

  final String email;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

// LanguageSwitcher()
//ThemeSwitcher()

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final PinInputController _otpController = PinInputController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final VerifyOtpProvider _verifyOtpProvider = VerifyOtpProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _verifyOtpProvider,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 48),
                    AppLogo(width: 100, height: 100),
                    const SizedBox(height: 16),
                    Text(
                      context.l10n.otpCode,
                      style: context.textTheme.titleLarge,
                    ),
                    Text(
                      context.l10n.otpDescription,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 24),
                    MaterialPinField(
                      length: 4,
                      pinController: _otpController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      theme: MaterialPinTheme(
                        shape: MaterialPinShape.outlined,
                        fillColor: Colors.transparent,
                        borderColor: AppColors.themeColor,
                        spacing: 16,
                        cellSize: Size(50, 50),
                        completeFillColor: Colors.transparent,
                        completeBorderColor: AppColors.themeColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: _onTapVerifyOtpButton,
                      child: Text('Verify'),
                    ),

                    const SizedBox(height: 16),
                    ResendOtpSection(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapVerifyOtpButton() {
    if (_otpController.text.length == 4) {
      _verifyOtp();
    }
  }

  Future<void> _verifyOtp() async {
    VerifyOtpParams params = VerifyOtpParams(
      email: widget.email,
      otp: _otpController.text,
    );
    final bool isSuccess = await _verifyOtpProvider.verifyOtp(params);
    if (isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        MainNavHolderScreen.name,
        (context) => false,
      );
    } else {
      showSnackBarMessage(context, _verifyOtpProvider.errorMessage!);
    }
  }

  @override void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
