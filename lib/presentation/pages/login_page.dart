import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:calisthenics_logger_2/presentation/custom_icons_icons.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledScaffold.withSampleData(
        title: 'Log in',
        body: StyledContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SocialLoginRow(),
              LoginTextField(
                hintText: 'Enter your email',
                iconData: Icons.mail_outline,
                headerText: 'Email',
              ),
              LoginTextField(
                hintText: 'Enter your password',
                iconData: Icons.password_outlined,
                headerText: 'Password',
              ),
              LoginButton(),
              NewAccountRow(),
            ],
          ),
        ));
  }
}

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Log in with one of the following options'),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SocialLoginButton(
                iconData: CustomIcons.google,
              ),
              SizedBox(width: 16),
              SocialLoginButton(
                iconData: CustomIcons.facebook,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final IconData iconData;
  const SocialLoginButton({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Icon(iconData),
          )),
    );
  }
}

class LoginTextField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final String headerText;
  const LoginTextField({
    Key? key,
    required this.hintText,
    required this.iconData,
    required this.headerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(headerText),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              ),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 20),
              prefixIcon: Icon(iconData),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 20, bottom: 20.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'Log in',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        style: ElevatedButton.styleFrom(primary: CONTRAST_COLOUR),
      ),
    );
  }
}

class NewAccountRow extends StatelessWidget {
  const NewAccountRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(width: 5),
        Text('Sign up'),
      ],
    );
  }
}
