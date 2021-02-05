(
~clean.loadSoundFiles("~/music/samples/guitar");
~clean.loadSoundFiles("~/music/samples/percussion/singingbowl");
~clean.loadSoundFiles("~/music/samples/percussion/tamborine");
~clean.loadSoundFiles("~/music/samples/voice");
~clean.loadSoundFiles("~/music/samples/fieldrecordings/metro");
)

/* 
    Inspired by the greyness of my life during covid. 
*/

Pdef(\002).play; // grey
Pdef(\010).play; // ibc
Pdef(\004).play; // metro
Pdef(\005).play; // singing bowl
Pdef(\004).stop; // metro


// end
(
Pdef(\010).stop;
Pdef(\012).play;
Pdef(\002).stop;
Pdef(\004).stop;
)


// foundation of greyness
(
Pdef(\002,
    Pbind(*[
        type: \cln,
        snd: \guitar,
        num: 0,
	bgn: 0.15,
	dur: 2,
	amp: 2,
	spd: 0.56,
	degree: Pseq([0, 4], inf),
	hld: 1, // opt
	// hpf good ending?
	dlt: 0.1, 
    ])
);

// the interblockchain communication protocol is an end to end connection orientated 
// https://media.githubusercontent.com/media/cosmos/ics/master/papers/2020-05/build/paper.pdf
// record yourself reading the first few pages and insert the recording below.
Pdef(\010,
    Pbind(*[
        type: \cln,
        snd: \voice,
        num: 0,
	dur: 10,
	bgn: Pexprand(0.01, 1.00).trace,
	amp: Pexprand(0.5, 1.0), 
	pan: 0, 
	cut: 0.85, 
	spd: Pexprand(0.5, 1.5), 
    ])
);



// attempts of concentration
Pdef(\005,
    Pbind(*[
        type: \cln,
        snd: \singingbowl,
        num: Pseq([0], 1),
	dur: 2,
	amp: 1.5, 
	spd: -0.3, 
    ])
);

// attempts of equanimity 
Pdef(\004,
    Pbind(*[
        type: \cln,
        snd: \metro,
	dur: 110,
	pan: 0.7, 
	amp: 1, 
     ])
);

Pdef(\006,
    Pbind(*[
        type: \cln,
        snd: \tamborine,
        num: Pseq([1], 1),
	dur: 10,
	amp: 1, 
	pan: 1, 
	spd: 1, 
    ])
);



// ending
Pdef(\012,
    Pbind(*[
        type: \cln,
        snd: \voice,
        num: Pseq([0], 1),
	dur: 10,
	bgn: 0.49178910461703,
	amp: Pexprand(0.6, 1.0), 
	pan: 0, 
	cut: 0.85, 
	spd: 1, 
    ])
);
)



