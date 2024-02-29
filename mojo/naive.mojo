from Matrix import Matrix
from bench import benchmark
from math import min, max

fn naive(img: Matrix[DType.float32], kernel: Matrix[DType.float32]) -> Matrix[DType.float32]:
    var result = Matrix[DType.float32](img.height, img.width)
    # Loop through each pixel in the image
    # But skip the outer edges of the image
    for i in range(1, img.height-1):
        for j in range(1, img.width-1):
            var acc: Float32 = 0   
            for k in range(3) :
                for l in range(3):
                    acc += img[i-1+k, j-1+l] * kernel[k, l]
            result[i, j] = min(255, max(0, acc))
    return result

fn main() raises:
    _ = benchmark(func=naive, nbpics=10, iterm2_display=True)