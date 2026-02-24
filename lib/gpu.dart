import "dart:typed_data";

import "package:flutter_gpu/gpu.dart" as gpu;
import 'package:vector_math/vector_math.dart' as vm;

gpu.PixelFormat get defaultColorFormat => gpu.gpuContext.defaultColorFormat;

/// Loads a shader library from an asset.
gpu.ShaderLibrary loadShaderLibrary(String assetName) {
  return gpu.ShaderLibrary.fromAsset(assetName)!;
}

/// Creates a fullscreen 2D Triangle.
gpu.DeviceBuffer createTriangle() {
  final vertices = Float32List.fromList([
    -0.5, -0.5, // Vertex 1
    0.5, -0.5, // Vertex 2
    0.0, 0.5, // Vertex 3
  ]);

  final verticesDeviceBuffer =
      gpu.gpuContext.createDeviceBufferWithCopy(ByteData.sublistView(vertices));

  return verticesDeviceBuffer;
}

/// Creates a GPU Render target with specified dimensions.
gpu.RenderTarget createRenderTarget(int width, int height) {
  final texture = gpu.gpuContext
      .createTexture(gpu.StorageMode.devicePrivate, width, height);

  final renderTarget = gpu.RenderTarget.singleColor(gpu.ColorAttachment(
      texture: texture, clearValue: vm.Vector4(0, 0, 1, 1)));

  return renderTarget;
}
