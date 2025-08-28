#This script generates ion and water density maps and has been use for the various density maps 
#calculated from restrained and unrestrained MD simulations reported in the paper
#To use: vmd -dispdev text -e make_dx.tcl
# 


# Input:
set psf name_of_psf_file.psf
set dcd0 name_of_traj_file.dcd

# Load the system.
mol new $psf
mol addfile $dcd0 first number_of_first_step last number_of_last_step step step_size waitfor all

set water_dens [atomselect top "name OH2"]
set CO3_dens [atomselect top "resname CO3"]
set CO31_dens [atomselect top "resname CO31"]
set CLA_dens [atomselect top "resname CLA"]
set SOD_dens [atomselect top "resname SOD"]

volmap density $water_dens -res 0.5 -radscale 1.0 -weight mass -allframes -combine avg -o name_of_output_density_map_water.dx
volmap density $CO3_dens -res 0.5 -radscale 1.0 -weight mass -allframes -combine avg -o name_of_output_density_map_CO3.dx
volmap density $CO31_dens -res 0.5 -radscale 1.0 -weight mass -allframes -combine avg -o name_of_output_density_map_HCO3.dx
volmap density $CLA_dens -res 0.5 -radscale 1.0 -weight mass -allframes -combine avg -o name_of_output_density_map_CL.dx
volmap density $SOD_dens -res 0.5 -radscale 1.0 -weight mass -allframes -combine avg -o name_of_output_density_map_Na.dx

mol delete top
quit
