class TrackedExerciseDbHelper {
  static final _trackedTableName = 'trackedExercises';
  static final id = '_id';
  static final name = '_name';
  static final timestamp = '_timestamp';
  static final setNum = '_setNum';
  static final reps = '_reps';
  static final weight = '_weight';
  static final holdTime = '_holdTime';
  static final band = '_band';
  static final tempo = '_tempo';
  static final tool = '_tool';
  static final rest = '_rest';
  static final cluster = '_cluster';

  static final createTableString = '''       
      CREATE TABLE $_trackedTableName(
      $id INTEGER PRIMARY KEY,
      $name TEXT NOT NULL,
      $timestamp TEXT NOT NULL,
      $setNum INTEGER,
      $reps INTEGER,
      $weight REAL,
      $holdTime INTEGER,
      $band TEXT DEFAULT "" NOT NULL,
      $tempo TEXT DEFAULT "" NOT NULL,
      $tool TEXT DEFAULT "" NOT NULL,
      $rest INTEGER,
      $cluster TEXT DEFAULT "" NOT NULL)      ''';
}
