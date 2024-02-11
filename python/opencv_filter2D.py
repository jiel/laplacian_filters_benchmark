import numpy as np
from benchmark import benchmark
from cv2 import filter2D


def opencv_filter2D(img, kernel):
    return np.clip(filter2D(src=img, ddepth=-1, kernel=kernel), 0, 255)


if __name__ == "__main__":
    benchmark(func=opencv_filter2D, nbpics=10, iterm2_display=True)
