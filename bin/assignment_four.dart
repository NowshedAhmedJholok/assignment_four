abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
    }
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount > 0 && balance >= amount) {
      balance -= amount;
      balance += balance * (interestRate / 100);
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount > 0) {
      if (balance + overdraftLimit >= amount) {
        balance -= amount;
      } else {
        print("Insufficient funds!");
      }
    }
  }
}

void main() {
  // Create an instance of SavingsAccount
  var savingsAccount = SavingsAccount(101, 1000.0, 5.0);
  print("Savings Account - Initial Balance: ${savingsAccount.balance}");
  savingsAccount.deposit(500);
  print("Savings Account - After Deposit: ${savingsAccount.balance}");
  savingsAccount.withdraw(200);
  print("Savings Account - After Withdrawal: ${savingsAccount.balance}");

  // Create an instance of CurrentAccount
  var currentAccount = CurrentAccount(201, 1500.0, 1000.0);
  print("Current Account - Initial Balance: ${currentAccount.balance}");
  currentAccount.deposit(300);
  print("Current Account - After Deposit: ${currentAccount.balance}");
  currentAccount.withdraw(2000);
  print("Current Account - After Withdrawal: ${currentAccount.balance}");
}
