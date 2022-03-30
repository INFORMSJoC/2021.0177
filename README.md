[![INFORMS Journal on Computing Logo](https://INFORMSJoC.github.io/logos/INFORMS_Journal_on_Computing_Header.jpg)](https://pubsonline.informs.org/journal/ijoc)

# Solving Natural Conic Formulations with Hypatia.jl

This archive is distributed in association with the [INFORMS Journal on
Computing](https://pubsonline.informs.org/journal/ijoc) under the [MIT License](LICENSE).

The software and data in this repository are a snapshot of the software and data
that were used in the research reported on in the paper 
"Solving Natural Conic Formulations with Hypatia.jl" by C. Coey, L. Kapelevich, J.P. Vielma. 
The snapshot is based on 
[this SHA](https://github.com/chriscoey/Hypatia.jl/commit/2a5230db92c285d09cb9cfeb40571bb58a808ea3) 
in the development repository. 

**Important: This code is being developed on an on-going basis at 
https://github.com/chriscoey/Hypatia.jl. Please go there if you would like to
get a more recent version or would like support.**

## Cite

To cite this software, please cite the paper and the software itself using the following DOI.

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6338835.svg)](https://doi.org/10.5281/zenodo.6338835)

Below is the BibTeX for citing this version of the code.

```
@article{Hypatia,
title = {{Hypatia.jl} version v2021.0177},
author = {Chris Coey, Lea Kapelevich, and contributors},
year = 2021,
publisher = {INFORMS Journal on Computing},
doi = {10.5281/zenodo.6338835},
note = {Available for download from https://github.com/INFORMSJoC/2021.0177},
}
```

## Description

Hypatia is a highly-customizable open source interior point solver for generic conic optimization problems, written in [Julia](https://julialang.org/).

For more information on Hypatia, please see:
- [latest README](https://github.com/chriscoey/Hypatia.jl#readme) for an overview of the software
- [documentation](https://chriscoey.github.io/Hypatia.jl/dev) for Hypatia's conic form, predefined cones, and interfaces
- [cones reference](https://github.com/chriscoey/Hypatia.jl/wiki/files/coneref.pdf) for cone definitions and oracles
- [examples folder](https://github.com/chriscoey/Hypatia.jl/tree/master/examples) for applied examples and instances
- [benchmarks folder](https://github.com/chriscoey/Hypatia.jl/tree/master/benchmarks) for scripts used to run and analyze various computational benchmarks

## Installation

To use Hypatia, install [Julia](https://julialang.org/downloads/), then at the Julia REPL, type:
```julia
julia> using Pkg; Pkg.add("Hypatia")
julia> using Hypatia
```

## Replicating

Scripts in the `benchmarks/natvsext` directory are used for comparing _natural_ and _extended_ formulations for problems in the `examples` folder using Hypatia and MOSEK.

In `benchmarks/natvsext`, the file `raw/bench.csv` contains the raw output of the `run.jl` script, from which our results are generated.
The `analysis` folder contains files produced from this raw CSV file by the `analyze.jl` script.
These processed results files are used to generate the PGFPlots plots (from the CSV files in the `csvs` folder) and LaTeX tables (from TeX files in the `tex` folder) in the paper.

The following instructions for running the `run.jl` and `analyze.jl` scripts in `benchmarks/natvsext` should work from a Linux/macOS shell/terminal.

### Install Julia and dependencies

Install the selected version of Julia (e.g. v1.7) from https://julialang.org/downloads/.

Install the selected version of MOSEK (e.g. version 9) by following the instructions at https://github.com/MOSEK/Mosek.jl.

Start Julia from the shell and enter Julia's pkg mode by typing `]`.
Install Hypatia and the script dependencies:
```julia
pkg> dev Hypatia
pkg> add Combinatorics CSV DataFrames DataStructures DelimitedFiles Distributions
pkg> add DynamicPolynomials ForwardDiff JuMP PolyJuMP Random SemialgebraicSets
pkg> add SpecialFunctions SumOfSquares Test Printf Distributed ECOS MosekTools
```
Exit Julia.
Set the desired version of Hypatia (e.g. v0.5.0) with:
```shell
cd ~/.julia/dev/Hypatia
git checkout v0.5.0
```
Update packages by starting Julia again and typing `]`, then:
```julia
pkg> up
```
Exit Julia, and change directory to the benchmarks/natvsext folder:
```shell
cd ~/.julia/dev/Hypatia/benchmarks/natvsext
```

### The run.jl script

Open `run.jl` with a code editor.
Under `inst_sets =` and `JuMP_examples = `, uncomment the items under the "natural formulations paper" header and comment (add #) the remaining.

This script spawns a process for each instance and each solver, one at a time.
It kills the process if a memory or time limit is reached (see the options at the top of run.jl).
It puts output files into the `raw` folder, specifically a csv file that is used by the analysis script, and a txt file of script progress and solver printouts.

Start a GNU Screen from the shell by typing `screen`
(see https://www.gnu.org/software/screen/ for installation).

Run (from the benchmarks/natvsext directory):
```shell
mkdir -p raw
killall julia; ~/julia/julia run.jl &> raw/bench.txt
```
If the script errors in the next few minutes, follow the error messages to debug, or if that fails, try starting Julia and running:
```julia
julia> include("run.jl")
```
Follow any prompts or error instructions (e.g. to install missing packages).

If the script does not error after a few minutes, detach from the GNU Screen session by typing `ctrl+a` then `d` (to later reattach, type `screen -r`).
Monitor the progress of the script by typing:
```shell
cat raw/bench.txt
tail -f raw/bench.txt
```
The script should take several days to finish.

### The analyze.jl script

This script reads the csv output of the run.jl script, `raw/bench.csv`, and analyzes these results, outputting analysis/summaries into files in the `analysis` folder and printing some information to the shell.

Start Julia (from the benchmarks/natvsext directory) and run:
```julia
julia> include("analyze.jl")
```
Follow any error messages to debug.
The script should take at most a couple of minutes.
When finished, inspect the files in the `analysis` folder.

## Ongoing Development

This code is being developed on an on-going basis at the
[Github site](https://github.com/chriscoey/Hypatia.jl).

## Support

For support in using this software, submit an
[issue](https://github.com/chriscoey/Hypatia.jl/issues/new).

## Acknowledgements

This work has been partially funded by the National Science Foundation under grant OAC-1835443 and the Office of Naval Research under grant N00014-18-1-2079.
