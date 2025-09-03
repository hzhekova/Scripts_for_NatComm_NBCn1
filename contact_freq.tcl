#This script evaluates the contact frequencies of protein residues that come in contact with the different 
#ions during the 200 ns long unrestrained MD calculations of hNBCn1 in OF and IF state, loaded with 2Na+ and a CO32- ions
#To use: vmd -dispdev text -e contact_freq.tcl 
set outfile [open "name_of_results_file.dat" w]
#####
set mol [mol new name_of_psf_file.psf type psf]
mol addfile name_of_traj_file.dcd type dcd first 100 last 2000 step 1 waitfor all molid $mol
#Above, the trajectory steps between 100 and 2000 are loaded for analysis.
set numfr [molinfo top get numframes]
for {set j 1} {$j < $numfr} {incr j} {
#A selection is made of all protein atoms within 5A of the ions of interest using VMD selection language and the 
#appropriate (e.g. resname CLA, CO3, CO31, SOD as name_of_ion). 
set prot_sel [atomselect top "protein and within 5 of resname name_of_ion" frame $j]
    set residue_id_prot [$prot_sel get resid]
    set atom_name_prot [$prot_sel get name]
#This information is printed in the outfile: trajectory step, resid of the protein residue involved in ion contact,
#atom name of the protein atom involved in ion contact
    puts $outfile "frame $j"
    puts $outfile "prot_resid $residue_id_prot"
    puts $outfile "prot_atom $atom_name_prot"
    puts $outfile "\n"
}
close $outfile
quit
