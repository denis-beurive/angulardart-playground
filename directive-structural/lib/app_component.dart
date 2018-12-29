import 'package:angular/angular.dart';
import 'package:myapp/src/directive_my_dummy.dart';

@Component(
    selector: 'app-component',
    templateUrl: 'app_component.html',
    directives: [MyDummyDirective],
)
class AppComponent {
    List<String> getColors() => ['red', 'green', 'blue'];
    String data = 'AppComponent.data';
}
