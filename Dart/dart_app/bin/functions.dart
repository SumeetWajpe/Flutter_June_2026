void main() {
  // printBook("Dr. APJ Abdul Kalam", "Wings Of Fire", 300);

  // Named parameters
  printBook(
    numOfPages: 300,
    author: "Dr. APJ Abdul Kalam",
    title: "Wings of fire",
  );
}

// void printBook(String author, String title, int noOfPages) {
//   print("$author, $title, $noOfPages");
// }

void printBook({
  required String author,
  required String title,
  required int numOfPages,
}) {
  print("$author, $title, $numOfPages");
}
