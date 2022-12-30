import 'package:equatable/equatable.dart';
import 'package:movies_app/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessage errorMessage;
  const ServerException({required this.errorMessage});


}
abstract class Failure extends Equatable{

  final String message;
  const Failure(this.message);

  @override
  List<Object> get props =>[message];
}
class ServerFailure extends Failure{
 const ServerFailure(super.message);

}