configuration seg7_conf of seg7 is
for useseg2
	for m1,m2: s7 use entity work.sevsegv(behave1);
	end for;
	
	for others : s7 use entity work.sevsegv(behave2);
	end for;
end for;
end configuration seg7_conf;

