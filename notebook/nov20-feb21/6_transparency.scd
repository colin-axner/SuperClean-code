// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("~/music/samples/fieldrecordings/harmonica");
~clean.loadSoundFiles("~/music/samples/fieldrecordings/dailylife");
~clean.loadSoundFiles("~/music/samples/fieldrecordings/water");
~clean.loadSoundFiles("~/music/samples/captain");
~clean.loadSoundFiles("~/music/samples/fieldrecordings/metro");
)

/*
    Inspired by a transparent mind, devoid of distraction, filled with color and lightness. 
*/ 

// Controllers
(
Pdef(\003).play(quant:1); 
Pdef(\005).play(quant:1); 
)

// water transition
Pdef(\004).play(quant:1); 
Pdef(\004).stop; 

// harmonica + cars
Pdef(\002).play(quant:1); 
Pdef(\002).stop; 

// metro
Pdef(\006).play(quant:1); 
Pdef(\006).stop; 

// newspapaer
Pdef(\007).play(quant:1); 
Pdef(\007).stop; 


Pdef(\003).stop; 
Pdef(\005).stop; 

(
Pdef(\002, 
    Pbind(*[
    	type: \cln,
    	snd: \harmonica,
    	num: Pseq([0], 1), 

    	dur: 28, 
    	bgn: 0.023, 
    	hpf: 200, 
    	legato:1, 
    	spd: 0.8, 
    	amp: 1.15, 
    ])
);

Pdef(\003, 
    Pbind(*[
    	type: \cln,
    	snd: \dailylife,
    	num: Pseq([0, 1], 1), 

    	dur: Pseq([8, 20], 1), 
    	hpf: 200, 
	legato: 1, 
	bgn: Pseq([0, 0.005], 1),
    	amp: Pseq([2, 1.6], 1), 
    ])
);

Pdef(\004, 
    Pbind(*[
    	type: \cln,
    	snd: \water,
    	num: Pseq([0], inf), 

    	dur: 7.2, 
    	legato:1.3, 
    	amp: 0.8, 
	hpf: 200, 
    ])
);

Pdef(\005, 
    Pbind(*[
	    type: \cln,
	    snd: \captain,
	    num: Pseq([3], inf), 

	    dur: 41.72, 
	    degree: -2, 
	    legato: 1, 
	    bgn: 0.065,
    ])
);

Pdef(\006,
    Pbind(*[
        type: \cln,
        snd: \metro,

    	dur: 110,
    	amp: 1.2, 
     ])
);

// newspaper
Pdef(\007,
    Pbind(*[
        type: \cln,
        snd: \dailylife,
	num: Pseq([2], 1), 

    	dur: 30,
	amp: 1.2, 
	hpf: 200, 
     ])
);
)

