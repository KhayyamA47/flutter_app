import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'dart:io' show Platform;
import 'package:flutter_app/model/options.dart';
import 'package:flutter_app/services.dart';
import 'package:flutter_app/util/constants.dart';
import 'package:flutter_app/util/mainUtil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_app/widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController controller = TextEditingController();
  int selected;
  Future<Options> options;
  bool isKeyboardShow = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          isKeyboardShow = visible;
        });
      },
    );
    options = getOptions();
  }

  Widget body() {
    return Column(
      children: [
        SlidingHeader(),
        InputAndButton(controller: controller),
        Expanded(
          child: FutureBuilder(
              // perform the future delay to simulate request
              future: options,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Shimmer.fromColors(
                      baseColor: Colors.grey[400],
                      highlightColor: Colors.white,
                      child: GridList(options: null));
                }

                return GridList(options: snapshot.data);
              }),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.ovalViewColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: Constants.backgroundColor,
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(SizeConfig.size10,
                SizeConfig.size8 * 0.5, SizeConfig.size10, SizeConfig.size20),
            height: isKeyboardShow
                ? Platform.isIOS
                    ? SizeConfig.screenHeight * 0.49
                    : SizeConfig.screenHeight * 0.42
                : SizeConfig.screenHeight * 0.47,
            child: body(),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SizeConfig.size16),
                  topRight: Radius.circular(SizeConfig.size16)),
            ),
          )
        ],
      ),
    );
  }
}