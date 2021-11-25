
class Fairings{
  late final bool reused, recoveryAttempt, recovered;

  Fairings({
    required this.reused,
    required this.recoveryAttempt,
    required this.recovered
  });

  Fairings.fromJson(Map<String, dynamic> json) {
    reused = json['reused']??false;
    recoveryAttempt = json['recovery_attempt']??false;
    recovered = json['recovered']??false;
  }
}