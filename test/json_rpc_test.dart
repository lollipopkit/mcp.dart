import 'package:mcp/mcp.dart';
import 'package:test/test.dart';

void main() {
  group('JsonRpcMsg', () {
    test('creates request message', () {
      const request = JsonRpcMsg(
        id: '1',
        method: 'subtract',
        params: {'minuend': 42, 'subtrahend': 23},
      );

      expect(request.id, equals('1'));
      expect(request.jsonrpc, equals('2.0'));
      expect(request.method, equals('subtract'));
      expect(request.params, equals({'minuend': 42, 'subtrahend': 23}));
      expect(request.result, isNull);
      expect(request.error, isNull);
    });

    test('creates response message with result', () {
      const response = JsonRpcMsg(
        id: '1',
        method: '',
        result: 19,
      );

      expect(response.id, equals('1'));
      expect(response.jsonrpc, equals('2.0'));
      expect(response.method, equals(''));
      expect(response.params, isNull);
      expect(response.result, equals(19));
      expect(response.error, isNull);
    });

    test('creates error response message', () {
      const errorResponse = JsonRpcMsg(
        id: '1',
        method: '',
        error: {'code': -32700, 'message': 'Parse error'},
      );

      expect(errorResponse.id, equals('1'));
      expect(errorResponse.jsonrpc, equals('2.0'));
      expect(errorResponse.method, equals(''));
      expect(errorResponse.params, isNull);
      expect(errorResponse.result, isNull);
      expect(errorResponse.error, isMap);
      expect((errorResponse.error as Map?)?['code'], equals(-32700));
      expect((errorResponse.error as Map?)?['message'], equals('Parse error'));
    });

    test('creates notification message', () {
      const notification = JsonRpcMsg(
        method: 'update',
        params: [1, 2, 3, 4, 5],
      );

      expect(notification.id, isNull);
      expect(notification.jsonrpc, equals('2.0'));
      expect(notification.method, equals('update'));
      expect(notification.params, equals([1, 2, 3, 4, 5]));
      expect(notification.result, isNull);
      expect(notification.error, isNull);
    });

    test('fromJson deserializes JSON correctly', () {
      final jsonMap = {
        'id': '1',
        'jsonrpc': '2.0',
        'method': 'subtract',
        'params': {'minuend': 42, 'subtrahend': 23}
      };

      final request = JsonRpcMsg.fromJson(jsonMap);

      expect(request.id, equals('1'));
      expect(request.jsonrpc, equals('2.0'));
      expect(request.method, equals('subtract'));
      expect(request.params, equals({'minuend': 42, 'subtrahend': 23}));
    });

    test('toJson serializes object correctly', () {
      const request = JsonRpcMsg(
        id: '1',
        method: 'subtract',
        params: {'minuend': 42, 'subtrahend': 23},
      );

      final json = request.toJson();

      expect(json['id'], equals('1'));
      expect(json['jsonrpc'], equals('2.0'));
      expect(json['method'], equals('subtract'));
      expect(json['params'], equals({'minuend': 42, 'subtrahend': 23}));
    });
  });
}
