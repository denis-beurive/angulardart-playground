import 'package:angular/angular.dart';
import 'package:myapp/src/directive_my_blinker.dart';
import 'package:myapp/src/directive_my_highlight.dart';
import 'package:myapp/src/directive_color_alternator.dart';

// Please note the following line:
//
//   directives: const [DirectiveMyBlinker]
//
// This line makes the directives available within the template.

@Component(
  selector: 'app-component',
  templateUrl: 'app_component.html',
  directives: [DirectiveMyBlinker, DirectiveMyHighlight, DirectiveColorAlternator]
)
class AppComponent {

}
