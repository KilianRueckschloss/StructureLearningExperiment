#!/usr/bin/bash


   	rm database.pl
   	echo "" >> database.pl
   	echo ":- use_module(library(slipcover))." >> database.pl
	echo "">> database.pl
	echo ":- if(current_predicate(use_rendering/1))." >> database.pl
	echo ":- use_rendering(c3)." >> database.pl
	echo ":- use_rendering(lpad)." >> database.pl
	echo ":- endif." >> database.pl
	echo "">> database.pl 
	echo ":-sc." >> database.pl
	echo ":- set_sc(neg_ex,given)." >> database.pl
	echo ":- set_sc(depth_bound,false)." >> database.pl
	echo ":- set_sc(verbosity,3)." >> database.pl
	echo "">> database.pl
	echo "">> database.pl
	echo "" >> database.pl
	echo "fold(e,[e])." >> database.pl
	echo "" >> database.pl
	echo "output(recovery/1)." >> database.pl
	echo "output(treatment/1)." >> database.pl
	echo "output(neg_treatment/1)." >> database.pl
	echo "output(patient)." >> database.pl
	echo "input(treatment/1)." >> database.pl
	echo "input(neg_treatment/1)." >> database.pl
	echo "input_cw(patient/1)." >> database.pl
	echo "">> database.pl
	echo "modeh(1,treatment(+patient)).">> database.pl
	echo "modeh(1,recovery(+patient)).">> database.pl
	echo "modeb(1,patient(+patient)).">> database.pl
	echo "modeb(1,treatment(+patient)).">> database.pl
	echo "modeb(1,neg_treatment(+patient)).">> database.pl	
	echo "">> database.pl
	echo "determination(treatment/1,patient/1).">> database.pl
	echo "determination(recovery/1,neg_treatment/1).">> database.pl
	echo "determination(recovery/1,treatment/1).">> database.pl
	echo "determination(recovery/1,patient/1).">> database.pl
	echo "">> database.pl
	echo "banned(treatment(X),neg_treatment(X)).">> database.pl
	echo "">> database.pl
	echo "bg([neg_treatment(X) :- patient(X), \+ treatment(X)]).">> database.pl
  	echo "" >> database.pl
  	echo "begin(model(e))." >> database.pl
  	problog sample generate_database.pl -a 1000 >> database.pl
	echo "end(model(e))." >> database.pl
	echo "" >> database.pl
	

