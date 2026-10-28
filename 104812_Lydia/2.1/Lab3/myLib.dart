
class Employee {
  double basicSalary;
  int overtimeHours;

  Employee(this.basicSalary, this.overtimeHours);

  double calculateOvertime() {
    if (basicSalary >= 4000) {
      return overtimeHours * 10;
    } else {
      return 0;
    }
  }

  double calculateTotalPayment() {
    return basicSalary + calculateOvertime();
  }
}
