import os


def listdir(dir, ext):
    return " ".join([os.path.join(dir, file) for file in os.listdir(dir) if file.endswith(ext)])