import 'package:bottom_menu/core/models/texnomart_model.dart';
import 'package:dio/dio.dart';

import '../models/karzinka_model.dart';

class PaginationApi {
  final _dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 60)));

  Future<List<LeBazarData>> news({
    int offset = 0,
    int limit = 10,
    String search = "",
  }) async {
    final response = await _dio.get(
      "https://api.lebazar.uz/api/v1/search/product?start=$offset&limit=$limit&searchKey=$search",
      options: Options(headers: {"companyId": 78}),
    );
    return (response.data["data"]["list"] as List)
        .map((e) => LeBazarData.fromJson(e))
        .toList();
  }
  Future<TexnomartModel> productsByTexnomart({
    String search = "",
    int page = 1,
  }) async {
    final response = await _dio.get(
      "https://backend.texnomart.uz/api/v2/search/search?q=$search&page=$page",
    );
    print(response.data);
    return TexnomartModel.fromJson(response.data["data"]);
  }
}
