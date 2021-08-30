// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("~/music/samples/harmonica/chrometta")
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
	snd: \chrometta,
	num: Pseq([[19, 22]], 5), // 3, 4, 5, 7s, 8s, 10s, 14, 20, 21, 22

	// common parameters
	dur: 10, 
	bgn: 0.05, 
	amp: 1, 
	legato:1, 
	spd: 0.25, 
    ])
);
Pdef(\002, 
	Pseed(222, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \chrometta,
	num: [17], // 3, 4, 5, 7s, 8s, 10s, 14, 20, 21, 22 // no good - 6

	// common parameters
	dur: Pdup(Pexprand(1, 9), Prand([1/3, 1/6, 1/9, 1/12, 1/16], inf), inf), 
//	degree: Pwhite(-5, 5), 
	atk: 0.1, 
//	dst: Pwrand2([0.05, 0], [1, 5], inf), 
//	hpf: 100, 
	ctv: -8, 
	pan: Pdup(3, Pwhite(0.0, 1.0), inf), 
	hld: 1, 
	rel: 1, 
	sustain: 20, 
	amp: 0.75, 
	hal: Pwhite(0.0, 1.0), 
//	hal: 1, 
	bgn: 0.05, 
	legato:1, 
	spd: Pdup(Pwhite(1, 3), Prand([0.25, 0.5, 0.75,1], inf), inf) + Pwhite(0.0, 0.013), 
    ])
    )
).play(quant:1);
Pdef(\004, // walk with me
	Pseed(222, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \chrometta,
	num: [13, 14, 22], // 3, 4, 5, 7s, 8s, 10s, 14, 20, 21, 22 // no good - 6, 13/14

	// common parameters
	dur: 1, 
//	degree: Pwhite(-5, 5), 
	atk: 0.5, 
	//dst: 0.05, 
	pan: Pwhite(0.0, 1.0), 
	hld: 4, 
	rel: 4, 
	hal: Pwhite(0.5, 1.0), 
	hal: 1, 
	sustain: 20, 
	bgn: 0.05, 
	legato:1, 
	spd: 0.25 + Pwhite(0.0, 0.013), 
//	amp: 0, 
    ])
    )
).play(quant:1);

Pdef(\003, 
	Pseed(222, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \chrometta,
	num: [11, 24, 25], // 3, 4, 5, 7s, 8s, 10s, 14, 20, 21, 22

	// common parameters
	dur: 1, 
	degree: Pwhite(-5, 5), 
	atk: 0.1, 
	hld: 5, 
	rel: 2, 
	sustain: 20, 
	bgn: 0.05, 
	legato:1, 
	spd: 0.25, 
    ])
    )
);


)
(
)
