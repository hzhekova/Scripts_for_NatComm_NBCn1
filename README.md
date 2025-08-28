# Scripts_for_NatComm_NBCn1
This repository contains several scripts used for trajectory analysis with VMD, CHARMM, and PyEMMA. 
The scripts were used in the following publication in Nature Communications:
CryoEM and Computational Modeling Structural Insights into pH Regulator NBCn1 by
Weiguang Wang, Hristina R. Zhekova, Kirill Tsirulnikov1, B. Sridhar Dwadasi, Ehecatl Guzman Aparicio, Rustam Azimov, 
Natalia Abuladze, Liyo Kao, Dora Acuna, D. Peter Tieleman, Z. Hong Zhou, Alexander Pushkin, Ira Kurtz

VMD scripts:
- pbcwrap_trajectory.tcl: Wraps and aligns a MD trajectory with respect to selected protein atoms.
This results in a MD trajectory with the protein in the center of the periodic cell, which can then be
used for further analysis with scripts or VMD tools (e.g. VolMap)

CHARMM script:
- ion_time_series.inp: Uses the MIND CHARMM function to select the closest anion and Na ions to a defined region of
the protein and then outputs the distance between the ions and the protein for each step of the trajectory. 
The output can be used for generation of time series of the ions in the binding pocket of the protein.

PyEMMA scripts:
- ?
- ?

More information on the usage of the scripts is provided as comments in the scripts.
