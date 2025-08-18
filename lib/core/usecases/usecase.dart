import 'package:dart_either/dart_either.dart';
import '../errors/failures.dart';

/// Base class for all use cases.
/// [Type] is the return type of the use case.
/// [Params] is the input parameter type.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Represents no parameters (for use cases that don’t need input).
class NoParams {}
