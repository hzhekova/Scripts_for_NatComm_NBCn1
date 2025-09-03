# Scripts_for_NatComm_NBCn1
This repository contains several scripts used for trajectory analysis with VMD, CHARMM, and PyEMMA. 
The scripts were used in the following publication in Nature Communications:
CryoEM and Computational Modeling Structural Insights into pH Regulator NBCn1 by
Weiguang Wang, Hristina R. Zhekova, Kirill Tsirulnikov, B. Sridhar Dwadasi, Ehecatl Guzman Aparicio, Rustam Azimov, 
Natalia Abuladze, Liyo Kao, Dora Acuna, D. Peter Tieleman, Z. Hong Zhou, Alexander Pushkin, Ira Kurtz

VMD scripts:
- pbcwrap_trajectory.tcl: Wraps and aligns a MD trajectory with respect to selected protein atoms.
This results in a MD trajectory with the protein in the center of the periodic cell, which can then be
used for further analysis with scripts or VMD tools (e.g. VolMap)

- make_dx.tcl: Generates ion and water maps in *.dx format from provided *.psf and trajectory *.dcd files using VMD VolMap

- contact_freq.tcl: Outputs the resid and atom names of the protein atoms found within 5A from the ions in the system
using a *psf and a *dcd file as inputs.

CHARMM script:
- ion_time_series.inp: Uses the MIND CHARMM function to select the closest anion and Na ions to a defined region of
the protein and then outputs the distance between the ions and the protein for each step of the trajectory. 
The output can be used for generation of time series of the ions in the binding pocket of the protein.

PyEMMA scripts:
- free_energy_plots_from_ion_density.ipynb: A Jupyter notebook which generates free energy plots from provided *.xvg files.
The xvg files are in turn generated using the following Gromacs command:
gmx trajectory -f name_of_combined_traj_from_all_replicas.xtc -s name_of_tpr.tpr -n name_of_index.ndx -ox name_of_xvg.xvg -seltype res_com
choosing CO3 as an available static index group in the interactive query, thus plotting the free energy corresponding to the CO3 ion density

- NBCn1_OF_IF_transition_clustering.ipynb: A Jupyter notebook which separates trajectory snapshots from two sets of trajectories (of independent
MD simulations starting with intermediate Climber structures) into structural clusters in the OF to IF conformational space
defined by COM distances between gate and core TMs and plots a free energy map of the OF to IF transition from population analysis using
the clusters. The structural features used in the clustering are supplied as .xvg files produced with the following Groimacs command:
gmx_mpi distance -f traj.xtc -s ../folder1/ref.tpr -n ../index.ndx -oav distav_TM1_1us.xvg -select 'cog of group GATE plus cog of group TM1
where GATE and TM1 are defined as group of atoms in the index file index.ndx

More information on the usage of the scripts is provided as comments in the scripts.
