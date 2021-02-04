(
~clean.loadSoundFiles("~/music/samples/guitar");
~clean.loadSoundFiles("~/music/samples/percussion/singingbowl");
)

/* 
    Inspired by the greyness of life during covid. 
      work-in-progress
*/

Pdef(\003).play;
Pdef(\003).stop;

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
).play(quant:1);
)


(
Pdef(\005,
    Pbind(*[
        type: \cln,
        snd: \singingbowl,
        num: Pseq([0], 1),
	dur: 2,
	amp: 1.5, 
	pan: 0, 
	spd: 0.6, 
    ])
).play(quant:1);
)


