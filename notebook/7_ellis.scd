// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("~/music/samples/ellis")
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
        snd: \ellis,
	num: 1, 

	dur: 1/64, 
        bgn: Pstutter(Pkey(\rps),Pseq((0.1,0.100004..0.9),inf)),
        legato: 2.0, 
        atk: Pkey(\dur)/2*Pkey(\legato),
        rel: Pkey(\dur)/2*Pkey(\legato),
        crv:  0,
        amp:  1,
	dst: Pwrand2([0, 0.3], [100, 1], inf), 
	hpf: 300, 
	degree: Pstutter(512, Pwhite(-7, 7, inf).trace), 
	spd: 0.5, 
    ])
).play(quant:1);

)

