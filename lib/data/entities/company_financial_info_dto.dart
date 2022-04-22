import 'package:json_annotation/json_annotation.dart';
import 'package:trading_module/domain/entities/company_financial_info.dart';

part 'company_financial_info_dto.g.dart';

@JsonSerializable()
class CompanyFinancialInfoDto {
  String? symbol;
  int? revenue;
  int? cost;
  int? taxIncome;
  int? profit;
  int? totalAssets;
  int? operationCost;
  int? depositCredit;
  int? depositClient;
  int? debt;
  int? debtCredit;
  int? debtClient;
  int? capital;
  int? capitalCredit;
  int? undistProfit;
  int? valuation;
  int? eps;
  int? pe;
  int? profitability;
  int? roe;
  int? roa;
  int? poic;
  int? grossProfitMargin;
  int? netProfitVariable;
  int? financialStrength;
  int? debtEquity;
  int? debtAssets;
  int? fastPayment;

  CompanyFinancialInfoDto(
      {this.symbol,
      this.revenue,
      this.cost,
      this.taxIncome,
      this.profit,
      this.totalAssets,
      this.operationCost,
      this.depositCredit,
      this.depositClient,
      this.debt,
      this.debtCredit,
      this.debtClient,
      this.capital,
      this.capitalCredit,
      this.undistProfit,
      this.valuation,
      this.eps,
      this.pe,
      this.profitability,
      this.roe,
      this.roa,
      this.poic,
      this.grossProfitMargin,
      this.netProfitVariable,
      this.financialStrength,
      this.debtEquity,
      this.debtAssets,
      this.fastPayment});

  factory CompanyFinancialInfoDto.fromJson(dynamic json) =>
      _$CompanyFinancialInfoDtoFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$CompanyFinancialInfoDtoToJson(this);
}

extension CompanyFinancialInfoMapper on CompanyFinancialInfoDto {
  CompanyFinancialInfo toModel() {
    return CompanyFinancialInfo(
        symbol: symbol ?? "",
        revenue: revenue ?? 0,
        cost: cost ?? 0,
        taxIncome: taxIncome ?? 0,
        profit: profit ?? 0,
        totalAssets: totalAssets ?? 0,
        operationCost: operationCost ?? 0,
        depositCredit: depositCredit ?? 0,
        depositClient: depositClient ?? 0,
        debt: debt ?? 0,
        debtCredit: debtCredit ?? 0,
        debtClient: debtClient ?? 0,
        capital: capital ?? 0,
        capitalCredit: capitalCredit ?? 0,
        undistProfit: undistProfit ?? 0,
        valuation: valuation ?? 0,
        eps: eps ?? 0,
        pe: pe ?? 0,
        profitability: profitability ?? 0,
        roe: roe ?? 0,
        roa: roa ?? 0,
        poic: poic ?? 0,
        grossProfitMargin: grossProfitMargin ?? 0,
        netProfitVariable: netProfitVariable ?? 0,
        financialStrength: financialStrength ?? 0,
        debtEquity: debtEquity ?? 0,
        debtAssets: debtAssets ?? 0,
        fastPayment: fastPayment ?? 0);
  }
}
