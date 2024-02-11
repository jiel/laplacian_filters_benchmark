import time
import os

from imgcat import imgcat
import numpy as np
from PIL import Image


def listdir(dir, ext):
    return " ".join([os.path.join(dir, file) for file in os.listdir(dir) if file.endswith(ext)])


picfiles = listdir("../pictures", "pgm").split(" ")
idx = 0
while True:
    print(picfiles[idx])
    img = np.array(Image.open(picfiles[idx])).astype(np.int16)
    imgcat(img)
    print()
    idx += 1
    if idx >= 10:
        break
