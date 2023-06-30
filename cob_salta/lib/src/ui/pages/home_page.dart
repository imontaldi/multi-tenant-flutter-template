// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:mvc_pattern/mvc_pattern.dart';

// Project imports:
import '../../../values/k_api.dart';
import '../../../values/k_colors.dart';
import '../../../values/k_icons.dart';
import '../../../values/k_strings.dart';
import '../../managers/translate_manager.dart';
import '../../utils/page_args.dart';
import '../page_controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  final PageArgs? args;
  const HomePage(this.args, {Key? key}) : super(key: key);

  @override
  HomePagePageState createState() => HomePagePageState();
}

class HomePagePageState extends StateMVC<HomePage> {
  late HomePageController _con;

  HomePagePageState() : super(HomePageController()) {
    _con = HomePageController.con;
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
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                TranslateManager().texts().test,
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                "Prueba",
                style: TextStyle(
                  color: KColors.KPrimary,
                ),
              ),
              Text(
                KApi.KApiUrl,
              ),
              Text(
                KApi.KApiLogin,
              ),
              Image.asset(
                KIcons.KIconEnrollmentType,
                height: 20,
              ),
              Text(
                KStrings.KEnrollmentName,
              )
            ],
          ),
        ),
      ),
    );
  }
}
