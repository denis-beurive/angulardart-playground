import 'dart:html';
import 'package:angular/angular.dart';


@Directive(
    selector: '[my-highlight]',
    exportAs: 'myhighlighter'
)
class DirectiveMyHighlight {
  final Element _hostElement;
  int _count = 0;

  DirectiveMyHighlight(this._hostElement);

  // See https://developer.mozilla.org/en-US/docs/Web/Events
  @HostListener('mouseenter')
  void onMouseEnter() {
    _highlight('yellow');
    _count++;
  }

  @HostListener('mouseleave')
  void onMouseLeave() {
    _highlight();
  }

  void _highlight([String color]) {
    _hostElement.style.backgroundColor = color;
  }

  int get count => _count;
}