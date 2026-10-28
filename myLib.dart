class Employee {
  String name;
  double basicSalary;
  int overtimeHours;

  Employee(this.name, this.basicSalary, this.overtimeHours);

  double get overtimeRate => basicSalary >= 4000 ? 11 : 7;


  double get overtimePayment => overtimeHours * overtimeRate;

  double calculateTotalPayment() => basicSalary + overtimePayment;

  static String formatMoney(double value) {
    String digits = value.toStringAsFixed(0);
    return digits.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => ',',
    );
  }
}
