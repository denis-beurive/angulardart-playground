import 'package:angular/angular.dart';
import 'package:myapp/src/directive_my_lister.dart';

@Component(
    selector: 'app-component',
    templateUrl: 'app_component.html',
    directives: [MyListerDirective]
)
class AppComponent {

}
