import 'package:flutter/material.dart';
import 'package:wechana_app/widgets/appbar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
          context: context,
          aboutus: false,
          titleElement: const Text(
            'About Us',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Prompt-Profile.png',
                    width: 200,
                    height: 200,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Mr. Supakarn Laorattanakul',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Mahidol University, 2023: Bachelor of Science (ICT)',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const Text(
                'Skooldio E-Learning Providers, 2022: Software Engineer Intern',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Time-Profile.png',
                    width: 200,
                    height: 200,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Mr. Thanaboon Sapmontree',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Mahidol University, 2023: Bachelor of Science (ICT)',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const Text(
                'LINE Company (Thailand), 2022: Product Designer Intern',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ));
  }
}
