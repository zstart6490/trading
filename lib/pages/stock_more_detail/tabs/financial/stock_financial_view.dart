import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_module/pages/stock_detail/Views/cell_finance_info.dart';
import 'package:trading_module/pages/stock_detail/Views/cell_header_finance_info.dart';
import 'package:trading_module/pages/stock_more_detail/tabs/financial/stock_company_info_controller.dart';
import 'package:trading_module/shared_widgets/ListNoDataBackground.dart';
import 'package:trading_module/utils/extensions.dart';

class StockFinancialView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StockCompanyInfoController controller = Get.find();
    return controller.obx(
      (infoList) {
        return Column(children: [
          const CellHeaderFinanceInfo(
              title: "Kết quả kinh doanh",
              contentRow1: "2020",
              contentRow2: "2021"),
          CellFinanceInfo(
              title: "Doanh thu",
              contentRow1: infoList![0].revenue.toCurrency(symbol: ""),
              contentRow2: infoList[1].revenue.toCurrency(symbol: "")),
          CellFinanceInfo(
              title: "Chi phí hoạt động",
              contentRow1: infoList[0].operationCost.toCurrency(symbol: ""),
              contentRow2: infoList[1].operationCost.toCurrency(symbol: "")),
          CellFinanceInfo(
              title: "Tổng TNTT",
              contentRow1: infoList[0].taxIncome.toCurrency(symbol: ""),
              contentRow2: infoList[1].taxIncome.toCurrency(symbol: "")),
          CellFinanceInfo(
              title: "Tổng LNST",
              contentRow1: infoList[0].profit.toCurrency(symbol: ""),
              contentRow2: infoList[1].profit.toCurrency(symbol: "")),
          const CellHeaderFinanceInfo(
              title: "Cân đối kế toán",
              contentRow1: "2020",
              contentRow2: "2021"),
          CellFinanceInfo(
              title: "Tổng tài sản",
              contentRow1: infoList[0].totalAssets.toCurrency(symbol: ""),
              contentRow2: infoList[1].totalAssets.toCurrency(symbol: ""),
              fontWeight: FontWeight.w700),
          Container(
            padding: const EdgeInsets.only(left: 14),
            child: Column(children: [
              CellFinanceInfo(
                title: "Chi phí hoạt động",
                contentRow1: infoList[0].operationCost.toCurrency(symbol: ""),
                contentRow2: infoList[1].operationCost.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              ),
              CellFinanceInfo(
                title: "Tiền, vàng gửi và cho vay các TCTD",
                contentRow1: infoList[0].depositCredit.toCurrency(symbol: ""),
                contentRow2: infoList[1].depositCredit.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              ),
              CellFinanceInfo(
                title: "Cho vay khách hàng",
                contentRow1: infoList[0].depositClient.toCurrency(symbol: ""),
                contentRow2: infoList[1].depositClient.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              )
            ]),
          ),
          CellFinanceInfo(
              title: "Nợ phải trả",
              contentRow1: infoList[0].debt.toCurrency(symbol: ""),
              contentRow2: infoList[1].debt.toCurrency(symbol: ""),
              fontWeight: FontWeight.w700),
          Container(
            padding: const EdgeInsets.only(left: 14),
            child: Column(children: [
              CellFinanceInfo(
                title: "Tiền gửi và vay các TCTD",
                contentRow1: infoList[0].debtCredit.toCurrency(symbol: ""),
                contentRow2: infoList[1].debtCredit.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              ),
              CellFinanceInfo(
                title: "Tiền gửi của khách hàng Vốn và các quỹ",
                contentRow1: infoList[0].debtClient.toCurrency(symbol: ""),
                contentRow2: infoList[1].debtClient.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              ),
            ]),
          ),
          CellFinanceInfo(
            title: "Vốn và các quỹ",
            contentRow1: infoList[0].capital.toCurrency(symbol: ""),
            contentRow2: infoList[1].capital.toCurrency(symbol: ""),
            fontWeight: FontWeight.w700,
          ),
          Container(
            padding: const EdgeInsets.only(left: 14),
            child: Column(children: [
              CellFinanceInfo(
                title: "Vốn của TCTD",
                contentRow1: infoList[0].capitalCredit.toCurrency(symbol: ""),
                contentRow2: infoList[1].capitalCredit.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              ),
              CellFinanceInfo(
                title: "Lợi nhuận chưa phân phối",
                contentRow1: infoList[0].undistProfit.toCurrency(symbol: ""),
                contentRow2: infoList[1].undistProfit.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              ),
            ]),
          ),
          const CellHeaderFinanceInfo(
              title: "Chỉ số tài chính",
              contentRow1: "2020",
              contentRow2: "2021"),
          CellFinanceInfo(
            title: "Định giá",
            contentRow1: infoList[0].valuation.toCurrency(symbol: ""),
            contentRow2: infoList[1].valuation.toCurrency(symbol: ""),
            fontWeight: FontWeight.w700,
          ),
          Container(
            padding: const EdgeInsets.only(left: 14),
            child: Column(children: [
              CellFinanceInfo(
                title: "EPS",
                contentRow1: infoList[0].eps.toCurrency(symbol: ""),
                contentRow2: infoList[1].eps.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              ),
              CellFinanceInfo(
                title: "PE",
                contentRow1: infoList[0].pe.toCurrency(symbol: ""),
                contentRow2: infoList[1].pe.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              ),
              CellFinanceInfo(
                title: "PB",
                contentRow1: infoList[0].pe.toCurrency(symbol: ""),
                contentRow2: infoList[1].revenue.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              )
            ]),
          ),
          CellFinanceInfo(
            title: "Khả năng sinh lời",
            contentRow1: infoList[0].profitability.toCurrency(symbol: ""),
            contentRow2: infoList[1].profitability.toCurrency(symbol: ""),
            fontWeight: FontWeight.w700,
          ),
          Container(
            padding: const EdgeInsets.only(left: 14),
            child: Column(children: [
              CellFinanceInfo(
                title: "ROE",
                contentRow1: infoList[0].roe.toCurrency(symbol: ""),
                contentRow2: infoList[1].roe.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              ),
              CellFinanceInfo(
                title: "ROA",
                contentRow1: infoList[0].roa.toCurrency(symbol: ""),
                contentRow2: infoList[1].roa.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              ),
              CellFinanceInfo(
                title: "POIC",
                contentRow1: infoList[0].poic.toCurrency(symbol: ""),
                contentRow2: infoList[1].poic.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              ),
              CellFinanceInfo(
                title: "Tỷ suất lợi nhuận gộp",
                contentRow1:
                    infoList[0].grossProfitMargin.toCurrency(symbol: ""),
                contentRow2:
                    infoList[1].grossProfitMargin.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              ),
              CellFinanceInfo(
                title: "Biến LN ròng",
                contentRow1:
                    infoList[0].netProfitVariable.toCurrency(symbol: ""),
                contentRow2:
                    infoList[1].netProfitVariable.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              )
            ]),
          ),
          CellFinanceInfo(
            title: "Sức mạnh tài chính",
            contentRow1: infoList[0].financialStrength.toCurrency(symbol: ""),
            contentRow2: infoList[1].financialStrength.toCurrency(symbol: ""),
            fontWeight: FontWeight.w700,
          ),
          Container(
            padding: const EdgeInsets.only(left: 14),
            child: Column(children: [
              CellFinanceInfo(
                title: "Tổng nợ/VCSH",
                contentRow1: infoList[0].debtEquity.toCurrency(symbol: ""),
                contentRow2: infoList[1].debtEquity.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              ),
              CellFinanceInfo(
                title: "Tổng nợ/Tổng TS",
                contentRow1: infoList[0].debtAssets.toCurrency(symbol: ""),
                contentRow2: infoList[1].debtAssets.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              ),
              CellFinanceInfo(
                title: "Thanh toán nhanh",
                contentRow1: infoList[0].fastPayment.toCurrency(symbol: ""),
                contentRow2: infoList[1].fastPayment.toCurrency(symbol: ""),
                textColor: context.disabledColor,
              )
            ]),
          )
        ]);
      },
      onLoading: const Padding(
        padding: EdgeInsets.only(top: 120),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      onEmpty:  const ListNoDataBackground(
        padding: EdgeInsets.only(top: 100),
        pngPath: "assets/images/png/trans_empty.png",
        title: "Chưa có dữ liệu ",
        desc: "",
      ),
      onError: (error) =>  ListNoDataBackground(
        padding: const EdgeInsets.only(top: 100),
        pngPath: "assets/images/png/trans_empty.png",
        title: "Có lỗi xảy ra",
        desc: error??"",
      ),
    );
  }
}
