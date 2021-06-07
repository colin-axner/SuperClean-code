// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("~/music/samples/harmonica/marineband/a/octaves");
~clean.loadSoundFiles("~/music/superclean/samples/fieldrecordings/random");
~clean.loadSoundFiles("~/music/samples/percussion/bongos");
~clean.loadSoundFiles("~/music/samples/voice");
~clean.loadSoundFiles("~/music/samples/lng");
)

/*
    Inspired by my custom marine band tuned to A from Am by hand. Wood comb sanded down for comfortability. Sampled using octaves

*/ 

// Controllers
Pdef(\001).play(quant:1); 
Pdef(\001).stop; 
Pdef(\002).play(quant:1); 
Pdef(\002).stop; 



(
Pdef(\001, 
    Pbind(*[	    
	// basic setup
	type: \cln,
	snd: \octaves,
	num: Prand([[0], [1], [4], [6], [3]], inf), 

	// common parameters
	dur: Plprand(0.25, 20.0), 
	amp: Plprand(0.3, 0.4), 
	atk: 10, 
	hld: 2, 
	rel: 10, 

	hal: 1, 
	rts: 3, 
//	fsm: Plprand(-4, 4), 
//	shp: -8, 
	crv: Pser([4, -4, 1, 3, -2, 10], inf),
//	lpq: 10000, 
	ocu: Pwhite(0, 3), 
	spd: (0.25, 0.2506 .. 0.26)-0.03, 

//	lpf: 200, 
	pan: Pseg(Pwhite(0.0, 1.0), Pwhite(20.0, 30.0), \wel, inf), 
	legato: 8, 
	aux: 0, 
    ])
).play(quant:1);
Pdef(\002, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \bongos,
	num: Pwhite(0, 15), 
	spd: Pwhite(0.25, 2.0), 

	dur: Pbjorklund2(Pxshuf([7, 9, 11, 13, 15], inf), 16, inf)/Pwhite(3, 8), 
	aux: 1, 
	pan: Pwhite(0.0, 1.0), 

        ])
    );
)


    
