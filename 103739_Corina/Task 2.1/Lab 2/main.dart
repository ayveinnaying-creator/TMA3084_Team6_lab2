import 'myLib.dart';

void main() {
  Employee emp = Employee('Corina Rosel Anak John Francis', 5000.0, 7.0);

  double totalPayment = emp.calculateTotalPayment();

  print('Basic Salary: RM ${emp.basicSalary.toStringAsFixed(0)}');
  print('Overtime Hours: ${emp.overtimeHours.toInt()}');
  print('Overtime Rate: RM 10/hour (salary >= RM 4,000)');
  print('Expected Output:');
  print('Total Payment = 5000 + (${emp.overtimeHours.toInt()} × 10) = RM ${totalPayment.toStringAsFixed(0)}');
}