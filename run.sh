#!/bin/sh

cd python; python hostinfo.py; cd ..
cd python; python run-all.py; cd ..
cd mojo; mojo run-all.mojo; cd ..
