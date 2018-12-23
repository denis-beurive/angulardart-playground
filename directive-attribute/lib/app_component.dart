import 'package:angular/angular.dart';
import 'package:myapp/src/directive-my-blinker.dart';

// Please note the following line:
//
//   directives: const [DirectiveMyBlinker]
//
// This line makes the directives available within the template.

@Component(
  selector: 'app-component',
  templateUrl: 'app_component.html',
  directives: const [DirectiveMyBlinker]
)
class AppComponent {

}
