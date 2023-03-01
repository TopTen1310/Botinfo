// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:Botinfo/constants.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart' as getRes;

class DioResponse {
  static Future<Map<String, dynamic>> getApi(
    String api, {
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
    Map<String, String> headers = const {},
    Map<String, dynamic> requestData = const {},
  }) async {
    print(api);
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] =
        'Bearer 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';
    print(Constant.token);

    // ProgressDialogUtils.showProgressDialog();

    try {
      final response = await dio.get(api);

      // ProgressDialogUtils.hideProgressDialog();

      // log('RESPONSE $api ==>> $response');
      // if (response.statusCode == 200) {
      print("000++888888+${response.statusCode}");
      return response.data;
      // } else {
      //   return {
      //     "statusCode": response.statusCode,
      //   };
      // }
    } on DioError catch (error) {
      print(api);
      print('Hello ${error.response!}');
      print('Hello ${error.error}');

      if (error.response!.statusCode == 401) {
        // getRes.Get.offAll(() => const Login_Screen());

        Constant.token = '';
      }

      return error.response!.data;
    }
  }

  static Future<Response<dynamic>?> postApi(
    String api,
    Map<dynamic, dynamic> data,
  ) async {
    print(api);
    print("data");
    print(data);
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    // if (Constant.token != "") {
    dio.options.headers['Authorization'] =
        'Bearer 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';
    // }

    try {
      print(api);
      // try {
      final response = await dio.post(api, data: data);

      print(response);
      return response;
    } on DioError catch (error) {
      print(error.message);
      print(api);
      print(data);
      print('Hello ${error.response}');

      if (error.response?.statusCode == 401) {
        // getRes.Get.offAll(() => const Login_Screen());

      }

      return error?.response;
    }
  }

  static Future<Response<dynamic>> postApiFormData(
    String api,
    FormData formData,
  ) async {
    print(api);
    print("data");
    Dio dio = Dio();
    dio.options.headers["Content-Type"] = "multipart/form-data";
    dio.options.headers["Connection"] = "Keep-Alive";
    dio.options.headers['Authorization'] =
        'Bearer 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';
    print("token");
    print(Constant.token);

    // try {
    print(api);
    // try {

    final response = await dio.post(api, data: formData);

    print(response);
    return response;
    /* } on DioError catch (error) {
      print(api);
      print('Hello ${error.response}');

      if (error.response!.statusCode == 401) {
        getRes.Get.offAll(() => const Login_Screen());

        Constant.token = '';
      }

      return error.response!;
    } */
  }

  static Future<Response<dynamic>> postApiforuploadingimg(
    String api,
    FormData data,
  ) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] =
        'Bearer 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';
    final response = await dio.post(
      api,
      data: data,
    );
    return response;
  }

  static Future<Response<dynamic>> deleteApi(
    String api,
    Map<dynamic, dynamic> data,
  ) async {
    print(api);
    print("data");
    print(data);
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] =
        'Bearer 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';
    print("token");
    print(Constant.token);
    print(api);
    // try {
    final response = await dio.delete(api, data: data);
    print(response);
    return response;
  }
}

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message = _handleError(
            dioError.response!.statusCode!, dioError.response!.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  static Future<Response<dynamic>?> putApi(
      String api,
      // Map<dynamic, dynamic> data,
      dynamic data) async {
    print(api);
    Dio dio = new Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] =
        'Bearer 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';
    try {
      final response = await dio.put(api, data: data);
      return response;
    } on DioError catch (error) {
      print(api);
      print(data);
      print('Hello ${error.response}');

      if (error.response!.statusCode == 401) {
        // getRes.Get.offAll(() => const Login_Screen());

        Constant.token = '';
      }

      return error.response;
    }
  }

  static Future<Response<dynamic>?> deleteApi(String api) async {
    print(api);
    Dio dio = new Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';

    dio.options.headers['Authorization'] =
        'Bearer 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';

    try {
      final response = await dio.delete(api);
      return response;
    } on DioError catch (error) {
      print(api);

      print('Hello ${error.response}');

      if (error.response!.statusCode == 401) {
        // getRes.Get.offAll(() => const Login_Screen());

        Constant.token = '';
      }

      return error.response;
    }
  }

  String? message;

  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return error["message"];
      case 500:
        return 'Internal server error';
      case 422:
        return 'Invalid OTP';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message!;
}

// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:note/core/constants/constants.dart';

// class DioResponse {
//   static Future<Map<String, dynamic>> getApi(String api) async {
//     Dio dio = new Dio();
//     dio.options.headers['Content-Type'] = 'application/json';
//     dio.options.headers['Accept'] = 'application/json';
//     if (Constant.token != "")
//       dio.options.headers["Authorization"] = 'Bearer ' + Constant.token;
//     print('object');
//     print(Constant.token);
//     try {
//       print(api);
//       log(Constant.token);
//       final response = await dio.get(api);
//       // if (response.statusCode == 200) {
//       return response.data;
//       // } else {
//       //   return {
//       //     "statusCode": response.statusCode,
//       //   };
//       // }
//     } on DioError catch (error) {
//       print(api);
//       print('Hello ${error.response}');
//       print('Hello ${error.error}');

//       if (error.response != null && error.response!.statusCode == 401) {
//         // if (getRes.Get.currentRoute != Routes.registerScreenDesign) {
//         //   getRes.Get.offAllNamed(Routes.registerScreenDesign);
//         //
//         //   Constant.token = '';
//         //   Constant.userID = '';
//         //   Constant.itemregister = '';
//         //   Constant.religionId = '';
//         //   await SharedPreference.removeValues(SharedPreference.loginData);
//         //   await SharedPreference.removeValues(SharedPreference.endtime);
//         //   await SharedPreference.removeValues(
//         //       SharedPreference.complete_registration);
//         //   await SharedPreference.removeValues(SharedPreference.user_id);
//         //   await SharedPreference.removeValues(SharedPreference.token);
//         //   await SharedPreference.removeValues(SharedPreference.country);
//         // }
//       }

//       return error.response?.data;
//     }
//   }

//   static Future<Response<dynamic>?> postApi(
//       String api,
//       // Map<dynamic, dynamic> data,
//       dynamic data) async {
//     Dio dio = new Dio();
//     dio.options.headers['Content-Type'] = 'application/json';
//     dio.options.headers['Accept'] = 'application/json';
//     if (Constant.token != "")
//       dio.options.headers['Authorization'] = 'Bearer ' + Constant.token;
//     print('object');
//     print(Constant.token);
//     try {
//       print(api);
//       if (Constant.token != "") log(Constant.token);
//       // try {
//       final response = await dio.post(api, data: data);
//       print(response);
//       print(data);

//       return response;
//     } on DioError catch (error) {
//       print(api);
//       print(data);
//       print('Hello Post ${error.response}');

//       if (error.response != null && error.response!.statusCode == 401) {
//         // if (getRes.Get.currentRoute != Routes.registerScreenDesign) {
//         //   getRes.Get.offAllNamed(Routes.registerScreenDesign);
//         //
//         //   Constant.token = '';
//         //   Constant.userID = '';
//         //   Constant.itemregister = '';
//         //   Constant.religionId = '';
//         //   await SharedPreference.removeValues(SharedPreference.loginData);
//         //   await SharedPreference.removeValues(SharedPreference.endtime);
//         //   await SharedPreference.removeValues(
//         //       SharedPreference.complete_registration);
//         //   await SharedPreference.removeValues(SharedPreference.user_id);
//         //   await SharedPreference.removeValues(SharedPreference.token);
//         //   await SharedPreference.removeValues(SharedPreference.country);
//         // }
//       }

//       return error.response;
//     }
//   }

//   static Future<Response<dynamic>?> putApi(
//       String api,
//       // Map<dynamic, dynamic> data,
//       dynamic data) async {
//     print(api);
//     Dio dio = new Dio();
//     dio.options.headers['Content-Type'] = 'application/json';
//     dio.options.headers['Accept'] = 'application/json';
//     if (Constant.token != "")
//       dio.options.headers['Authorization'] = 'Bearer ' + Constant.token;

//     try {
//       final response = await dio.put(api, data: data);
//       return response;
//     } on DioError catch (error) {
//       print(api);
//       print(data);
//       print('Hello ${error.response}');

//       if (error.response != null && error.response!.statusCode == 401) {
//         // if (getRes.Get.currentRoute != Routes.registerScreenDesign) {
//         //   getRes.Get.offAllNamed(Routes.registerScreenDesign);
//         //
//         //   Constant.token = '';
//         //   Constant.userID = '';
//         //   Constant.itemregister = '';
//         //   Constant.religionId = '';
//         //   await SharedPreference.removeValues(SharedPreference.loginData);
//         //   await SharedPreference.removeValues(SharedPreference.endtime);
//         //   await SharedPreference.removeValues(
//         //       SharedPreference.complete_registration);
//         //   await SharedPreference.removeValues(SharedPreference.user_id);
//         //   await SharedPreference.removeValues(SharedPreference.token);
//         //   await SharedPreference.removeValues(SharedPreference.country);
//         // }
//       }

//       return error.response;
//     }
//   }

//   static Future<Response<dynamic>?> deleteApi(String api) async {
//     print(api);
//     Dio dio = new Dio();
//     dio.options.headers['Content-Type'] = 'application/json';
//     dio.options.headers['Accept'] = 'application/json';
//     if (Constant.token != "")
//       dio.options.headers['Authorization'] = 'Bearer ' + Constant.token;

//     try {
//       final response = await dio.delete(api);
//       return response;
//     } on DioError catch (error) {
//       print(api);

//       print('Hello ${error.response}');

//       if (error.response != null && error.response!.statusCode == 401) {
//         // if (getRes.Get.currentRoute != Routes.registerScreenDesign) {
//         //   getRes.Get.offAllNamed(Routes.registerScreenDesign);
//         //
//         //   Constant.token = '';
//         //   Constant.userID = '';
//         //   Constant.itemregister = '';
//         //   Constant.religionId = '';
//         //   await SharedPreference.removeValues(SharedPreference.loginData);
//         //   await SharedPreference.removeValues(SharedPreference.endtime);
//         //   await SharedPreference.removeValues(
//         //       SharedPreference.complete_registration);
//         //   await SharedPreference.removeValues(SharedPreference.user_id);
//         //   await SharedPreference.removeValues(SharedPreference.token);
//         //   await SharedPreference.removeValues(SharedPreference.country);
//         // }
//       }

//       return error.response;
//     }
//   }

//   static Future<Response<dynamic>> postApiforuploadingimg(
//     String api,
//     FormData data,
//   ) async {
//     print(api);
//     Dio dio = new Dio();
//     dio.options.headers['Content-Type'] = 'application/json';
//     dio.options.headers['Accept'] = 'application/json';
//     if (Constant.token != "")
//       dio.options.headers['Authorization'] = 'Bearer ' + Constant.token;
//     final response = await dio.post(
//       api,
//       data: data,
//     );
//     return response;
//   }
// }

// // class DioExceptions implements Exception {
// //   DioExceptions.fromDioError(DioError dioError) {
// //     switch (dioError.type) {
// //       case DioErrorType.cancel:
// //         message = "Request to API server was cancelled";
// //         break;
// //       case DioErrorType.connectTimeout:
// //         message = "Connection timeout with API server";
// //         break;
// //       case DioErrorType.other:
// //         message = "Connection to API server failed due to internet connection";
// //         break;
// //       case DioErrorType.receiveTimeout:
// //         message = "Receive timeout in connection with API server";
// //         break;
// //       case DioErrorType.response:
// //         message =
// //             _handleError(dioError.response!.statusCode!, dioError.response!.data);
// //         break;
// //       case DioErrorType.sendTimeout:
// //         message = "Send timeout in connection with API server";
// //         break;
// //       default:
// //         message = "Something went wrong";
// //         break;
// //     }
// //   }
// //
// //   String message;
// //
// //   String _handleError(int statusCode, dynamic error) {
// //     switch (statusCode) {
// //       case 400:
// //         return 'Bad request';
// //       case 404:
// //         return error["message"];
// //       case 500:
// //         return 'Internal server error';
// //       case 422:
// //         return 'Invalid OTP';
// //       default:
// //         return 'Oops something went wrong';
// //     }
// //   }
// //
// //   @override
// //   String toString() => message;
// // }
