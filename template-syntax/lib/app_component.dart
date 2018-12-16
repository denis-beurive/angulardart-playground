import 'package:angular/angular.dart';
import 'package:myapp/src/Repeater.dart';
import 'package:myapp/src/ListLooper.dart';

@Component(
  selector: 'app-component',
  templateUrl: 'app_component.html',
  directives: const [coreDirectives]
)
class AppComponent implements OnInit {
  static const List<String> days = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'];

  String titleValue = '...';
  bool showNote = true;
  String currentDay = days[0];

  Repeater repeater = Repeater(20, 1);
  ListLooper dayLooper = ListLooper(days);

  /// See "Lifecycle Hooks" (https://webdev.dartlang.org/angular/guide/lifecycle-hooks)
  /// Note: @override just points out that the function is also defined in an
  ///        ancestor class, but is being redefined to do something else in the
  ///        current class. It's also used to annotate the implementation of an
  ///        abstract method.
  ///        @override is optional to use but recommended as it improves readability.
  @override
  void ngOnInit() {
    repeater.go(() {
      currentDay = dayLooper.next();
    });
  }

  void setTile(String title) {
    titleValue = title;
  }

  void toggleNote() {
    showNote = ! showNote;
  }
}
