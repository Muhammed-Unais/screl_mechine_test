abstract interface class BaseApiService {
  Future<Map<String, dynamic>> getGetApiResponse(
    String endPoint,
  );
}
