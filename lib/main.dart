import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uidesigntocode_2/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: WelcomePage());
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.03,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/welcome_bg.jpg"),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "EXPLORE\n",
                style: TextStyle(
                  height: height * 0.0012,
                  fontSize: 50,
                  fontWeight: FontWeight.normal,
                ),
                children: const [
                  TextSpan(
                    text: "SOLAR\nSYSTEM",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const HomePage(),
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_right_alt,
                color: Colors.grey[500],
                size: height * 0.045,
              ),
            )
          ],
        ),
      ),
    );
  }
}
