class WExercises {
  int exerciesID;
  String ename;
  int sets;
  int repetitions;

  WExercises({
    required this.exerciesID,
    required this.ename,
    required this.sets,
    required this.repetitions,
  });

  factory WExercises.fromJson(Map<String, dynamic> json) {
    return WExercises(
      exerciesID: json['exerciesID'] as int,
      ename: json['ename'] as String,
      sets: json['sets'] as int,
      repetitions: json['repetitions'] as int,
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "exerciesID":exerciesID,
      "ename":ename,
      "sets":sets,
      "repetitions":repetitions,
    };
  }
}
