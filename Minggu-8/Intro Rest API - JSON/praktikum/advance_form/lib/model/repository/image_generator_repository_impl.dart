import 'package:dartz/dartz.dart';
import 'package:advance_form/model/repository/image_generator_repository.dart';
import 'package:advance_form/model/service/api_service.dart';

class ImageGeneratorRepositoryImpl implements ImageGeneratorRepository {
  final String baseUrl = 'https://api.dicebear.com/6.x/pixel-art/svg';

  @override
  Future<Either<String, String>> generateAvatar(String name) async {
    try {
      final Map<String, dynamic> params = {
        "seed": name,
      };
      final response = await ApiService().get(baseUrl, params: params);
      return Right(response.data.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }
}