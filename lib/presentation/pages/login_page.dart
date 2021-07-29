import 'package:calisthenics_logger_2/core/authentication/firebase/firebase_service.dart';
import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:calisthenics_logger_2/presentation/custom_icons_icons.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final bool isSignUp;

  const LoginPage({Key? key, required this.isSignUp}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return StyledScaffold.withSampleData(
        title: this.widget.isSignUp ? 'Sign up' : 'Log in',
        body: StyledContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SocialLoginRow(
                isSignUp: this.widget.isSignUp,
              ),
              LoginTextField(
                hintText: 'Enter your email',
                iconData: Icons.mail_outline,
                headerText: 'Email',
                isPassword: false,
              ),
              LoginTextField(
                hintText: 'Enter your password',
                iconData: Icons.password_outlined,
                headerText: 'Password',
                isPassword: true,
              ),
              this.widget.isSignUp
                  ? LoginTextField(
                      hintText: 'Re-enter your password',
                      iconData: Icons.password_outlined,
                      headerText: 'Confirm Password',
                      isPassword: true,
                    )
                  : Container(),
              LoginButton(
                isSignUp: this.widget.isSignUp,
              ),
              NewAccountRow(
                isSignUp: this.widget.isSignUp,
              ),
            ],
          ),
        ));
  }
}

class SocialLoginRow extends StatelessWidget {
  _googleLogin() async {
    FirebaseService service = new FirebaseService();
    try {
      await service.signInWithGoogle();
    } catch (e) {
      print(e);
    }
  }

  final bool isSignUp;
  const SocialLoginRow({
    Key? key,
    required this.isSignUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isSignUp
              ? Text('Sign up with one of the following options')
              : Text('Log in with one of the following options'),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SocialLoginButton(
                iconData: CustomIcons.google,
                onPressed: _googleLogin,
              ),
              SizedBox(width: 16),
              SocialLoginButton(
                iconData: CustomIcons.facebook,
                onPressed: _googleLogin,
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
  final VoidCallback onPressed;
  const SocialLoginButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          onPressed: onPressed,
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
  final bool isPassword;
  const LoginTextField({
    Key? key,
    required this.hintText,
    required this.iconData,
    required this.headerText,
    required this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(headerText),
          SizedBox(
            height: 5,
          ),
          TextField(
            style: TextStyle(fontSize: 20, height: 1),
            obscureText: this.isPassword,
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
  final bool isSignUp;
  const LoginButton({
    Key? key,
    required this.isSignUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 20, bottom: 20.0),
      child: ElevatedButton(
        onPressed: () async {
          FirebaseService service = new FirebaseService();
          try {
            await service.signInWithGoogle();
          } catch (e) {
            print(e);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: isSignUp
              ? Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.subtitle1,
                )
              : Text(
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
  final bool isSignUp;
  const NewAccountRow({
    Key? key,
    required this.isSignUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSignUp
            ? Text(
                "Already have an account?",
                style: TextStyle(color: Colors.grey),
              )
            : Text(
                "Don't have an account?",
                style: TextStyle(color: Colors.grey),
              ),
        SizedBox(width: 5),
        isSignUp
            ? InkWell(
                child: Text('Log in'),
                onTap: () {},
              )
            : InkWell(
                child: Text('Sign up'),
                onTap: () {},
              ),
      ],
    );
  }
}
