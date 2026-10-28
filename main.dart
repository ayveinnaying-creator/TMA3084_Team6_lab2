import 'myLib.dart';

void main() {
  Employee emp = Employee('Krek', 4000, 9);

  double total = emp.calculateTotalPayment();

  print('Basic Salary   : RM ${Employee.formatMoney(emp.basicSalary)}');
  print('Overtime Hours : ${emp.overtimeHours}');
  print('Overtime Rate  : RM ${emp.overtimeRate.toStringAsFixed(0)}/hour');
  print(
    'Total Payment = ${emp.basicSalary.toStringAsFixed(0)} + '
    '(${emp.overtimeHours} × ${emp.overtimeRate.toStringAsFixed(0)}) '
    '= RM ${Employee.formatMoney(total)}',
  );
}
