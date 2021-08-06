import 'package:calisthenics_logger_2/core/authentication/firebase/firebase_service.dart';
import 'package:calisthenics_logger_2/core/authentication/firebase/my_facebook_sign_in.dart';
import 'package:calisthenics_logger_2/core/authentication/firebase/sign_in_base.dart';
import 'package:calisthenics_logger_2/core/authentication/state_management/auth_provider.dart';
import 'package:calisthenics_logger_2/core/constants.dart';
import 'package:calisthenics_logger_2/presentation/custom_icons_icons.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Container.dart';
import 'package:calisthenics_logger_2/presentation/widgets/styled_Scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final bool isSignUp;

  const LoginPage({Key? key, required this.isSignUp}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Selector<AuthProvider, bool>(
          selector: (_, provider) => provider.isSignUpScreen,
          builder: (_, isLogInScreen, __) {
            return StyledScaffold.withSampleData(
              title: isLogInScreen ? 'Sign up' : 'Log in',
              body: StyledContainer(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SocialLoginRow(
                    isSignUp: isLogInScreen,
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
                  isLogInScreen
                      ? LoginTextField(
                          hintText: 'Re-enter your password',
                          iconData: Icons.password_outlined,
                          headerText: 'Confirm Password',
                          isPassword: true,
                        )
                      : Container(),
                  LoginButton(
                    isSignUp: isLogInScreen,
                  ),
                  NewAccountRow(
                    isSignUp: isLogInScreen,
                  ),
                ],
              )),
            );
          }),
    );
  }
}

class SocialLoginRow extends StatelessWidget {
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
                signInBase: new SignInBase(),
              ),
              SizedBox(width: 16),
              SocialLoginButton(
                iconData: CustomIcons.facebook,
                signInBase: new MyFacebookSignIn(),
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
  final SignInBase signInBase;
  const SocialLoginButton({
    Key? key,
    required this.iconData,
    required this.signInBase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          onPressed: () {
            Provider.of<AuthProvider>(context, listen: false)
                .signIn(signInBase, context);
          }, //onPressed,
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
                onTap: () {
                  Provider.of<AuthProvider>(context, listen: false)
                      .toggleSignUpScreen();
                },
              )
            : InkWell(
                child: Text('Sign up'),
                onTap: () {
                  Provider.of<AuthProvider>(context, listen: false)
                      .toggleSignUpScreen();
                },
              ),
      ],
    );
  }
}
