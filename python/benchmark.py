import time
import os

from imgcat import imgcat
import numpy as np
from PIL import Image


def listdir(dir, ext):
    return " ".join([os.path.join(dir, file) for file in os.listdir(dir) if file.endswith(ext)])


def benchmark(func, nbpics, iterm2_display):
    picfiles = listdir("../pictures", "pgm").split(" ")
    idx = 0
    cpt = 0
    duration = 0
    kernel = np.array([[0, -1, 0], [-1, 4, -1], [0, -1, 0]])
    while True:
        img = np.array(Image.open(picfiles[idx])).astype(np.int16)

        start = time.time()
        res = func(img, kernel)
        duration += time.time() - start

        if iterm2_display:
            imgcat(res)
        cpt += 1
        if cpt >= nbpics:
            break
        idx += 1
        if idx >= len(picfiles):
            idx = 0

    print(f'total duration for {nbpics} pictures : {int((duration * 1000))} ms')
    print(f'mean duration : {((duration * 1000) / nbpics):.3f} ms / picture')
