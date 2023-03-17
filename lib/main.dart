// ignore_for_file: prefer_const_constructors

import 'package:curriculum_vita/skill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  num vari = 1;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: vari == 1 ? themeLight() : themeDark(),
      home: Profile(
        onIconTap: () {
          setState(() {
            vari == 1 ? vari = 0 : vari = 1;
          });
        },
      ),
    );
  }
}

ThemeData themeLight() {
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.lightGreen,
    primaryColor: Colors.lightBlue[800],
    appBarTheme: AppBarTheme(backgroundColor: Colors.amber),
    scaffoldBackgroundColor: Color.fromARGB(255, 225, 213, 213),
    dividerTheme: DividerThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}

ThemeData themeDark() {
  return ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.green,
    primaryColor: Colors.grey,
    appBarTheme: AppBarTheme(backgroundColor: Colors.black),
    scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
    dividerTheme: DividerThemeData(color: Colors.white),
    textTheme: TextTheme(
      headline6: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}

class Profile extends StatefulWidget {
  final Function() onIconTap;

  const Profile({Key? key, required this.onIconTap}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

enum _SkillType { nodeJs, flutter, js, network }

class _ProfileState extends State<Profile> {
  _SkillType _skill = _SkillType.flutter;
  void updateSelectedSkill(_SkillType skillType) {
    setState(() {
      _skill = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curriculum Vitae'),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 20),
            child: InkWell(
              onTap: widget.onIconTap,
              child: Icon(CupertinoIcons.ellipsis_vertical),
            ),
          ),
        ],
        toolbarHeight: 66,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 37, 25, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/profile.jpg",
                      width: 62,
                      height: 62,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Farnush Kazemi",
                          // style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Flutter & Nodejs Developer",
                          // style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.location_solid,
                              // color: Theme.of(context).textTheme.caption!.color,
                              // size:
                              //     Theme.of(context).textTheme.caption!.fontSize,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "Marvdasht, Iran",
                              // style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    // color: Theme.of(context).primaryColor,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "I am a developer. I want to be the best developer in flutter. I try and try until achieve my goal. I know I can do it well. I remember struggling with every kind of difficulty. ",
                // style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(
                height: 12,
              ),
              Divider(),
              SizedBox(
                height: 12,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,//default
                children: [
                  Text(
                    "Skills",
                    // style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    CupertinoIcons.chevron_down,
                    size: 12,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Wrap(
                // direction: Axis.horizontal, //default
                spacing: 15,
                runSpacing: 15,
                children: [
                  Skill(
                    title: "Flutter",
                    imgPath: "assets/images/flutter-icon.png",
                    shadowColor: Colors.blue,
                    isActive: _skill == _SkillType.flutter,
                    onTap: () {
                      updateSelectedSkill(_SkillType.flutter);
                    },
                  ),
                  Skill(
                    title: "JavaScript",
                    imgPath: "assets/images/js-icon.png",
                    shadowColor: Colors.yellow,
                    isActive: _skill == _SkillType.js,
                    onTap: () {
                      updateSelectedSkill(_SkillType.js);
                    },
                  ),
                  Skill(
                    title: "Node Js",
                    imgPath: "assets/images/nodejs-icon.png",
                    shadowColor: Colors.green,
                    isActive: _skill == _SkillType.nodeJs,
                    onTap: () {
                      updateSelectedSkill(_SkillType.nodeJs);
                    },
                  ),
                  Skill(
                    title: "Network Plus",
                    imgPath: "assets/images/network-icon.png",
                    shadowColor: Colors.greenAccent,
                    isActive: _skill == _SkillType.network,
                    onTap: () {
                      updateSelectedSkill(_SkillType.network);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Divider(),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
