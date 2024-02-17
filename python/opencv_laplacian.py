import numpy as np
from benchmark import benchmark
from cv2 import Laplacian


def opencv_laplacian(img, kernel):
    """opencv laplacian"""
    return np.clip(Laplacian(src=img, ddepth=-1), 0, 255)


if __name__ == "__main__":
    benchmark(func=opencv_laplacian, nbpics=10, iterm2_display=True)
