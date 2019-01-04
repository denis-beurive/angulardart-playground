// This example illustrates the use of the dependency injection design pattern.

import 'package:angular/angular.dart';
import 'package:myapp/src/signup_service.dart';
import 'package:myapp/src/profile_service.dart';
import 'package:myapp/app_component_session_service.dart';

class SignUpData {
  final String login;
  final String password;
  const SignUpData(this.login, this.password);
}

@Component(
  selector: 'app-component',
  templateUrl: 'app_component.html',
  providers: [ClassProvider(SignUpService), ClassProvider(ProfileService)]
)
class AppComponent implements OnInit {
  static const List<SignUpData> _signUpData = [
    SignUpData('a', 'pass1'),
    SignUpData('ab', 'pass2'),
    SignUpData('abc', 'pass3'),
    SignUpData('abcd', 'password_is_ok')
  ];
  static const List<int> _ages = [10, 15, 17, 18, 20];
  static const List<int> _sessions = [10, 50, 100, 150, 200];
  final SignUpService _signUpService;
  final ProfileService _profileService;
  final AppComponentSessionService _sessionService;

  int signUpValid;
  int signUpInvalid;
  int sessionValid;
  int sessionInvalid;
  int ageValid;
  int ageInvalid;

  // Please note that the order in which the parameters appear in the constructor
  // signature does not matter:
  //
  // * AppComponent(AppServiceProfile this._profileService, AppServiceSignUp this._signUpService...) is OK
  // * AppComponent(AppServiceSignUp this._signUpService, AppServiceProfile this._profileService...) is also OK
  //
  // Note that "ProfileService" and "SignUpService" are declared in the annotation
  // @Component(...). However, the last service provider ("AppComponentSessionService")
  // is not declared in the annotation @Component(...). It is declared in the file
  // "main.dart".

  AppComponent(ProfileService this._profileService, SignUpService this._signUpService, AppComponentSessionService this._sessionService);

  void ngOnInit() {
    signUpValid = 0;
    signUpInvalid = 0;
    _signUpData.forEach((SignUpData d) {
      if (_signUpService.loginValidator(d.login) && _signUpService.passwordValidator(d.password)) {
        signUpValid++;
      } else {
        signUpInvalid++;
      }
    });

    ageValid = 0;
    ageInvalid = 0;
    _ages.forEach((int a) {
      if (_profileService.isAdult(a)) { ageValid++; } else { ageInvalid++; }
    });

    sessionValid = 0;
    sessionInvalid = 0;
    _sessions.forEach((int s) {
      if (_sessionService.check(s)) { sessionValid++; } else { sessionInvalid++; }
    });
  }

}
