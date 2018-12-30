import 'package:angular/angular.dart';
import 'package:myapp/src/directive_my_dummy.dart';
import 'package:myapp/src/directive_my_repeater.dart';
import 'package:myapp/src/repeater.dart';

@Component(
    selector: 'app-component',
    templateUrl: 'app_component.html',
    directives: [MyDummyDirective, MyRepeaterDirective],
)
class AppComponent implements OnInit {

    static const List<String> colors = ['red', 'green', 'blue'];
    // The repeater is used to periodically change the values of some exported
    // properties.
    Repeater r = Repeater(30, 1);
    int index = 0;
    String color = colors[0];

    void ngOnInit() {
        r.go(() {
            index = (index + 1) % colors.length;
            color = colors[index];
        });
    }
}
