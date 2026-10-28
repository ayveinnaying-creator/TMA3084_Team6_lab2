class Employee {
  String name;
  double basicSalary;
  double overtimeHours;

  Employee(this.name, this.basicSalary, this.overtimeHours);

  double calculateTotalPayment() {
    double overtimeRate = 10.0;
    return basicSalary + (overtimeHours * overtimeRate);
  }
}