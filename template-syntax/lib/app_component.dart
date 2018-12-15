import 'package:angular/angular.dart';

@Component(
  selector: 'app-component',
  templateUrl: 'app_component.html',
  directives: const [coreDirectives]
)
class AppComponent {
  String titleValue = '...';
  bool showNote = true;
  List<String> days = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'];

  void setTile(String title) {
    titleValue = title;
  }

  void toggleNote() {
    showNote = ! showNote;
  }
}
