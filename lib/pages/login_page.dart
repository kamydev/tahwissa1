import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:firebase_core/firebase_core.dart';
class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();
/*Future  SingIn() async {
  await 
}*/
  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Image.asset(
                'assets/illustration.png',
                height: 300,
              ),
            ),
            Text(
              'Log In ',
              style: GoogleFonts.robotoCondensed(
                textStyle: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text('Welcome back ! Nice to see you again ',
                style: TextStyle(fontSize: 18)),
            const SizedBox(height: 50),
            //Email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 231, 231, 231),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: TextField(
                    controller: email,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                    ),
                  ),
                ),
              ),
            ),
            //Password
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 231, 231, 231),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 8.0,
                    ),
                    child: Text("Sing in"),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not yet a member ? ',
                  style: GoogleFonts.robotoCondensed(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " Sign up now",
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ]),
        ),
      ),
    );
  }
}
