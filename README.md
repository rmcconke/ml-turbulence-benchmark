# Benchmark dataset for machine learning in RANS turbulence modelling
The field of ML augmented RANS modelling has seen significant interest for at least a decade. Many methodologies have been proposed. However, a critical problem slowing progress in the field is the absence of an open-source benchmark dataset with clear evaluation criteria. In order to compare a new technique against an existing technique, significant effort is required. We aim to eliminate this required effort and greatly accelerated progress in the field by implementing a benchmark dataset for ML in RANS.


Our goal is to create a challenging dataset that represents the actual state of ML-augmented RANS turbulence modelling. We aim to propose challenging generalization tasks, with the goal that over time, techniques which generalize better will rise to the top of the leaderboard. We do not want to cast the field in an overly optimistic light; we want to provide a hard challenge that will motivate new ideas in the field.

The benchmark task is to **predict the flow field** for a series of test cases given a specified training and validation dataset, as well as a given CFD mesh. All other decisions are left to the submitter.


# Datasets: 
## Periodic hills
### Xiao 29 parametric variations dataset
### PHLL 10595

## Duct

### Square duct
Coming soon.
### Rectangular duct
Coming soon.

## Backward-facing step
### Curved backward-facing step
### Sharp backward-facing step

## NASA Wall-mounted hump  

# Fields available
The following fields are available for each of the datasets:
- RANS predictions with the $k$-$\omega$ SST model
- DNS or LES "ground truth" data, including **velocity gradients**
- "Frozen" propoagation fields

# Training/validation/test split
It is **mandatory** that you use the following training/validation/test split.

This is to ensure fair comparison of all modelling techniques. We are open to adding to this - the below train/val/test split is just what we're starting with for the initial benchmark. A checkmark in the below table indicates cases where only a single parametric variation is available; otherwise, the datasets are split into train/validation/test.

|**Flow**  | **Training** | **Validation** | **Test** |
|- | - | - |  - |
|**PHLL29** | (21 remaining cases)|`alpha_05_10071_4048`, `alpha_05_10071_2024`, `alpha_15_7929_4048`, `alpha_15_7929_2024`| `alpha_15_13929_4048`, `alpha_15_13929_2024`, `alpha_05_4071_4048`, `alpha_05_4071_2024`|
|**DUCT** | TBD |TBD |TBD |
|**CBFS13700** | ✓| | |
|**NASAHUMP**| ✓ | | |
|**PHLL10595**|  | | ✓|
|**BFS**| | |✓ | |

The below figure clarifies the validation/test split chosen for the periodic hills dataset.

The benchmark scores are based on your model's performance on the test datasets.

It is **strictly forbidden** that you do not train on any data from the test cases. To encourage this, we have left the ground truth data out of the test cases. However, we are aware this data is all available online. If you are found to have trained or validated on any of the test cases, your submission will be automatically withdrawn, and a note will be made on the leaderboard.

## Design philosophy
This train/val/test split tests the following:
- Reynolds number generalization
- Geometry generalization
- Covariance (model predictions rotate with the entire coordinate frame)
- Galilean invariance (model predictions do not change with a Galilean boost of the input features)

# Submission instructions
You must submit your predictions on the test dataset in **OpenFOAM format**. If you are using another software package, please convert into OpenFOAM format before submitting.

1. Save your predictions in OpenFOAM format under the respective directories in the `test` subdirectory of the benchmark dataset.
2. You can preview what your score will be using the benchmark dataset's python package.
3. Upload your `test` subdirectory to [figshare](https://figshare.com/).
4. Create a pull request for this git repo 
5. The benchmark steward (currently, Ryley McConkey) will evaluate your predictions, and update the leaderboard accordingly.




