abstract class EventObserver {
  /// This method is invoked by the ViewModel
  /// and should contain the state update logic of the UI.
  void notify(ViewEvent event);
}

abstract class ViewEvent {
  String qualifier;

  ViewEvent(this.qualifier);

  @override
  String toString() {
    return 'ViewEvent{qualifier: $qualifier}';
  }
}