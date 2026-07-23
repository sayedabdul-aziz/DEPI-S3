class Failure {
  final int? code;
  final String? message;

  Failure({this.code, this.message});
}

class ServerFailure extends Failure {
  ServerFailure({super.code, super.message});
}

class CacheFailure extends Failure {
  CacheFailure({super.code, super.message});
}

class NetworkFailure extends Failure {
  NetworkFailure({super.code, super.message});
}

class ParseFailure extends Failure {
  ParseFailure({super.code, super.message});
}
