# Hydrogen_GWP
Code and data for calculation of GWPs in the Hydrogen project.

## Content
- [Main notebook for GWP calulations](https://github.com/ciceroOslo/Hydrogen_GWP/blob/main/GWP_notebook.ipynb)
Run this first, as it provides input for all of or most of the other notebooks. You can also see most of the calculations here
For several of the notebooks to run, it needs to be run both with adjust_drydep=False, and with adjust_drydep=True and drydeposition values according to your needs. 


- [Notebook to calculate GWP values with uncertainties for 20, 100 and 500 year time horizons](https://github.com/ciceroOslo/Hydrogen_GWP/blob/main/GWP_different_time_horizons.ipynb)
Produces numbers for uncertainty tables, table 1 table S9 and S10 in the paper, and figure 4 for the main text

- [Make various GWP figures](https://github.com/ciceroOslo/Hydrogen_GWP/blob/main/GWP_figures.ipynb)
Produces GWP figures, figure 4 for the main text and also figure S3 with methane GWP for the supplement

- [Make various GWP figures with drydep span](https://github.com/ciceroOslo/Hydrogen_GWP/blob/main/hydrogen_figures.ipynb)
Like the previous but with different harmonized soil sink values. Not used in the paper. Make sure to run the base notebook with various drydep values for this to work.

- [Notebook to make budget figure, figure 1 in paper](https://github.com/ciceroOslo/Hydrogen_GWP/blob/main/budget_figure.ipynb)
Makes figure 1 in the paper and table S1 in the paper supplement

- [Notebook to make budget tables for methane](https://github.com/ciceroOslo/Hydrogen_GWP/blob/main/budget_table_ch4.ipynb)
Makes table S2 in the supplement

- [Notebook to make per flux figures with uncertainties and split between methane induced and direct](https://github.com/ciceroOslo/Hydrogen_GWP/blob/main/make_figures_per_flux.ipynb)
Make bar plots of model results for per hydrogen flux effects chemistry and forcing changes on various species like those in figure 3, but including uncertainties from soil sink harmonisation and split into direct effects and methane induced effects

- [Notebook to make per flux figures combining methane induced and direct effects](https://github.com/ciceroOslo/Hydrogen_GWP/blob/main/make_figures_per_flux_combined.ipynb)
Make bar plots of model results for per hydrogen flux effects chemistry and forcing changes on various species to make up the components of figure 3 and more.

- [Notebook to make per flux figures combining methane induced and direct effects with harmonized soil sink](https://github.com/ciceroOslo/Hydrogen_GWP/main/make_figures_per_flux_combined_harmonized_soil_sink.ipynb)
Make bar plots of model results for per hydrogen flux effects chemistry and forcing changes on various species like those in figure 3, but using a harmonised soil sink

- [Outline for how to combine methane and hydrogen experiments](https://github.com/ciceroOslo/Hydrogen_GWP/blob/main/Note_on_how_to_combine_methane_and_hydrogen_experiments.ipynb)
Not used directly, but helpful in the combination of data to form figure 2
