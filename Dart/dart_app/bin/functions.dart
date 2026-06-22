void main() {
  printBook("Dr. APJ Abdul Kalam", "Wings Of Fire");

  // Named parameters
  // printBook(
  //   numOfPages: 300,
  //   author: "Dr. APJ Abdul Kalam",
  //   title: "Wings of fire",
  // );

  // printBook(numOfPages: 300, title: "India 2020", author: "Nandan Nilakeni");
}

// Default values for positional parameters

void printBook(String author, String title, [int noOfPages = 200]) {
  print("$author, $title, $noOfPages");
}

// Named parameters
// void printBook({
//   required String author,
//   required String title,
//   required int numOfPages,
// }) {
//   print("$author, $title, $numOfPages");
// }

// Optional parameters
// void printBook({String? author, String? title, required int numOfPages}) {
//   print("$author, $title, $numOfPages");
// }
