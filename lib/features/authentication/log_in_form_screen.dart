import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class LogInFormScreen extends StatefulWidget {
  const LogInFormScreen({super.key});

  @override
  State<LogInFormScreen> createState() => _LogInFormScreenState();
}

class _LogInFormScreenState extends State<LogInFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onSubmitTap() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const InterestsScreen()),
        ((route) {
      return false;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                Gaps.v16,
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                Gaps.v28,
                GestureDetector(
                  onTap: _onSubmitTap,
                  child: const FormButton(disabled: false),
                )
              ],
            )),
      ),
    );
  }
}
