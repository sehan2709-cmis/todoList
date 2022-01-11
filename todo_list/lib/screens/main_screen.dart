import 'package:flutter/material.dart';
import 'package:todo_list/config/palette.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.lightBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.90,
                width: MediaQuery.of(context).size.width * 0.94,
                decoration: BoxDecoration(
                    color: Palette.middleBackgroundColor,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Palette.darkBackgroundColor.withOpacity(0.4),
                        blurRadius: 15,
                        spreadRadius: 5,
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Todo List",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Palette.textColor3,
                      ),
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width * 0.74,
                      color: Colors.blueGrey,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/s");
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 32,
                        width: 310,
                        decoration: BoxDecoration(
                            color: Palette.lightBackgroundColor,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ]),
                        child: const Text(
                          "tap to start the app",
                          style: TextStyle(
                            fontSize: 18,
                            color: Palette.textColor2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
