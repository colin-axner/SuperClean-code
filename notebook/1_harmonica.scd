// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("~/music/samples/harmonica/marineband/a/cross")
)

/*
    Wanted to go back to playing with harmonica sounds. Using my modified marine band A harp. 
    Marine bands use wooden combs so it has a distinctive sound. I also retuned mine from A
    minor to A major. Some of my notes are probably out of tune. 
*/ 

// Controllers
Pdef(\001).play(quant:1); 
Pdef(\001).stop; 

(

~rps = Pseq([1/2, 1/3, 1/6], inf).asStream;

Pdef(\001, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \cross,

	rps: Pstutter(Pfunc({~rps}).reciprocal, Pfunc({~rps}).reciprocal, inf), 
	dur: Pstutter(Pkey(\rps), Pkey(\rps).reciprocal, inf), 
	num: Pstutter(Pkey(\rps), Pwrand2([[0, 9],  [1, 7],  [12, 14, 16]], [3, 3,  9], inf), inf),
//	num: [1, 7, 14], 
	lpf: 4000, 
	lhf: 0.25, 
	hpf: 25, 
	dst: 0.2, 
	lag: 1/2, 
	crv: -8, 
	atk: 1/6, 
	hld: 8/3, 
	rel: 1/3, 
	degree: Pstutter(Pkey(\rps), Pshuf((-8, -6 .. 8), 3), inf), 
	scale: Scale.harmonicMinor, 

	// common parameters
	legato: Pkey(\rps)+1,
	sustain: 1, 
	amp: Pexprand(0.35, 0.45),
	spd: 1, 
	pan: Pwhite(0.00, 1.0), 
    ])
).play(quant:1);


Pdef(3,
    Pbind(*[
        type: \cln,
        snd: \hat,
        amp: Pstutter(Pexprand(1, 3), Pexprand(1.5, 3.5)),
        dur: 4,
        lhf: Pexprand(0.15, 0.25),
        hpf: 400,
    ])  
).play(quant: 1); 


)

Scale.directory
