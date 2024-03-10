class AllExercise {
  int allExerciseID;
  String exercise_name;
  String exercise_category;
  String exercise_bodypart;

  AllExercise({
    required this.allExerciseID,
    required this.exercise_name,
    required this.exercise_category,
    required this.exercise_bodypart,
  });

  factory AllExercise.fromJson(Map<String, dynamic> json) {
    return AllExercise(
        allExerciseID: json['allExerciseID'] as int,
        exercise_name: json['exercise_name'] as String,
        exercise_category: json['exercise_category'] as String,
        exercise_bodypart: json['exercise_bodypart'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "allExerciseID": allExerciseID,
      "exercise_name": exercise_name,
      "exercise_category": exercise_category,
      "exercise_bodypart": exercise_bodypart,
    };
  }
}
