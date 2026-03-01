import 'package:hive_ce/hive_ce.dart';
import 'package:taskati/core/models/task_model.dart';

@GenerateAdapters([AdapterSpec<TaskModel>()])
part 'hive_adapters.g.dart';
