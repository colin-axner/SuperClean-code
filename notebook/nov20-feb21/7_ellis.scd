// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("~/music/samples/artists/junior")
)

/*
    common constructions I like to use
*/ 

// Controllers
Pdef(\001).play; 
Pdef(\001).stop; 


(
Pdef(0,  
    Pbind(*[
        type: \cln,
        rps: Pwhite(1,3),
        snd: \junior,
    	num: 0, 
	dur: 100, 

//    	dur: 1/512, 
	rev: 0.95, 
	rin: Pdup(512*5, Pseq([0.2, Pseq([0], inf)],inf )).trace, 
 //       bgn: Pdup(Pkey(\rps),Pseq((0.0,0.000014..1.0),inf)),
  //      legato: 128.0, 
   //     atk: Pkey(\dur)/2*Pkey(\legato),
    //    rel: Pkey(\dur)/2*Pkey(\legato),
     //   crv: -8,
      //  amp: 1,
//	lpf: 1500, 
//	hpf: 50, 
   	spd: 0.5, 
    ])
).play(quant:1);

)

