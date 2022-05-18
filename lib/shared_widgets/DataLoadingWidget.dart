import 'package:flutter/material.dart';
import 'package:trading_module/shared_widgets/CustomErrorWidget.dart';
import 'package:trading_module/shared_widgets/CustomLoadingWidget.dart';
enum LoadingStatus {
  loading,
  error,
  success
}
class DataLoadingWidget extends StatefulWidget {
  late LoadingStatus _status;
  DataLoadingWidget(LoadingStatus status){
    this._status = status;
  }
  @override
  State<DataLoadingWidget> createState() => _DataLoadingWidgetState();
}
class _DataLoadingWidgetState extends State<DataLoadingWidget>{

  Widget _widgetStatus(LoadingStatus status) {
    switch (status) {
      case LoadingStatus.loading:
        return CustomLoadingWidget();
      case LoadingStatus.error:
        return CustomErrorWidget();
      case LoadingStatus.success:
        return const SizedBox();
    }
  }
  @override
  Widget build(BuildContext context) {
    return _widgetStatus(widget._status);
  }
}
