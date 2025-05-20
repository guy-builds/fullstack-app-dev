
import 'dart:io';

List<Map<String, dynamic>> expenses = [];

void main () {
  print("Welcome to our Personal Expense Tracker.\n Choose an option below:");

  while(true) {
  print(''' 
            1.) Add an expense \n 
            2.) View all expenses \n 
            3.) View total spending \n 
            4.) Exit
      ''');
      
      // User enters a choice
      stdout.write("Choose option [1, 2, 3, 4]: \n");
      String? choiceInput = stdin.readLineSync();

      //Check for choice input validation
        int? userChoice = int.tryParse(choiceInput ?? ''); 
        if (userChoice == null || userChoice < 1 || userChoice > 4) {
          print("Invalid option! Choose option[1, 2, 3, 4] \n");
        } else if (userChoice == 1) {
          stdout.write("Enter expense description: \n");
          // User enters description
          String? description = stdin.readLineSync();
        
          // Check for description validation
          if (description == null || description.trim().isEmpty) {
            print("Invalid description! Enter a valid description. \n");
            continue;
          } 

          // User enters an amount 
          stdout.write("Enter amount: \n");
          String? amountInput = stdin.readLineSync();

          // Check for amount validation
            double? amount = double.tryParse(amountInput ?? '');

            if (amount == null || amount <= 0) {
              print("Invalid amount! Please enter a valid amount. \n");
              continue;
            }

            addExpense(description, amount);
            print("Expense added successfully. \n");
        } else if (userChoice == 2) {
          viewExpense(expenses);

        } else if (userChoice == 3) {
          calculateTotal(expenses);

        } else if (userChoice == 4) {
          print("Thank you for using our Personal Expense Tracker.");
          break;
        }
  }
}

      

void addExpense(String description, double amount) {
  Map<String, dynamic> expense = 
  {
    'description': description,
     'amount': amount
  };
  expenses.add(expense); 
}

void viewExpense(List<Map<String, dynamic>> expenses) {
  if (expenses.isEmpty) {
    print("No expenses recorded yet. Add some expenses using the menu options: \n");
  } else {
    print("Your Expenses: \n");
    for (var expense in expenses) {
      print("- ${expense['description']}: \$${expense['amount']}");
    }
    print(' ');
  }
}

void calculateTotal(List<Map<String, dynamic>> expenses) {
  if (expenses.isEmpty) {
    print("No expenses recorded yet. Add some expenses using the menu options: \n");
  } else {
    double total = 0;

    for (var expense in expenses) {
      print("- ${expense['description']}: \$${expense['amount']}");
      total += expense['amount'];
    }
    print("\n Total Spending: \$${total}");
  }
}