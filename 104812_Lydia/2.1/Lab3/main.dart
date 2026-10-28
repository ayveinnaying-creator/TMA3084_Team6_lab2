
import 'myLib.dart';

void main() {
  Employee employee = Employee(5000, 7);

  double totalPayment = employee.calculateTotalPayment();

  print('Basic Salary: RM ${employee.basicSalary.toStringAsFixed(0)}');
  print('Overtime Hours: ${employee.overtimeHours}');
  print('Overtime Payment: RM ${employee.calculateOvertime().toStringAsFixed(0)}');
  print('Total Payment: RM ${totalPayment.toStringAsFixed(0)}');
}