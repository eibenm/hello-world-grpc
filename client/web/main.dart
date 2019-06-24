import 'dart:async';
import 'dart:html';

import 'package:grpc/grpc_web.dart';

import 'package:grpc_web/src/generated/helloworld.pbgrpc.dart';

Future<void> main() async {

  print(">>> loading web script");

  final channel = GrpcWebClientChannel.xhr(Uri.parse('http://localhost:8080'));
  final service = GreeterClient(channel);

  final button = querySelector('#send') as ButtonElement;
  button.onClick.listen((e) async {

    final msg = querySelector('#msg') as TextInputElement;
    final value = msg.value.trim();
    msg.value = '';

    if (value.isEmpty) return Future.value(null);

    print('Sending value $value');

    try {
      final response = await service.sayHello(HelloRequest()..name = value);
      print('Greeter client received: ${response.message}');
    } catch (e) {
      print('Caught error: $e');
    }

    return Future.value(null);
    // return channel.shutdown();
  });
}
