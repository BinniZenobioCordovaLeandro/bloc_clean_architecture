import 'dart:io';

import 'package:clean_architecture/domain/services/abstract_upload_service.dart';

class HttpUploadService extends AbstractUploadService {
  final HttpClient client;

  HttpUploadService({
    required this.client,
  });

  @override
  Future<bool> uploadImage({
    required String imageBase64,
  }) async {
    final HttpClientRequest response = await client.post('url', 80, '/images');
    return response.bufferOutput;
  }
}
