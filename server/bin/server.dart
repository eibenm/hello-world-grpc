/// Dart implementation of the gRPC helloworld.Greeter server.
import 'dart:async';

import 'package:grpc/grpc.dart';

import 'package:helloworld/src/generated/helloworld.pb.dart';
import 'package:helloworld/src/generated/helloworld.pbgrpc.dart';

class GreeterService extends GreeterServiceBase {
  @override
  Future<HelloReply> sayHello(ServiceCall call, HelloRequest request) async {
    return HelloReply()..message = 'Hello, ${request.name}!';
  }
}

Future<void> main(List<String> args) async {
  final server = Server([GreeterService()]);
  await server.serve(port: 9090);
  print('Server listening on port ${server.port}...');
}
