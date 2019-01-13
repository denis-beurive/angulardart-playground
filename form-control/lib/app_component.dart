import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';


@Component(
  selector: 'app-component',
  templateUrl: 'app_component.html',
  directives: const [formDirectives, coreDirectives]
)
class AppComponent {
  Control fullName = Control('');

  void onSubmit(var value) {
    // <input type="text" ngControl="address"/>
    print(value['address']);
  }
}
