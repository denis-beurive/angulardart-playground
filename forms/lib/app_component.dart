import 'package:angular/angular.dart';
// Do not forget to import the form directives.
import 'package:angular_forms/angular_forms.dart';

import 'package:myapp/src/validator_full_name.dart';
import 'package:myapp/src/member_subscription_data.dart';



@Component(
    selector: 'app-component',
    templateUrl: 'app_component.html',
    // Do not forget to export the set of directives to the template.
    // formDirectives: for ngModel.
    // coreDirectives: for ngFor.
    // ValidatorFullName: for the custom validator.
    directives: const [formDirectives, coreDirectives, ValidatorFullName],
    // **WARNING !!!** The last "," is mandatory !!!
    // Why ???
    exports: [MemberSubscriptionData],
)
class AppComponent {
  // This object is used to hold the form data.
  MemberSubscriptionData member = MemberSubscriptionData();

}
