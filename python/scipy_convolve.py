import numpy as np
from benchmark import benchmark
from scipy import ndimage


def scipy_convolve(img, kernel):
    """scipy.ndimage convolve"""
    return np.clip(ndimage.convolve(img, kernel), 0, 255)

if __name__ == "__main__":
    benchmark(func=scipy_convolve, nbpics=10, iterm2_display=True)
