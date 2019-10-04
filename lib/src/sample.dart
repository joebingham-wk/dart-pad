// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library dart_pad.sample;

final String dartCode = r'''
import 'dart:html';

import 'package:react/react_dom.dart' as react_dom;
import 'package:web_skin_dart/ui_components.dart';
import 'package:web_skin_dart/ui_core.dart';

void main() {
  setClientConfiguration();
  react_dom.render(Block()(), querySelector('.main'));
}

''';
