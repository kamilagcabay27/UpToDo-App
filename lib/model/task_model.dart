class UpToDo {
  String? id;
  String? task;
  String? description;
  bool isDone;

  UpToDo({
    this.id,
    this.task,
    this.description,
    this.isDone = false,
  });

  static List<UpToDo> uptodoList() {
    return [
      UpToDo(
          id: '1',
          task: 'Do math homework',
          description: 'Work',
          isDone: false),
      UpToDo(
          id: '2', task: 'Write code', description: 'Developer', isDone: true),
      UpToDo(
          id: '3', task: 'Write code', description: 'Developer', isDone: true),
    ];
  }
}
