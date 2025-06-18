class MonthsTopay {
  final String deadligne;
  final numner_of_pay;
  String? time_payment;
  bool is_payed = false;
  int id_customer;
  MonthsTopay({
    required this.id_customer,
    required this.numner_of_pay,
    required this.deadligne,
    required this.time_payment,
    
  });
  @override
  String toString() {
    // TODO: implement toString
    return 'the deadligne is $deadligne and the is payed $is_payed  and nu,ber is $numner_of_pay and id customer ids $id_customer';
  }

  Map<String, dynamic> toMap() {
    return {
      'customer_id' :id_customer,
      'deadligne': deadligne,
      'numner_of_pay': numner_of_pay,
      'time_payment': time_payment,
      'is_payed': is_payed,
    };
  }

  factory MonthsTopay.fromMap(Map<String, dynamic> map) {
    final instance = MonthsTopay(
      id_customer: map['customer_id'] as int,
      deadligne: map['deadligne'] as String,
      numner_of_pay: map['numner_of_pay'] as int,
      time_payment: map['time_payment'] as String?,
     
    );
   
    return instance;
  }
}
