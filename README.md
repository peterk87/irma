# IRMA: Iterative Refinement Meta-Assembler

*NOTE: This repository is a modified version based on the source code in [IRMA v0.6.7 zip file] from the [IRMA Website]. Binaries that can be downloaded from Conda have been removed.*


## About IRMA

From the [IRMA Website]:

> IRMA was designed for the robust assembly, variant calling, and phasing of highly variable RNA viruses. Currently IRMA is deployed with modules for influenza and ebolavirus. IRMA is free to use and parallelizes computations for both cluster computing and single computer multi-core setups. Please refer to our FAQ below or contact us for further questions. Please read IRMA's full license and disclaimer.

> The [IRMA manuscript] provides more background on the methodology.

> *NOTE: the [SAM] binaries packaged within [LABEL] and the [BLAT] binaries packaged within IRMA may be used for government and/or academic use only. Commercial use and redistribution of [SAM] or [BLAT] is excluded without permission from their authors. Please read the [SAM] license and [BLAT] license.*

## Getting Started


```bash
# Install Conda
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p $HOME/miniconda

# Download repo
git clone https://github.com/peterk87/irma.git
```


## Dependencies

- [BLAT] for the match step
- [LABEL], which also packages certain resources used by IRMA:
    - Sequence Alignment and Modeling System ([SAM]) for both the rough align and sort steps
    - [Shogun Toolbox], which is an essential part of [LABEL], is used in the sort step
- [SSW] for the final assembly step, download our [minor modifications to SSW](https://wonder.cdc.gov/amd/flu/irma/ssw-modified.tar.gz)
- [samtools] for BAM-SAM conversion as well as BAM sorting and indexing
- [GNU Parallel] for single node parallelization




[IRMA manuscript]: https://bmcgenomics.biomedcentral.com/articles/10.1186/s12864-016-3030-6
[IRMA Website]: https://wonder.cdc.gov/amd/flu/irma/
[IRMA v0.6.7 zip file]: https://wonder.cdc.gov/amd/flu/irma/flu-amd-201704.zip
[SAM]: https://www.ncbi.nlm.nih.gov/pubmed/9927713
[BLAT]: http://www.kentinformatics.com/products.html
[LABEL]: https://wonder.cdc.gov/amd/flu/label/
[SSW]: http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0082138
[samtools]: http://www.htslib.org/
[GNU Parallel]: https://www.gnu.org/software/parallel/
