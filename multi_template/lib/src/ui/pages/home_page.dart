// Flutter imports:
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:multi_template/values/k_resouces.dart';
=======
import 'package:multi_template/values/k_colors.dart';
>>>>>>> parent of 72d4774 (add icon class)

// Package imports:
import 'package:mvc_pattern/mvc_pattern.dart';

// Project imports:
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
                  color: kColors("KPrimary"),
                ),
              ),
              Text(
                KApi().KApiUrl,
              ),
              Text(
                KApi().KApiLogin,
              ),
              Image.asset(
                kIconsPaths("KIconExamplePath"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
