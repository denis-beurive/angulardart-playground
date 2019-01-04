import 'dart:math';

// This class provides a default implementation for the session service provider.
// It also defines the required class API that must be implemented in order to
// create a customised session service provider.

class AppComponentSessionService {
  get session => Random.secure().nextInt(100);
  bool check(int session) => session < 100;
}