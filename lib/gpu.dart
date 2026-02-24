import "package:flutter_gpu/gpu.dart" as gpu;

gpu.PixelFormat get defaultColorFormat => gpu.gpuContext.defaultColorFormat;

gpu.ShaderLibrary loadShaderLibrary(String assetName) {
  return gpu.ShaderLibrary.fromAsset(assetName)!;
}
