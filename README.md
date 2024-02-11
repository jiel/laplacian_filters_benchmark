# Laplacian filters benchmark

This project aims to compare the performance of different implementations of the Laplacian filter (edge detection).

## data

The [test images](./pictures/) come from the [BSDS500 dataset](https://www2.eecs.berkeley.edu/Research/Projects/CS/vision/bsds/). 

We used the grayscale versions and converted them to [_portable graymap format_](https://en.wikipedia.org/wiki/Netpbm) (.pgm) to use them easily, including with languages such as mojo where there is no utility library yet.

Some scripts use the [inline image protocol](https://iterm2.com/documentation-images.html) offered by iTerm2 to make the user experience more interactive. This also helped us during the development phase to quickly detect implementation errors. 

An extract of the dataset can be viewed using the ```viewpic.py``` script.

No living animals were harmed during these experiments.