import 'package:flutter/material.dart';
import 'pageone.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      value: 0.0,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeTransition(
              opacity: _animation,
              child: Container(
                alignment: Alignment.center,
                width: 300,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: const Text(
                  "Welcome to\n BMI",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                    ) {
                      return const PageOne();
                    },
                    transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return SlideTransition(
                        position: animation.drive(
                          Tween(
                            begin: const Offset(1, 0),
                            end: const Offset(0, 0),
                          ).chain(
                            CurveTween(
                              curve: Curves.easeOutQuint,
                            ),
                          ),
                        ),
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(
                      seconds: 1,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              child: const Text(
                "Start",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
