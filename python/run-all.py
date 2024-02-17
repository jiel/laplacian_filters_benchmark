from benchmark import benchmark
from naive import naive
from numpy_mul import numpy_mul
from numba_numpy_mul import numba_numpy_mul
from scipy_laplace import scipy_laplace
from scipy_convolve import scipy_convolve
from scipy_fftconvolve import scipy_fftconvolve
from opencv_filter2D import opencv_filter2D
from opencv_laplacian import opencv_laplacian


if __name__ == "__main__":
    algos = [
        (naive, 10), (numpy_mul, 10), (numba_numpy_mul, 10),
        (scipy_fftconvolve, 100), (scipy_convolve, 100), (scipy_laplace, 100),
        (opencv_filter2D, 100), (opencv_laplacian, 100)
    ]
    for algo, nb_iterations in algos:
        mean_duration = benchmark(func=algo, nbpics=nb_iterations,
                                  iterm2_display=False, print_stats=False)
        print(f'PYTHON : {algo.__doc__:29s} : mean duration on ' +
              f'{nb_iterations}pictures: {mean_duration:.3f} ms / picture')
