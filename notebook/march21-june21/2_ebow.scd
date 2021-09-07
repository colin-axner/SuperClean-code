// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("~/music/samples/guitar/ebow");
~clean.loadSoundFiles("~/music/samples/harmonica/special20/c/twosecondhold")
)

/*
    Inspired by ...

*/ 

// Controllers
Pdef(\001).play(quant:1); 
Pdef(\001).stop; 

Pdef(\002).play(quant:1); 
Pdef(\002).stop; 
Pdef(\003).stop; 


(
Pdef(\001, 
	Pseed(222, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \ebow,
	num: [2, 3],  // 5 is bad

	// common parameters
	scale: Scale.pelog, 
	dur: 5,  
	atk: 0.1, 
	hld: 3, 
	rel: 2, 
	legato: 3, 
	sustain: 20, 
	degree: Pwhite(0, 7), 
	spd: 0.5, 
	amp: 1.5, 
    ])
    )
).play(quant:1);

Pdef(\002, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \bow,
	dur: 1,
	scale: Scale.pelog, 
	depgree: Pwhite(0, 7), 
//	freq: Pwhite(100, 500), 
//	degree: Pwhite(0, 7), 	
        sustain: Pexprand(19.0, 60.0),
        legato: Pexprand(19.0, 60.0),
        atk: Pexprand(1.0, 15.0) - 1,
        hld: Pwhite(0.5, 4.0),
        rel: Pwhite(5.0, 10.0),
 

	amp: 0.40, 
	frc: Plprand(1, 15), 
	pos: Phprand(0, 1.0), 
	sustain: 20, 
	bpr: Pseg([1, 1/256], Pwhite(30, 90), \sine, inf), 
    ])
).play(quant:1);

Pdef(\003, 
	Pseed(222, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \ebow,
	num: 0,  // 5 is bad

	// common parameters
	scale: Scale.pelog, 
	dur: 5,  
	atk: 0.1, 
	hld: 3, 
	rel: 2, 
	legato: 1, 
	degree: Pwhite(0, 3).trace, 
	spd: 0.5, 
	amp: 1, 
    ])
    )
).play(quant:1);




)


