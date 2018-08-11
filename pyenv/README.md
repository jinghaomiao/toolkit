# Manage python environment

1. [Install conda](https://conda.io/docs/user-guide/install/linux.html).

1. Update conda:

```bash
conda update -n base conda
```

1. Manage conda env:

```bash
# Create or update
conda env update -f py37.yml

# Activate
source activate py37
# Deactivate
source deactivate
```
