SndBuf buffer => dac;

"/home/vicentesantos/projects/chucK/terror/data/scream.wav" => buffer.read;
while ( true )
{
  buffer.samples() => buffer.pos;
  0 => buffer.pos;
  10000::ms => now;
}
