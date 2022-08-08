import '../model/response_model.dart';
import '../network/api_client.dart';

class UsersRepo {
  Future<dynamic> getUsersInfo(String url) async {
    var response = await apiClient.getRequest(url);
    // print('response $response');
    if (response is ApiResponseModel) {
      return response;
    } else {
      return response;
    }
  }
}

UsersRepo usersRepo = UsersRepo();
