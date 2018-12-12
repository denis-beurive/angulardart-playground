// This file implements a list looper.

/// The class implements a list looper.
class ListLooper {
  final List<String> _list;
  int _index=0;
  ListLooper(this._list);
  /// Return the "next" element.
  String next() {
    _index = ++_index % _list.length;
    return _list[_index];
  }
}