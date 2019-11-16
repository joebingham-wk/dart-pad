import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart';

void main() {
  var handler = createStaticHandler('build',
      defaultDocument: 'index.html');

  io.serve(handler, '0.0.0.0', 8000).then((server) {
    print('Serving at http://${server.address.host}:${server.port}');
  });
}
