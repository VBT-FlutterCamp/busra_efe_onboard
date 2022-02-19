import 'package:flutter/material.dart';
import 'package:hm_onboard/product/components/app_color.dart';
import 'package:hm_onboard/product/components/app_string.dart';
import 'package:hm_onboard/product/widgets/custom_formfield.dart';
import 'package:kartal/kartal.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.loginBackgr,
      body: SingleChildScrollView(
        physics: _emailNode.hasFocus || _passNode.hasFocus
            ? const ScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: context.paddingNormal,
          child: SizedBox(
            height: context.dynamicHeight(1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title(context),
                subTitle(context),
                SizedBox(
                  height: context.dynamicHeight(0.05),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      mailField(),
                      passwordField(),
                    ],
                  ),
                ),
                textForgotPassword(context),
                SizedBox(
                  height: context.dynamicHeight(0.05),
                ),
                loginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text title(BuildContext context) {
    return Text(
      AppString.welcome,
      style: context.textTheme.headline4?.copyWith(color: AppColor.loginText),
    );
  }

  Text subTitle(BuildContext context) {
    return Text(
      AppString.design,
      style: context.textTheme.headline3
          ?.copyWith(color: AppColor.headline, fontWeight: FontWeight.bold),
    );
  }

  CustomFormField mailField() {
    return CustomFormField(
      visible: false,
      focusnode: _emailNode,
      controller: nameController,
      inputType: TextInputType.emailAddress,
      name: AppString.loginMail,
    );
  }

  CustomFormField passwordField() {
    return CustomFormField(
      focusnode: _passNode,
      controller: passwordController,
      name: AppString.loginPass,
      inputType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        icon: const Icon(
          Icons.visibility,
          color: AppColor.loginFormField,
        ),
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
      ),
      visible: _visible,
    );
  }

  Align textForgotPassword(BuildContext context) {
    return Align(
      heightFactor: 3,
      alignment: Alignment.centerRight,
      child: Text(AppString.forgotPass,
          style: context.textTheme.bodyMedium
              ?.copyWith(color: AppColor.loginText)),
    );
  }

  ElevatedButton loginButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: AppColor.loginButton,
            fixedSize: Size(context.width, context.dynamicHeight(0.1))),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(AppString.snackBarText)));
          }
        },
        child: const Text(
          AppString.loginButton,
          style: TextStyle(
            fontSize: 27,
          ),
        ));
  }
}
