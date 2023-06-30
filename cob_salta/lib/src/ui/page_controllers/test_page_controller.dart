// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:mvc_pattern/mvc_pattern.dart';

// Project imports:
import '../../interfaces/i_view_controller.dart';
import '../../utils/page_args.dart';

class TestPageController extends ControllerMVC implements IViewController {
  static late TestPageController _this;

  factory TestPageController() {
    _this = TestPageController._();
    return _this;
  }

  static TestPageController get con => _this;
  PageArgs? args;
  TestPageController._();

  bool isLoading = false;
  TextEditingController controller = TextEditingController();

  @override
  void initPage({PageArgs? arguments}) {
    controller = TextEditingController();
  }

  @override
  disposePage() {}
}