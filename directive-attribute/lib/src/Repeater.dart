// The file implements a repeater.
// A repeater executes a given function periodically.

/// Signature of the function that implements the action to repeat.
typedef void RepeaterAction();

/// This class implements a repeater.
/// A repeater executes a given function periodically.
class Repeater {
  final int _total;
  final int _delay;
  int _count=0;

  int get count => _count;

  Repeater(this._total, this._delay);
  void go(RepeaterAction action) {
    Future.delayed(Duration(seconds: _delay)).then((var v) {
      action();
      if (_count < _total) {
        _count++;
        go(action);
      }
    });
  }
}