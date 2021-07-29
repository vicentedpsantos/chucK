// ChucK is a strongly-timed language,
// meaning time is fundamentally embedded in the language
// a duration of one second
1::second => dur foo;

// a point in time (duration of foo from now)
now + foo => time later;

// Durations can be used to construct
// new durations, which can then be used
// to inductively construct yet another
// duration
.5::second => dur quarter;
4::quarter => dur whole;

// By default ChucK provides these preset
// duration values:
// - samp -> duration of 1 sampel in ChucK time
// - ms
// - second
// - minute
// - hour
// - day
// - week

// the duration of half a sample
.5::samp => dur foo;

// 20 weeks
20::week => dur waithere;

// use in combination
2::minute + 30::second => dur bar;

// same value as above
2.5::minute => dur bar;

// Time arithmetic
    // time + dur yields time
    now + 10::second => time later;

    // time - time yields dur
    later - now => dur D;

    // dur + dur yields dur
    10::second + 100::samp => dur foo;

    // dur - dur yields dur
    10::second - 100::samp => dur bar;

    // dur / dur yields number
    10::second / 20::ms => float n;

     // time mod dur yields dur
     now % 1::second => dur remainder;

    // synchronize to period of .5 second
    .5::second => dur T;
    T - (now % T) => now;

    // compare time and time
    if( t1 < t2 )
        // do something...

    // compare dur and dur
    if( 900::ms < 1::second )
        <<< "yay!" >>>;

// Advancing time by duration
  // advance time by 1 second
  1::second => now;

  // advance time by 100 millisecond
  100::ms => now;

  // advance time by 1 samp (every sample)
  1::samp => now;

  // advance time by less than 1 samp
  .024::samp => now;

// Advancing time by absolute time
  // figure out when
  now + 4::hour => time later;

  // advance time to later
  later => now;
