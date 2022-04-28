class CompanyFinancialInfo {
  String symbol;
  /// doanh thu
  num revenue;
  /// Chi phi hoat dong
  num cost;
  /// thu nhap tinh thue
  num taxIncome;
  /// Loi nhuan sau thue
  num profit;
  /// Tong tai san
  num totalAssets;
  /// Chi phi hoat dong(2)
  num operationCost;
  /// Tiền, vàng gửi và
  /// cho vay các TCTD
  num depositCredit;
  /// Cho vay khách hàng
  num depositClient;
  /// Nợ phải trả
  num debt;
  /// Tiền gửi và vay
  /// các TCTD
  num debtCredit;
  /// Tiền gửi của khách
  /// hàng Vốn và các quỹ
  num debtClient;
  /// Vốn và các quỹ
  num capital;
  /// Vốn của TCTD
  num capitalCredit;
  /// Lợi nhuận chưa
  /// phân phối
  num undistProfit;
  /// Định giá
  num valuation;
  num eps;
  num pe;
  num pb;
  /// Khả năng sinh lời
  num profitability;
  num roe;
  num roa;
  num poic;
  /// Tỷ suất lợi nhuận gộp
  num grossProfitMargin;
  /// Biến LN ròng
  num netProfitVariable;
  /// Sức mạnh tài chính
  num financialStrength;
  /// Tổng nợ/VCSH
  num debtEquity;
  /// Tổng nợ/Tổng TS
  num debtAssets;
  /// Thanh toán nhanh
  num fastPayment;

  CompanyFinancialInfo(
      {required this.symbol,
      required this.revenue,
      required this.cost,
      required this.taxIncome,
      required this.profit,
      required this.totalAssets,
      required this.operationCost,
      required this.depositCredit,
      required this.depositClient,
      required this.debt,
      required this.debtCredit,
      required this.debtClient,
      required this.capital,
      required this.capitalCredit,
      required this.undistProfit,
      required this.valuation,
      required this.eps,
      required this.pe,
      required this.pb,
      required this.profitability,
      required this.roe,
      required this.roa,
      required this.poic,
      required this.grossProfitMargin,
      required this.netProfitVariable,
      required this.financialStrength,
      required this.debtEquity,
      required this.debtAssets,
      required this.fastPayment});


}
