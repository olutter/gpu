import 'package:flutter_test/flutter_test.dart';
import "package:flutter_gpu/gpu.dart" as gpu;

void main() {
  test('Checks default color format.', () {
    final x = gpu.BlendOperation.add;

    expect(x, gpu.BlendOperation.add);
  });
}
