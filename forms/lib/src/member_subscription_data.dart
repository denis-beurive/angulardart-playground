
/// This class holds data read from the sign-up form.
/// It contains data that describes the new member.
class MemberSubscriptionData {
  static List<String> languages = const ['English', 'French', 'Spanish', 'Italian'];

  // Properties bound to the form entries.
  // All these properties are "two-way bound" (using the "ngModel" directive).
  String fullName;
  String mailingAddress;
  String emailAddress;
  String phoneNumber;
  String password;
  String passwordConfirmation;
  String language = languages[0];
  bool agreement;
}