import 'package:verzel_project/utils/api.dart';

class OfferRepository {
  
  final ApiHelper _apiHelper = ApiHelper();

  Future<dynamic> getAll() async  {
    dynamic result = await _apiHelper.api.get("/offer");
    return result.data;
  }
}