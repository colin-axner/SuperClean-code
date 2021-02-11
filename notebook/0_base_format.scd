// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("~/music/samples/")
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
	snd: \mmd,
	num: 0, 

	// common parameters
	dur: 3, 
	spd: 1, 
    ])
);
)

