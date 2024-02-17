import numpy as np
from benchmark import benchmark
from scipy import ndimage


def scipy_laplace(img, kernel):
    """scipy.ndimage laplace"""
    return np.clip(ndimage.laplace(img), 0, 255)


if __name__ == "__main__":
    benchmark(func=scipy_laplace, nbpics=10, iterm2_display=True)
