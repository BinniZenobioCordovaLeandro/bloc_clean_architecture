abstract class AbstractUploadService {
  Future<bool> uploadImage({
    required String imageBase64,
  });
}
