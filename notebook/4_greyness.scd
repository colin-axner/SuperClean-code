(
~clean.loadSoundFiles("~/music/samples/guitar");
~clean.loadSoundFiles("~/music/samples/percussion/singingbowl");
~clean.loadSoundFiles("~/music/samples/voice");
~clean.loadSoundFiles("~/music/samples/voice2");
~clean.loadSoundFiles("~/music/samples/fieldrecordings/metro");
)

/* 
    Inspired by the greyness of my life during covid. 
	001 Opening meditation bell
	002 The repetition of unconscious thought (the driftin' mind)
	003 The greyness of covid and the mild tranquility of my mind
	004 "I call tell time passes because the bus continues to come and go"  
	005 Attempts of concentration subverted by the anxious awaiting of the end
	006 The bell has sounded, time to reopen the eyes
*/

Pdef(\001).play; // meditation
Pdef(\001).stop; // meditation
Pdef(\002).play; // ibc
Pdef(\003).play; // grey
Pdef(\004).play; // metro
Pdef(\005).play; // attempts of concentration
Pdef(\005).play; // attempts of concentration


// end early
Pdef(\004).stop; // metro
Pdef(\002).stop;

// end
(
Pdef(\002).stop;
Pdef(\006).play;
Pdef(\003).stop;
Pdef(\004).stop;
)

(
// attempts of concentration
Pdef(\001,
    Pbind(*[
        type: \cln,
        snd: \singingbowl,
        num: Pseq([0], 1),
	dur: 2,
	amp: 1.5, 
	spd: 0.3, 
    ])
);
)

(
// the interblockchain communication protocol is an end to end connection orientated 
// https://media.githubusercontent.com/media/cosmos/ics/master/papers/2020-05/build/paper.pdf
// record yourself reading the first few pages and insert the recording below.
Pdef(\002,
    Pbind(*[
        type: \cln,
        snd: \voice,
        num: 0,
	dur: 10,
	bgn: Pexprand(0.1, 1.00).trace,
	amp: Pexprand(0.5, 1.0), 
	pan: 0, 
	legato: 1, 
	spd: Pexprand(0.5, 1.5), 
    ])
);

// foundation of greyness
// it sounds best if you use this SuperClean commit 681c0c22fbdda76d04e60ffb1f270046ad3f3ee1
Pdef(\003,
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

// attempts of concentration reversed
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

// ending
Pdef(\006,
    Pbind(*[
        type: \cln,
        snd: \voice,
        num: Pseq([0], 1),
	dur: 10,
	bgn: 0.49178910461703,
	amp: Pexprand(0.6, 1.0), 
	pan: 0, 
	legato: 1, 
	spd: 1, 
    ])
);
)

