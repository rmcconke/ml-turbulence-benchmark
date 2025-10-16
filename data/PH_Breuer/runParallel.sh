#!/bin/bash

# Exit when a line throws an error
set -e

decomposePar > log.decomposePar

mpirun -np 8 modelPropagationFoam -parallel > log.run

reconstructPar > log.reconstructPar

rm -rf processor*

./postProcess.sh
