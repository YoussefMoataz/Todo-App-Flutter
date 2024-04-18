class Todo {
  static int _id = 0;
  int id = 0;
  String title;
  String description;
  bool isFinished = false;

  Todo({required this.title, required this.description}) {
    _id++;
    id = _id;
  }

  void finish() {
    isFinished = true;
  }

  void unFinish() {
    isFinished = false;
  }

}
