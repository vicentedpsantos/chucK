// connect sine oscillator to D/A convertor (sound card)
SinOsc s => dac;

// Infinite time loop
while( true )
{
  100::ms => now;
  Std.rand2f(500.0, 1000.0) => s.freq;
}
