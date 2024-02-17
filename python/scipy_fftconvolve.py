import numpy as np
from benchmark import benchmark
from scipy import signal


def scipy_fftconvolve(img, kernel):
    """scipy.signal fftconvolve"""
    return np.clip(signal.fftconvolve(img, kernel, mode='same'), 0, 255)

if __name__ == "__main__":
    benchmark(func=scipy_fftconvolve, nbpics=10, iterm2_display=True)
