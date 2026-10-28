
class Employee {
  double basicSalary;
  int overtimeHours;

  Employee(this.basicSalary, this.overtimeHours);

  double calculateOvertime() {
    double overtimeRate;

    if (basicSalary >= 4000) {
      overtimeRate = 10;
    } else {
      overtimeRate = 0;
    }

    return overtimeHours * overtimeRate;
  }

  double calculateTotalPayment() {
    return basicSalary + calculateOvertime();
  }
}

