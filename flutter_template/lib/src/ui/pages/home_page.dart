import 'package:flutter/material.dart';
import 'package:flutter_template/values/k_api.dart';
import 'package:flutter_template/values/k_colors.dart';
import 'package:flutter_template/values/k_icons.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
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
  PageArgs? args;

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
              const Text(
                "Prueba",
                style: TextStyle(color: KPrimary),
              ),
              const Text(
                KApiUrl,
              ),
              const Text(
                KApiLogin,
              ),
              Image.asset(KIconExamplePath)
            ],
          ),
        ),
      ),
    );
  }
}
