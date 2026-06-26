import 'package:flutter/material.dart';
import 'package:flutterdemy_basics/models/course_model.dart';

class CourseListNotifier extends ChangeNotifier {
  final List<CourseModel> listofcourses = [
    CourseModel(
      1,
      "React",
      "A JS library",
      100,
      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/3840px-React-icon.svg.png?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=thumbnail",
      "React (also known as React.js or ReactJS) is a free and open-source front-end JavaScript library[6][7] that aims to make building user interfaces based on components more seamless. It is maintained by Meta (formerly Facebook) and a community of individual developers and companies.[8][9][10] According to the 2025 Stack Overflow Developer Survey, React is one of the most commonly used web technologies.React can be used to develop single-page, mobile, or server-rendered applications with frameworks like Next.js and React Router. Because React is only concerned with the user interface and rendering components to the DOM, React applications often rely on libraries for routing and other client-side functionality.[12][13] A key advantage of React is that it only re-renders those parts of the page that have changed, avoiding unnecessary re-rendering of unchanged DOM elements. React is used by an estimated 6% of all websites.",
      5,
      DateTime.now().subtract(const Duration(days: 20)),
      "English",
      ["English", "German", "Spanish"],
      "Jack Well",
    ),
    CourseModel(
      2,
      "Node",
      "A Server FX",
      200,
      "https://miro.medium.com/v2/resize:fit:800/1*bc9pmTiyKR0WNPka2w3e0Q.png",
      "Node.js is an open-source and cross-platform JavaScript runtime environment. It is a popular tool for almost any kind of project!Node.js is an open-source and cross-platform JavaScript runtime environment. It is a popular tool for almost any kind of project!Node.js is an open-source and cross-platform JavaScript runtime environment. It is a popular tool for almost any kind of project!Node.js is an open-source and cross-platform JavaScript runtime environment. It is a popular tool for almost any kind of project!Node.js is an open-source and cross-platform JavaScript runtime environment. It is a popular tool for almost any kind of project!",
      3,
      DateTime.now().subtract(const Duration(days: 50)),
      "English",
      ["English", "Spanish"],
      "Patrick Jonas",
    ),
    CourseModel(
      3,
      "Angular",
      "A JS FX",
      500,
      "https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Angular_gradient_logo.png/960px-Angular_gradient_logo.png?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=thumbnail",
      "Angular is a comprehensive, open-source web application framework created and maintained by Google. It is primarily used to build dynamic, scalable Single-Page Applications (SPAs) using TypeScript. ",
      4,
      DateTime.now().subtract(const Duration(days: 10)),
      "English",
      ["English", "German", "Spanish"],
      "Jacob Mansion",
    ),
    CourseModel(
      4,
      "Flutter",
      "A Cross Platform solution",
      200,
      "https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png",
      "Flutter is an open-source UI software development kit (SDK) created by Google that allows developers to build natively compiled applications for mobile, web, and desktop from a single codebase. Flutter is an open-source UI software development kit (SDK) created by Google that allows developers to build natively compiled applications for mobile, web, and desktop from a single codebase. ",
      5,
      DateTime.now().subtract(const Duration(days: 10)),
      "English",
      ["English", "German", "Spanish"],
      "Jacob Mansion",
    ),
  ];

  void deleteACourse(int index) {
    // delete the course
    listofcourses.removeAt(index);
    notifyListeners();
  }

  void addnewCourse(CourseModel newCourse) {
    // add the course to listofcourses
    print(newCourse.title);
  }
}
