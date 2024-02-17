from Matrix import Matrix
from bench import benchmark
from math import min, max
from algorithm import vectorize, parallelize

from sys.info import simdwidthof
alias nelts = (simdwidthof[DType.float32]())

alias WORKERS = 2

fn paravectorized(self: Matrix[DType.float32], kernel: Matrix[DType.float32]) -> Matrix[DType.float32]:
    var result = Matrix[DType.float32](self.height, self.width)
    # Loop through each pixel in the image
    # But skip the outer edges of the image
    @parameter
    fn compute_row(i: Int):
        @parameter
        fn dot[nelts: Int](j: Int):
            var acc: SIMD[DType.float32,nelts] = 0
            for k in range(3) :
                for l in range(3):
                    acc += self.simd_load[nelts](i+k, j+l) * kernel[k, l]
            result.simd_store[nelts](i+1, j+1, min(255, max(0, acc)))
        vectorize[nelts, dot](self.width-2)
    parallelize[compute_row](self.height-2, WORKERS)
    return result

fn main() raises:
    _ = benchmark(func=paravectorized, nbpics=10, iterm2_display=True)