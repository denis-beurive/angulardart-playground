// This example illustrates the use of the dependency injection design pattern.

import 'package:angular/angular.dart';
import 'package:myapp/src/signup_service.dart';
import 'package:myapp/src/profile_service.dart';

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
  final SignUpService _signUpService;
  final ProfileService _profileService;

  int signUpValid;
  int signUpInvalid;
  int ageValid;
  int ageInvalid;

  // Please note that the order in which the parameters appear in the constructor
  // signature does not matter:
  //
  // * AppComponent(this._profileService, this._signUpService) is OK
  // * AppComponent(this._signUpService, this._profileService) is also OK
  AppComponent(this._profileService, this._signUpService);

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
  }

}
