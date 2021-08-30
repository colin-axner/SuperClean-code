// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("")
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
        rps: Pwhite(1,1),
        snd: \nvr,
        dur: 1/64, 
        bgn: Pdup(Pkey(\rps),Pseq((0.4,0.40001..0.9),inf)).trace,
        legato: 2.0, 
        atk: Pkey(\dur)/2*Pkey(\legato),
        rel: Pkey(\dur)/2*Pkey(\legato),
        crv: 0,
        amp:  1,
        //spd: 0.75,
        //pan: Pseq([0,1],inf),
    ])
).play(quant:1);
)

