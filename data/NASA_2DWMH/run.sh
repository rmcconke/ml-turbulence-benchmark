#!/bin/bash

# Exit when a line throws an error
set -e

simpleFoam > log.run

./postProcess.sh
