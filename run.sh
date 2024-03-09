#!/bin/sh

cd python; python hostinfo.py; cd ..
python --version
mojo --version
echo "---   compute mean duration on the BSDS500 dataset  ---"
cd python; python run-all.py; cd ..
cd mojo; mojo run-all.mojo; cd ..
