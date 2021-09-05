import 'package:calisthenics_logger_2/core/constants.dart';

class UserEnteredData {
  int reps = UNPOPULATED_INT_VALUE;
  double weight = UNPOPULATED_DOUBLE_VALUE;
  int holdTime = UNPOPULATED_INT_VALUE;
  String band = '';
  String tempo = '';
  String tool = '';
  int rest = UNPOPULATED_INT_VALUE;
  String cluster = '';

  void setReps(num value) {
    reps = value.toInt();
  }

  void setWeight(num value) {
    weight = value.toDouble();
  }
}
