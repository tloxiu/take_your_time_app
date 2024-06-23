class ListItem {
  String todoText;
  bool isChecked;

  ListItem({required this.todoText, required this.isChecked});
}

List<ListItem> todoUserList = [
  ListItem(
    todoText:
        "Think of something that you've done that was fun. Remember why you liked it.",
    isChecked: true,
  ),
  ListItem(
      todoText:
          "Sit in a comfortable position that is relaxing. Close your eyes and listen to the environment.",
      isChecked: false),
  ListItem(
      todoText:
          "Find someone you care about. Tell them how much you care about them.",
      isChecked: false),
  ListItem(
      todoText:
          "Have a nice breakfast with a calm mind, enjoy the food, and the company you have.",
      isChecked: true),
  ListItem(
      todoText: "Take a deep breath three times when you're stressed.",
      isChecked: false)
];
