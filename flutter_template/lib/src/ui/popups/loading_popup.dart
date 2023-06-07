import 'package:flutter/material.dart';
import 'package:flutter_template/src/managers/config_manager.dart';
import '/src/ui/components/loading_component.dart';
import '/src/support/futuristic.dart';

class LoadingPopup {
  final BuildContext context;
  final Color backgroundColor;
  final Future onLoading;
  Function? onResult;
  Function? onError;

  LoadingPopup({
    required this.context,
    required this.onLoading,
    this.onResult,
    this.onError,
    this.backgroundColor = const Color(0x80707070),
  });

  final double radius = 20;

  Future show() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return _dialog();
        });
  }

  _dialog() {
    return Futuristic(
      autoStart: true,
      futureBuilder: () => onLoading,
      busyBuilder: (context) => body(),
      onData: (data) {
        Navigator.pop(context);
        onResult!(data);
      },
      onError: (error, retry) {
        Navigator.pop(context);
        onError!(error);
      },
    );
  }

  body() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ConfigManager().colors.KPrimary.withOpacity(0.5),
            ConfigManager().colors.KPrimary.withOpacity(0.5)
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          loadingComponent(true, color: Colors.white, size: 50),
        ],
      ),
    );
  }
}
