import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trading_module/cores/networking/decoder.dart';

import 'package:trading_module/cores/states/base_controller.dart';
import 'package:trading_module/domain/entities/stock_transaction_model.dart';


class StockTransactionController extends BaseController
    with StateMixin<Map<DateTime, List<Transaction>>> {
  //final UserRepository _userRepository = UserRepository();
  late RefreshController refreshController;
  int currentPage = 1;
  int lastPage = 99;
  List<Transaction> listData = [];
  bool hasData = false;
  bool forceLoad = false;
  RxInt newTrans = 0.obs;
  RxInt unFinishSaving = 0.obs;
  RxInt unFinishInvest = 0.obs;
  RxInt unFinishTransactionSum = 0.obs;
  List<Transaction> listUnFinishSavingTrans = [];
  List<Transaction> listUnFinishInvestTrans = [];
  List<Transaction> unFinishTransactions = [];

  void onLoading() {
    currentPage += 1;
    loadData();
  }

  void onRefresh() {
    currentPage = 1;
    listData.clear();
    loadData();
  }

  void onReceivePush() {
    currentPage = 1;
    listData.clear();
    getListTransaction();
  }

  Future<void> loadData() async {
    final newFeed = await getListTransaction();
    if (newFeed) {
      refreshController.refreshCompleted();
      refreshController.loadComplete();
    } else {
      refreshController.refreshCompleted();
      refreshController.loadComplete();
      2.delay(() => refreshController.resetNoData());
    }
  }

  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  void loadDataIfNeed({bool? showDialog}) {
    if (!hasData) {
      getListTransaction(showDialog: showDialog ?? false);
    }
  }

  Future<bool> getListTransaction({int? page, bool showDialog = false}) async {
    var newFeed = false;
    if (showDialog && !Get.isDialogOpen!) showProgressingDialog();
    if (currentPage > lastPage) {
      currentPage = lastPage;
      if (showDialog) hideDialog();
      return false;
    }
    return false;
    // final res = await _userRepository.getMyTransactions(page ?? currentPage,
    //     perPage: 100);
    // if (res.success) {
    //   addDataToList(res);
    //   handlerUnFinishDepositTransaction();
    //   newFeed = res.model.isNotEmpty;
    // }
    // if (showDialog) hideDialog();
    // return newFeed;
  }

  void handlerUnFinishDepositTransaction() {
    listUnFinishSavingTrans.clear();
    listUnFinishInvestTrans.clear();
    unFinishTransactions.clear();
    for (final Transaction t in listData) {
      if (t.isUnFinishDeposit) {
        unFinishTransactions.add(t);
      }
    }
    unFinishTransactionSum.value = unFinishTransactions.length;
  }

  void onTappedUnFinishTransaction() {
    // Get.toNamed(Routes.unfinishedTransaction,
    //     arguments: [unFinishTransactions]);
    // EventManager().fire(HomeEvent.onClickUnfinishDeposit());
  }

  void onTapped(Transaction tran) {
    // Get.toNamed(Routes.transactionDetail,
    //     arguments: NavigateTranDetail(tran.transactionId));
  }

  void addDataToList(BaseDecoder<List<Transaction>> res) {
    // final metaData = res.result.data["meta_data"];
    // lastPage = metaData["last_page"] as int;
    // final data = res.model;
    // for (final t in data) {
    //   if (listData.contains(t)) {
    //     continue;
    //   }
    //   listData.add(t);
    // }
    //
    // hasData = listData.isNotEmpty;
    // _formatData();
  }

  void _formatData() {
    // final Map<DateTime, List<Transaction>> formattedData = {};
    // for (final tran in listData) {
    //   final month = tran.createDate!.dateWithoutDay();
    //   if (formattedData.containsKey(month)) {
    //     final listSection = formattedData[month]!;
    //     listSection.add(tran);
    //   } else {
    //     formattedData[month] = [tran];
    //   }
    // }
    // if (formattedData.isEmpty) {
    //   change(formattedData, status: RxStatus.empty());
    // } else {
    //   change(formattedData, status: RxStatus.success());
    // }
  }
}
