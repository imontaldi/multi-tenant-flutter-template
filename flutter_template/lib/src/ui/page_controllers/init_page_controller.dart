// Package imports:
import 'package:mvc_pattern/mvc_pattern.dart';

// Project imports:
import '../../interfaces/i_view_controller.dart';
import '../../managers/data_manager.dart';
import '../../providers/app_provider.dart';
import '../../utils/page_args.dart';
import '../pages/home_page.dart';

class InitPageController extends ControllerMVC implements IViewController {
  static late InitPageController _this;

  factory InitPageController() {
    _this = InitPageController._();
    return _this;
  }

  static InitPageController get con => _this;
  PageArgs? args;
  InitPageController._();

  @override
  void initPage({PageArgs? arguments}) {
    args = arguments;
  }

  @override
  disposePage() {}

  init() async {
    await DataManager().init();
    await AppProvider().init();
  }

  goInitialPage() {
    //TODO: Add logic for Login or Home
    return const HomePage(null);
  }
}
