// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("")
)

/*
    common constructions I like to use
*/ 

// Controllers
Pdef(\001).play; 
Pdef(\001).stop; 

(
// dynamic sampling?
//
// The initial idea is creating the ability to play through
// a song (say 3-4 minutes) and adjust parameters dynamically
// without interrupting the playback of the song. Normally the 
// dur parameter would cause the sample to be replayed again 
// from bgn (default: 0 [start]), but I'd like to adjust the 
// bgn parameter by dur in order to begin playback exactly 
// where I left off. This would allow me to change parameters 
// like amp or pan while the song is being played.
Pdef(\001,  
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \mmd,
	num: 12, 

	total: 1/10, // total file length in seconds

	dur: 1/100, 

	bgn: 0,  
//	test: ((Pkey(\total)/Pkey(\dur)).round).trace, // use for Pseries repeats argument, doesn't work as decimal
	bgn: Pseq([Pseries(0, Pkey(\dur), 100).trace], inf), 
//	legato: 1, 
])
).play;
)
