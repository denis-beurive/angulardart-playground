import 'package:angular/angular.dart';
import 'package:myapp/src/Repeater.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'app-component',
    templateUrl: 'app_component.html',

    // *****************************
    // Do not forget the line below:
    // *****************************
    directives: const [formDirectives],

    // Export code that can be used from within the template.
    // Here we export nothing.
    exports: []
)

/// This class serves as a foundation for an auto-generated class that will be called
/// "AppComponentNgFactory".
/// Please note that it implements the interface "OnInit".
/// See "Lifecycle Hooks" (https://webdev.dartlang.org/angular/guide/lifecycle-hooks)
class AppComponent implements OnInit {
  static const String title = 'Two-way binding';
  String inputTitle = 'Enter a title here...';
  Repeater _repeater = Repeater(10, 2);

  /// See "Lifecycle Hooks" (https://webdev.dartlang.org/angular/guide/lifecycle-hooks)
  void ngOnInit() {
    _repeater.go(() {
      inputTitle = inputTitle.toUpperCase();
    });
  }
}
