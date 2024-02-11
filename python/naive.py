import numpy as np
from benchmark import benchmark


def naive(img, kernel):
    height, width = img.shape[0], img.shape[1]
    result = np.zeros((height, width))
    for i in range(1, height-1):
        for j in range(1, width-1):
            acc = 0
            for x in range(3):
                for y in range(3):
                    acc += img[i-1+y, j-1+x]*kernel[y, x]
            result[i, j] = min(255, max(0, acc))
    return result


if __name__ == "__main__":
    benchmark(func=naive, nbpics=10, iterm2_display=True)
