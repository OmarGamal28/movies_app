import 'package:equatable/equatable.dart';

class ErrorMessage extends Equatable{
  final String statusMessage;
  final String statusCode;
  final bool success;


  const ErrorMessage({required this.statusMessage,required this.statusCode,required this.success});

  factory ErrorMessage.fromJson(Map<String,dynamic>json){
    return ErrorMessage(
        statusMessage : json['status_message'],
        statusCode : json['status_code'],
        success : json['success']
    );

  }

  @override
  // TODO: implement props
  List<Object?> get props => [statusCode,statusMessage,success];
}