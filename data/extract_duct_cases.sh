#!/bin/bash

# Copy initial conditions from common/0_Baseline to each case's 00Baseline folder
cd Duct-raw/rans

for case in AR_1_Ret_180 AR_1_Ret_360 AR_3_Ret_180 AR_3_Ret_360 AR_5_Ret_180 AR_7_Ret_180 AR_10_Ret_180 AR_14_Ret_180; do
    cp -rL common/0_Baseline/* "$case/00Baseline/beta11/0/"
    cp -L "$case/01Frozen/interpolateDNS/interpolatedFields"/* "$case/00Baseline/beta11/0/"
    rm -rf "$case/00Baseline/beta11/constant"
    cp -rL "$case/meshes/beta11/constant" "$case/00Baseline/beta11/"
    cp -L common/controlDict "$case/00Baseline/beta11/system/"
    cp -L common/convergenceProbes "$case/00Baseline/beta11/system/"
    cp -L common/decomposeParDict "$case/00Baseline/beta11/system/"
    cp -L common/faceValues "$case/00Baseline/beta11/system/"
    cp -L common/fvOptions "$case/00Baseline/beta11/system/"
    cp -L common/fvSchemes "$case/00Baseline/beta11/system/fvSchemes"
    cp -L common/fvSolutionBaseline "$case/00Baseline/beta11/system/fvSolution"
    cp -L common/turbulencePropertiesBaseline "$case/00Baseline/beta11/constant/turbulenceProperties"
    cp -L common/residuals "$case/00Baseline/beta11/system/"
    cp -L common/singleGraphDiag "$case/00Baseline/beta11/system/"
    cp -L common/wallValues "$case/00Baseline/beta11/system/"
    find "$case/00Baseline/beta11" -type f -size 0 -delete
    mkdir -p "../../DUCT/$case"
    cp -r "$case/00Baseline/beta11"/* "../../DUCT/$case/"
done


echo "Initial conditions copied."
