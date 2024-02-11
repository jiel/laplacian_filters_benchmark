import numpy as np
from benchmark import benchmark


def numpy_mul(img, kernel):
    height, width = img.shape[0], img.shape[1]
    result = np.zeros((height, width))
    for i in range(1, height-1):
        for j in range(1, width-1):
            window = img[i-1:i+2, j-1:j+2]
            result[i, j] = int((window[:, :] * kernel).sum())
    return np.clip(result, 0, 255)


if __name__ == "__main__":
    benchmark(func=numpy_mul, nbpics=10, iterm2_display=True)
