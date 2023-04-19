import 'package:marvel/utils/exception/exceptions.dart';

class ExceptionHandler {
  static Exception handle(int? statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
        return BadRequestException(response?.status ?? 'Bad request');
      case 401:
        return UnauthorizedException(response?.status ?? 'Unauthorized');
      case 403:
        return ForbiddenException(response?.status ?? 'Forbidden');
      case 404:
        return NotFoundException(response?.status ?? 'Not found');
      case 409:
        return BusinessException(response?.status ?? 'Business Exception');
      case 500:
        return InternalServerErrorException(response?.status ?? 'Internal server error');
      case 503:
        return ServiceUnavailableException(response?.status ?? 'Service unavailable');
      default:
        return NonHandledException('Request failed with status: $statusCode');
    }
  }
}
