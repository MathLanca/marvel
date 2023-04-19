class NoEnvValuesException implements Exception {
  String message;
 
  NoEnvValuesException(this.message);

  @override
  String toString() => 'NoEnvValuesException: $message';
}

class BadRequestException implements Exception {
  final String message;

  const BadRequestException(this.message);

  @override
  String toString() => 'BadRequestException: $message';
}

class UnauthorizedException implements Exception {
  final String message;

  const UnauthorizedException(this.message);

  @override
  String toString() => 'UnauthorizedException: $message';
}

class ForbiddenException implements Exception {
  final String message;

  const ForbiddenException(this.message);

  @override
  String toString() => 'ForbiddenException: $message';
}

class NotFoundException implements Exception {
  final String message;

  const NotFoundException(this.message);

  @override
  String toString() => 'NotFoundException: $message';
}

class InternalServerErrorException implements Exception {
  final String message;

  const InternalServerErrorException(this.message);

  @override
  String toString() => 'InternalServerErrorException: $message';
}

class ServiceUnavailableException implements Exception {
  final String message;

  const ServiceUnavailableException(this.message);

  @override
  String toString() => 'ServiceUnavailableException: $message';
}

class NonHandledException implements Exception {
  final String message;

  const NonHandledException(this.message);

  @override
  String toString() => 'NonHandledException: $message';
}

class BusinessException implements Exception {
  final String message;

  const BusinessException(this.message);

  @override
  String toString() => 'BusinessException: $message';
}