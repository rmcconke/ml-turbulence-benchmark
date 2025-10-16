cd Parm_PH_29

for case in alpha_*/*; do
    rm -rf "$case/4000"
    rm -rf "$case/8000"
    rm -rf "$case/12000"
    rm -rf "$case/16000"
done
