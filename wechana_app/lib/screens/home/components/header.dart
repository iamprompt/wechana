import 'package:flutter/material.dart';
import 'package:wechana_app/config/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 10,
            left: 20,
            right: 20,
            bottom: 25),
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Row(
          children: <Widget>[
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: 'Welcome\n',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: 'Supakarn!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold)),
            ])),
            const Spacer(),
            const CircleAvatar(
              radius: 35,
              backgroundImage:
                  AssetImage('assets/images/avatar_placeholder.jpg'),
            ),
          ],
        ));
  }
}
