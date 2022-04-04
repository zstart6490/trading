class RealTimeStock {
  String sym;
  double prc;
  double chg;

  RealTimeStock(this.sym, this.prc,this.chg);

  factory RealTimeStock.fromJson(dynamic json) {
    return RealTimeStock(json['sym'] as String, json['prc'] as double, json['chg'] as double);
  }

  @override
  String toString() {
    return '{$sym, $prc, $chg}';
  }
}