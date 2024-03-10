class UserToWorkout{
  int userToWorkoutID;
  int exerciesID;
  int workoutID;
  int accountID;

  UserToWorkout({
    required this.userToWorkoutID,
    required this.exerciesID,
    required this.workoutID,
    required this.accountID,
  });

  factory UserToWorkout.fromJson(Map<String, dynamic> json) {
    return UserToWorkout(
      userToWorkoutID: json['userToWorkoutID'] as int,
      exerciesID: json['exerciesID'] as int,
      workoutID: json['workoutID'] as int,
      accountID: json['accountID'] as int,
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "userToWorkoutID":userToWorkoutID,
      "exerciesID":exerciesID,
      "workoutID":workoutID,
      "accountID":accountID,
    };
  }
}