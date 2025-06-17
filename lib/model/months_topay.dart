class MonthsTopay {
  final String deadligne;
  final numner_of_pay; 
   String?  time_payment;
  bool is_payed = false;
  
  MonthsTopay({
    required this.numner_of_pay,
    required this.deadligne,
    required this.time_payment,
  });
  @override
  String toString() {
    // TODO: implement toString
    return 'the deadligne is $deadligne and the is payed $is_payed  and nu,ber is $numner_of_pay';
  }




}
