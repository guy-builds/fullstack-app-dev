import 'dart:io';

List<Map<String, dynamic>> studentResults = [];

void main() {

  while(true) {
  print("Welcome to the School's Result Portal.\n Choose an option below:");
  print(''' 
            1.) Add Student's result \n 
            2.) Check Student's result \n 
            3.) View all Departmental's result \n 
            4.) Exit
      ''');

      // user enters a choice
      stdout.write("Choose option [1, 2, 3, 4]: \n");
      String? userInput = stdin.readLineSync();

      // check for input validation
      int? userChoice = int.tryParse(userInput ?? '');
      if (userChoice == null || userChoice < 1 || userChoice > 4) {
        print("Please enter a valid option [1, 2, 3, 4] \n");
      } else if (userChoice == 1) {
        String name = getValidName();
        int score = getValidScore();
        int studentID = getValidID();

        addStudentResult(name, score, studentID);
        print("Student score added successfully \n");
      } else if (userChoice == 2) {
        if (studentResults.isEmpty) {
        print('They are no student results at the moment, add one by choosing option 1 above \n');
        } 
        int studentID = getValidID();
        checkResult(studentResults, studentID);
      } else if (userChoice == 3) {
        departmentalResult(studentResults);
      } else if (userChoice == 4) {
        print("Goodbye!");
        break;
      }
  }
}

void addStudentResult(String name, int score, int studentID) {
  Map<String, dynamic> studentResult = {
    "name": name,
    "score": score,
    "ID": studentID
  };
  studentResults.add(studentResult);
}

 checkResult(List<Map<String, dynamic>> studentResults, studentID) {
  if (studentResults.isEmpty) {
    print('They are no student results at the moment, add one by choosing option 1 above \n');
  } 

  bool found = false;

  for (var student in studentResults) {
    if (student['ID'] == studentID) {
      print("Student Name: ${student['name']}, Score: ${student['score']}, Student ID: ${student['ID']}");

      // Grade student based on their score
      if (student['score'] >= 60 && student['score'] <= 100) {
        print("Grade: Excellent");
      } else if (student['score'] >= 50 && student['score'] <= 59) {
        print("Grade: Pass");
      } else {
        print("Grade: Fail");
      }
      found = true;
      break;
    }
  }
  if (!found) {
      print("No student found with ID $studentID");
  }
}


void departmentalResult(List<Map<String, dynamic>> studentResults) {
  if (studentResults.isEmpty) {
    print('They are no student results at the moment, add one by choosing option 1 above \n');
  } else {
    print("Departmental Results: \n");
    for (var student in studentResults) {
      print("Student Name: ${student['name']}, Score: ${student['score']}, ID: ${student['ID']}");
    }
    print(' ');
  }
}

String getValidName() {
  while(true) {
    stdout.write("Enter student's name: \n");
    String? name = stdin.readLineSync();
    if (name != null && name.trim().isNotEmpty) {
      return name.trim();
    }
    print("Invalid student name! Enter a valid name: \n");
  }
}

int getValidScore() {
  while(true) {
    stdout.write("Enter student's score: \n");
    String? scoreInput = stdin.readLineSync();
    int? score = int.tryParse(scoreInput ?? '');
    if (score != null && score > 0 && score <= 100) {
      return score;
    }
    print("Invalid Score! Enter a valid score: \n");
  }
}

int getValidID() {
  while(true) {
    stdout.write("Enter student's ID: \n");
    String? IDInput = stdin.readLineSync();
    int? studentID = int.tryParse(IDInput ?? '');
    if (studentID != null && studentID > 0) {
      return studentID;
    }
    print("Invalid studentID! Enter a valid ID number: \n");
  }
}