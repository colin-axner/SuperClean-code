// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("~/music/samples/fieldrecordings/windchimes")
)

/*
    Inspired by ...

*/ 

// Controllers
Pdef(\001).play(quant:1); 
Pdef(\002).stop; 
Pdef(\001).stop; 

(
Pdef(\001, 
    Pbind(*[
	// basic setup
	type: Prand([\cln, \r, \r], inf), 
	snd: \windchimes,
	num: 0, 
    bgn: Pwhite(0.0, 1.0), 
    amp: -5.dbamp, 
    pan: Pwhite(0.0, 1.0), 

//        cav: 0.33498, 
 //       cvt: 0.3,  
 

	// common parameters
    lpf: Pwhite(500, 20000), 
	dur: Pwhite(1, 3), 
    legato: Pwhite(1, 10), 
    atk: 2, 
    hld: 2, 
    rel: 10, 
	spd: Pbrown(1/2, 5, 0.05, inf) * Pwrand2([-1, 1], [1, 10], inf), 
 //   cav: 0.2, 
  //  aux: 1, 
    ])
);

Pdef(\002, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \windchimes,
	num: 0, 
    bgn: Pwhite(0.0, 0.8), 
    amp: 8.dbamp, 

	// common parameters
	dur: Pwhite(10, 15).trace, 
    legato: Pwhite(10, 15), 
	spd: Pwhite(1/4, 1/2),  

    atk: Pwhite(1, 50).trace, 
    hld: 30/Pkey(\atk), 
    rel: Pwhite(5, 15), 
    crv: 3, 
//    cav: 0.2, 
    ])
).play(quant:1);

)

