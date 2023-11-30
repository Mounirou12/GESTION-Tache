import 'dart:io';

class Task {
  String description;
  bool completed;

  Task(this.description, this.completed);
}

class TaskManager {
  List<Task> tasks = [];

  void addTask(String description) {
    tasks.add(Task(description, false));
    print('Tâche ajoutée : $description');
  }

  void removeTask(int index) {
    if (index >= 0 && index < tasks.length) {
      print('Tâche supprimée : ${tasks[index].description}');
      tasks.removeAt(index);
    } else {
      print('Indice de tâche invalide');
    }
  }

  void completeTask(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks[index].completed = true;
      print('Tâche marquée comme accomplie : ${tasks[index].description}');
    } else {
      print('Indice de tâche invalide');
    }
  }

  void displayTasks() {
    print('Liste des tâches :');
    for (int i = 0; i < tasks.length; i++) {
      String status = tasks[i].completed ? '[✅]' : '[❎]';
      print('$status $i: ${tasks[i].description}');
    }
  }
}

void main() {
  TaskManager taskManager = TaskManager();

  while (true) {
    print('\nQue souhaitez-vous faire ?');
    print('1. Ajouter une tâche');
    print('2. Supprimer une tâche');
    print('3. Marquer une tâche comme accomplie');
    print('4. Afficher les tâches');
    print('5. Quitter');

    String choice = stdin.readLineSync() ?? '';
    switch (choice) {
      case '1':
        print('Entrez la description de la tâche :');
        String description = stdin.readLineSync() ?? '';
        taskManager.addTask(description);
        break;

      case '2':
        print('Entrez l\'indice de la tâche à supprimer :');
        int index = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        taskManager.removeTask(index);
        break;

      case '3':
        print('Entrez l\'indice de la tâche à marquer comme accomplie :');
        int index = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        taskManager.completeTask(index);
        break;

      case '4':
        taskManager.displayTasks();
        break;
      case '5':
        print('Au revoir !');
        return;

      default:
        print('Choix invalide');
    }
  }
}