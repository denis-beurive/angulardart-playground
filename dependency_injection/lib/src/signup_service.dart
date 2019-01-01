

class MyService {
  bool loginValidator(String login) {
    return login.length > 3 && login.length < 15;
  }
  bool passwordValidator(String password) {
    return password.length > 10 && password.length < 20;
  }
}

