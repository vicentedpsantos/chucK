//connect a plucked string to the soundcard out
StifKarp inst => dac;

[0,2,3,1,4,2,6,3,4,4] @=> int mel[]; //sequence data

for (0 => int i; true ; i++) { //infinite loop
  std.mtof( 40 + mel[i%mel.cap()] ) => inst.freq; //set the note
  inst.noteOn( 0.5 ); //play a note at half volume
  500::ms => now; //compute audio for 0.3 sec
}
