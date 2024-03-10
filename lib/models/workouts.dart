class Workouts {
  int workoutID;
  String wname;
  int e_id;

  Workouts({
    required this.workoutID,
    required this.wname,
    required this.e_id,
  });

  factory Workouts.fromJson(Map<String, dynamic> json) {
    return Workouts(
      workoutID: json['workoutID'] as int,
      wname: json['wname'] as String,
      e_id: json['e_id'] as int,
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "workoutID":workoutID,
      "wname":wname,
      "e_ids":e_id,
    };
  }
}
