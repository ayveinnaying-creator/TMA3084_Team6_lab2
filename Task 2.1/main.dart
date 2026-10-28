import 'myLib.dart' as emp;

void main() {
  double extraPayPerHr;

  var alex = emp.Employee('Manager', 'Miri', 5000, 10);
  if (alex.salary >= 4000) {
    extraPayPerHr = 10;
  } else {
    extraPayPerHr = 20;
  }

  double total = alex.salary + (alex.overtimeHr * extraPayPerHr);

  print('Total Salary = RM$total');
}
