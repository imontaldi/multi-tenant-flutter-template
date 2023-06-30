// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:page_transition/page_transition.dart';

// Project imports:
import '../../../values/k_colors.dart';
import '../../../values/k_icons.dart';
import '../../utils/page_args.dart';
import '../page_controllers/init_page_controller.dart';

class InitPage extends StatefulWidget {
  final PageArgs? args;
  const InitPage(this.args, {Key? key}) : super(key: key);
  @override
  InitPageState createState() => InitPageState();
}

class InitPageState extends StateMVC<InitPage> {
  late InitPageController _con;

  InitPageState() : super(InitPageController()) {
    _con = InitPageController.con;
  }
  @override
  void initState() {
    _con.initPage(arguments: widget.args);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedSplashScreen.withScreenFunction(
          screenFunction: () async {
            await _con.init();
            return _con.goInitialPage();
          },
          animationDuration: const Duration(milliseconds: 1000),
          backgroundColor: KColors.KBackground,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          curve: Curves.linear,
          splashIconSize: double.maxFinite,
          centered: true,
          splash: _content(),
        ),
      ),
    );
  }

  _content() {
    return Image.asset(
      KIcons.KIconSplashIcon,
      height: 200,
      width: 200,
    );
  }
}
