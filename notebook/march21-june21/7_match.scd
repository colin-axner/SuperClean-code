// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("~/music/samples/guitar/match");
~clean.loadSoundFiles("~/music/samples/harmonica/marineband/a/octaves");
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
	snd: \match,
	num: 0, 

	// common parameters
	dur: Pwhite(10, 20), 
//	spd: Pwhite(0.05, 1), 
//	spd: Plprand(1/4, 7.0).round(1/7).trace,	
	spd: Pwhite(1/2, 8).trace, 
	spd: 0.1, 
	fsh: Pwhite(0, 32), 
	fsm: Pwhite(0, 2), 
	bgn: Pwhite(0.0, 0.9), 
	atk: Pwhite(0.0, 5), 
        amp: Plprand(0.1, 0.9) 
        / Pkey(\spd).linexp(1/2, 8, 0.5, 6.0) / 2.25,
	amp: 0.5, 
	hld: Pwhite(10, 20), 
	rel: Pwhite(10, 50), 
	hal: 1,  
	rts: 3, 
	pan: Pwhite(0.0, 1.0), 
	ctv: 8, 
    ])
).play(quant:1);

Pdef(\002, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \octaves,
	num: Prand([[0], [1], [4], [6], [3]], inf), 

	// common parameters
	dur: Plprand(0.25, 20.0), 
//	amp: Plprand(0.3, 0.4), 
	atk: 1, 
	hld: Pwhite(5, 20), 
	rel: Pwhite(5, 20), 
	octaves: Pwhite(0, 3), 

	hal: 1, 
	rts: 3, 
//	fsm: Plprand(-4, 4), 
//	shp: -8, 
//	crv: Pser([4, -4, 1, 3, -2, 10], inf),
//	lpq: 10000, 
//	ocu: Pwhite(0, 3), 
	spd: 0.25, 

//	lpf: 200, 
	pan: Pseg(Pwhite(0.0, 1.0), Pwhite(20.0, 30.0), \wel, inf), 
	legato: 8, 
	amp: 0, 
    ])
).play(quant:1);

)
