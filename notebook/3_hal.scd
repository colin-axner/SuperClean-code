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
Pdef(\002).stop; 


(
Pdef(\001, 
	Pseed(222, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \ebow,
	num: [2, 3, 4],  // 5 is bad

	// common parameters
	scale: Scale.pelog, 
	dur: 5,  
	atk: 0.1, 
	hld: 3, 
	rel: 2, 
	legato: 2, 
	degree: Pwhite(0, 7), 
	spd: 0.5, 
	amp: 1.5, 
    ])
    )
).play(quant:1);
Pdef(\003, 
	Pseed(222, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \drm,

	// common parameters
	dur: Pseq([1/6, 11/6], inf),  
//	legato: 5, 
	tun: Pdup(12, Pwhite(0, 7)), 
	amp: 0, 
    ])
    )
).play(quant:1);
Pdef(\002, 
	Pseed(222, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \ebow,
	num: [2, 3, 4, 6],  // 5 is bad

	// common parameters
	scale: Scale.pelog, 
	dur: 5,  
	atk: 0.1, 
	hld: 3, 
	rel: 2, 
	legato: 2, 
	degree: Pwhite(0, 7), 
	dark: 0.7, 
	spd: Pseg(Plprand(0.5, 0.52), 5.0, \exp, inf).trace, 
	amp: 1.5, 
	aux: 1, 
    ])
    )
).play(quant:1);

)


	
