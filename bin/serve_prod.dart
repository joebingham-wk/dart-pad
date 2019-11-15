import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart';

void main() {
  var handler = createStaticHandler('build',
      defaultDocument: 'index.html');

  io.serve(handler, 'localhost', 80);
}
