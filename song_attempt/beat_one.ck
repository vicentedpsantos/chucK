11 => int disks;
200::ms => dur wait;
0 => int STEPS;

Gain g => Pan2 pan => JCRev r => dac;
.5 => g.gain;
.15 => r.mix;

SndBuf pegs[4];

// chuck tries to find these files from the place where it was called smh
"/home/vicentesantos/projects/chucK/song_attempt/data/beat_loop.wav" => pegs[1].read;
"/home/vicentesantos/projects/chucK/song_attempt/data/funky_beat.wav" => pegs[2].read;
"/home/vicentesantos/projects/chucK/song_attempt/data/none.wav" => pegs[2].read;

for( 1 => int i; i < pegs.size(); i++ )
    pegs[i] => g;

fun void hanoi( int num, int src, int dest, int other )
{
    if( num > 1 ) hanoi( num - 1, src, other, dest );

    STEPS++;
    <<< "step", STEPS, " | move disk from peg", src, " -> ", "peg", dest >>>;
    0 => pegs[dest].pos;
    dest - 2 => pan.pan;
    wait => now;

    if( num > 1 ) hanoi( num - 1, other, dest, src );
}

hanoi( disks, 1, 2, 3 );

<<< "done.", "" >>>;

2::second => now;
