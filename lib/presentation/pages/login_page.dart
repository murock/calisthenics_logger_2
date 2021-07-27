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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SocialLoginButton(
                    iconData: CustomIcons.google,
                  ),
                  SocialLoginButton(
                    iconData: CustomIcons.facebook,
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.mail_outline),
                ),
              ),
            ],
          ),
        ));
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Icon(iconData),
            )),
      ),
    );
  }
}
