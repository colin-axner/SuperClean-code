// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("~/music/samples/artists/leila")
)

/*
    Inspired by ...

*/ 

// Controllers
Pdef(\001).play(quant:1); 
Pdef(\001).stop; 

(
Pdef(\001, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \fmx,
	num: Pseq((5, 6 .. 119), inf).trace, 

	// common parameters
	dur: 1/Pseq([6, 6, 9, 3], inf), 
	amp: Pseq((0.5, 0.502 .. 0.8), inf), 
	hr1: 2, 
	cu1: 10, 
	legato: 2, 
	sustain: 2, 
//	spd: Pdup(24, Pexprand(0.4, 2), inf), 
	dst: Pdup(24, Pwrand2([0, 0.3], [10, 1], inf), inf), 
    ])
).play();
)

