import 'package:intl/intl.dart';
import 'package:trading_module/configs/constants.dart';
import 'package:trading_module/cores/api_services.dart';
import 'package:trading_module/cores/networking/http_response.dart';
import 'package:trading_module/data/entities/OTPData.dart';
import 'package:trading_module/data/entities/otp_generate_model_dto.dart';


abstract class OtpService extends ApiServices {
  OtpService() : super();

  Future<HttpResponseCustom<OtpData>> enableSmartOTP(
      String? smsOTP);

  Future<HttpResponseCustom<OtpGenerateModelDTO>> generateOTP(
      String pin);

  Future<HttpResponseCustom<OtpGenerateModelDTO>> checkPin(
      String pin);

}

class OtpServiceImpl extends OtpService {
  OtpServiceImpl() : super();

  @override
  Future<HttpResponseCustom<OtpData>> enableSmartOTP(
      String? smsOTP) async {
    final response = await api.getData(
        endPoint: "smart-otp/enable",
        params: {
          'otp': smsOTP,
        },
        timeOut: AppConstants.TIME_OUT);
    final data = OtpData.fromJson(response.data as Map<String, dynamic>);
    return HttpResponseCustom(data, response);
  }

  @override
  Future<HttpResponseCustom<OtpGenerateModelDTO>> generateOTP(String pin) async {
    final response = await api.postData(
        endPoint: "v1/on-boarding/get-otp",
        params: {
          'pin': pin,
          'token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJiaXJ0aGRheSI6IjIwMjIvMDIvMjMiLCJwaG9uZU51bWJlciI6IjA5NzM1OTE3MjgiLCJhZGRyZXNzIjoiVGF5IEhhIFRvd2VyLCAxOCBUbyBIdXUsIE5hbSBUdSBMaWVtLCBIYSBOb2ksIFZpZXQgTmFtZSIsImdlbmRlciI6IjAiLCJuYW1lIjoiMDk3MzU5MTcyOCIsImlkIjoxMjEsImV4cCI6MTY0NjI5NjcyNCwidXVpZCI6ImM3M2ViMDllLTQ2Y2ItNDUxNC05YmExLTljOGZhMTJmMjVkOSIsImVtYWlsIjoidHJhZGluZ0B0ZWNobGFiLmFpIn0.50HWCUU-GYlj-UUUJ7No0dy8HH_6ftP1ibJhvLfVptN15rbCNkqJEnKasPXgLGCKtCcRXyKSk0rnr2xHCJ5-eeO3UbU5LXJZuqmrrL2R0O6Xm6NCSc2NFeiNR94cTU3VjKOpBHxXuyL8vqe3Fst8aknvGY8qsJNcuGZ450khwGl9xHtlpaVyPafssvXU6ClaJSQP9OoGlT9PZJ_f2eJ4meUT27UU289t9n48t117od_fBGdiJ-1vdOIFCoOhL2E4BB8H8OPsY8lnkGZDvxNT6rPBRC0DAiMGhwu4o6G5scJfNDeETjssZ4-_CtqyzaHlD4cFTQeHTwm72idqYPvx4DOxQ-IEhlNFhpKcW-Qzh7fLLnl5beIU5JVBM7-Llb2GRaTqbKQiFqrFT45YEQnefTFzI5fkogc3RTVZtMIrVij7AahJ18RD_XSiHxD-LrZizveXVFmGibqlcmyqferVYgBGKFaAGlCLTuzka2Mh6Yx9uXfMU7YIo4I_WrZ-4b3FXo9TSfJV4E_SKXDcMkrBXDFghBovmPAJGHthRN1eDEI0XI49psW_8Dx_1AxAXXCxg8rNL0mLU8CM_R7i7Fz_C-Mnz-nXZheT_93G5ZOtBuXcnQv0L2vzq2k0WECMONtUd1emvefWAE9MF1RCJy9KQvWrMpPe7q_Wh8eaO_hig_w',
        },
        timeOut: AppConstants.TIME_OUT);
    final data = OtpGenerateModelDTO.fromJson(response.data as Map<String, dynamic>);
    return HttpResponseCustom(data, response);
  }

  @override
  Future<HttpResponseCustom<OtpGenerateModelDTO>> checkPin(String pin) async {
    final response = await api.postData(
        endPoint: "v1/on-boarding/check-pin",
        params: {
          'pin': pin,
          'token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJiaXJ0aGRheSI6IjIwMjIvMDIvMjMiLCJwaG9uZU51bWJlciI6IjA5NzM1OTE3MjgiLCJhZGRyZXNzIjoiVGF5IEhhIFRvd2VyLCAxOCBUbyBIdXUsIE5hbSBUdSBMaWVtLCBIYSBOb2ksIFZpZXQgTmFtZSIsImdlbmRlciI6IjAiLCJuYW1lIjoiMDk3MzU5MTcyOCIsImlkIjoxMjEsImV4cCI6MTY0NjI5NjcyNCwidXVpZCI6ImM3M2ViMDllLTQ2Y2ItNDUxNC05YmExLTljOGZhMTJmMjVkOSIsImVtYWlsIjoidHJhZGluZ0B0ZWNobGFiLmFpIn0.50HWCUU-GYlj-UUUJ7No0dy8HH_6ftP1ibJhvLfVptN15rbCNkqJEnKasPXgLGCKtCcRXyKSk0rnr2xHCJ5-eeO3UbU5LXJZuqmrrL2R0O6Xm6NCSc2NFeiNR94cTU3VjKOpBHxXuyL8vqe3Fst8aknvGY8qsJNcuGZ450khwGl9xHtlpaVyPafssvXU6ClaJSQP9OoGlT9PZJ_f2eJ4meUT27UU289t9n48t117od_fBGdiJ-1vdOIFCoOhL2E4BB8H8OPsY8lnkGZDvxNT6rPBRC0DAiMGhwu4o6G5scJfNDeETjssZ4-_CtqyzaHlD4cFTQeHTwm72idqYPvx4DOxQ-IEhlNFhpKcW-Qzh7fLLnl5beIU5JVBM7-Llb2GRaTqbKQiFqrFT45YEQnefTFzI5fkogc3RTVZtMIrVij7AahJ18RD_XSiHxD-LrZizveXVFmGibqlcmyqferVYgBGKFaAGlCLTuzka2Mh6Yx9uXfMU7YIo4I_WrZ-4b3FXo9TSfJV4E_SKXDcMkrBXDFghBovmPAJGHthRN1eDEI0XI49psW_8Dx_1AxAXXCxg8rNL0mLU8CM_R7i7Fz_C-Mnz-nXZheT_93G5ZOtBuXcnQv0L2vzq2k0WECMONtUd1emvefWAE9MF1RCJy9KQvWrMpPe7q_Wh8eaO_hig_w',
        },
        timeOut: AppConstants.TIME_OUT);
    final data = OtpGenerateModelDTO.fromJson(response.data as Map<String, dynamic>);
    return HttpResponseCustom(data, response);
  }

}
