import 'dart:math';
import 'package:myapp/app_component_session_service.dart';

// This class implements a customized session service provider.
//
// Please note that the class "SessionService" can implement or extend
// "AppComponentSessionService". That is:
//
// class SessionService implements AppComponentSessionService... is OK.
// class SessionService extends AppComponentSessionService... is also OK.

class SessionService implements AppComponentSessionService {
  get session => Random.secure().nextInt(100);
  bool check(int session) => session < 100;
}
