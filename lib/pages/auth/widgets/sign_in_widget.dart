import 'package:flutter/material.dart';
import 'package:jonegoro_store_app/pages/base_widgets/buttons/custom_button.dart';
import 'package:jonegoro_store_app/pages/dashboard/dashboard_page.dart';
import 'package:jonegoro_store_app/utils/color_resource.dart';
import 'package:jonegoro_store_app/utils/custom_themes.dart';

import '../../../utils/dimensions.dart';
import '../../base_widgets/textfields/custom_password_textfield.dart';
import '../../base_widgets/textfields/custom_textfield.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => SignInWidgetState();
}

class SignInWidgetState extends State<SignInWidget> {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  GlobalKey<FormState>? _formKeyLogin;

  @override
  void initState() {
    super.initState();
    _formKeyLogin = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    super.dispose();
  }

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();

  void loginUser() async {
    if (_formKeyLogin!.currentState!.validate()) {
      _formKeyLogin!.currentState!.save();

      String email = _emailController!.text.trim();
      String password = _passwordController!.text.trim();

      if (email.isEmpty && password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Fields cannot be empty!'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email is empty.'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password is empty.'),
            backgroundColor: Colors.red,
          ),
        );
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeLarge,
      ),
      child: Form(
        key: _formKeyLogin,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: Dimensions.paddingSizeSmall,
          ),
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: Dimensions.marginSizeSmall,
              ),
              child: CustomTextField(
                hintText: 'Email',
                focusNode: _emailNode,
                nextNode: _passNode,
                textInputType: TextInputType.emailAddress,
                controller: _emailController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: Dimensions.marginSizeDefault,
              ),
              child: CustomPasswordTextField(
                hintTxt: 'Password',
                textInputAction: TextInputAction.done,
                focusNode: _passNode,
                controller: _passwordController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                right: Dimensions.marginSizeSmall,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (val) {},
                        activeColor: Theme.of(context).primaryColor,
                        checkColor: ColorResources.white,
                      ),
                      const Text(
                        'Remember',
                        style: titilliumRegular,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Forgot Password',
                      style: titilliumRegular.copyWith(
                        color: ColorResources.getLightSkyBlue(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 30),
              child: CustomButton(
                buttonText: 'Sign In',
                onTap: loginUser,
              ),
            ),
            const SizedBox(width: Dimensions.paddingSizeDefault),
            const SizedBox(width: Dimensions.paddingSizeDefault),
            Center(
              child: Text(
                'OR',
                style: titilliumRegular.copyWith(
                    fontSize: Dimensions.fontSizeDefault),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const DashboardPage();
                  }),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(
                  left: Dimensions.marginSizeAuth,
                  right: Dimensions.marginSizeAuth,
                  top: Dimensions.marginSizeAuthSmall,
                ),
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text('Continue as Guest',
                    style: titleHeader.copyWith(
                        color: ColorResources.getPrimary(context))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
