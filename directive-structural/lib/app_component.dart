import 'package:angular/angular.dart';
import 'package:myapp/src/directive_my_lister.dart';
import 'package:myapp/src/directive_my_dummy.dart';

@Component(
    selector: 'app-component',
    templateUrl: 'app_component.html',
    directives: [MyListerDirective, MyDummyDirective],
)
class AppComponent {
    List<int> getData() => [100, 200, 300];
    List<int> data = [10, 20, 30];
}
