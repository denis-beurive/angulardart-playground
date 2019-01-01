import 'package:angular/angular.dart';
import 'package:myapp/src/directive_my_dummy.dart';
import 'package:myapp/src/directive_my_repeater.dart';
import 'package:myapp/src/directive_my_detector.dart';
import 'package:myapp/src/repeater.dart';

@Component(
    selector: 'app-component',
    templateUrl: 'app_component.html',
    directives: [MyDetectorDirective, MyDummyDirective, MyRepeaterDirective]
)
class AppComponent implements OnInit {
    // The repeater is used to periodically change the values of some exported
    // properties.
    Repeater _r = Repeater(30, 1);

    // Properties that will be visible within the component template.
    static const List<String> colors = ['red', 'green', 'blue'];
    int index = 0;
    String color = colors[0];
    int listElementCount = 6;

    void ngOnInit() {
        _r.go(() {
            listElementCount = 6 == listElementCount ? 3 : 6;
            index = (index + 1) % colors.length;
            color = colors[index];
        });
    }
}
