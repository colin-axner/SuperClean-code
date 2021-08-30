// TODO: insert location where samples can be retreived 
(
~clean.loadSoundFiles("~/music/samples/harmonica/special20/c/twosecondhold");
~clean.loadSoundFiles("~/music/samples/harmonica/special20/c/wah");
~clean.loadSoundFiles("~/music/samples/fieldrecordings/metro");
)


// This material was inspired by the effort to create sound using only my Special 20 Harmonica in the key of C.
// This was apart of a compositional challenge intended to encourage the exploration of the harmonica in as many ways 
// as I could. 

// Pdef's with visual imagery commented before it represent material inspired by footage I was provided by a friend to act as accompanying material.

Pdef(\001).play;
Pdef(\001).stop;

Pdef(\004).play;
Pdef(\004).stop;

(
Pdef(\005).stop;
Pdef(\001).stop;
Pdef(\004).stop;
)

(
Pdef(\005).play;
Pdef(\001).play;
Pdef(\004).stop;
)

// very light
(
Pdef(\001,
    Pbind(*[
        type: \cln,
        snd: \twosecondhold,
        num: Pseq([0,1,2,3,5], inf),
	scale: Scale.harmonicMinor,
	degree: -8, // switch to -8 after train passes
        dur: Pwrand([1/Pdup(4, Pseq([12,16,20], inf)), Rest(1/8)], [1,1].normalizeSum, inf),
        lpf: Pseq([Pseries(150,2,100), Pseries(350, -2, 100)], inf).trace,
        hpf: Pkey(\lpf),
        dlf: 0.94,
        crv: -8,
	amp: 1.3,
	spd: 1,
    ])
);

Pdef(\004,
    Pbind(*[
        type: \cln,
        snd: \metro,
	dur: 110,
	amp: 11, // it's kinda quite
     ])
).play(quant:1);

Pdef(\005,
    Pbind(*[
        type: \cln,
        snd: \metro,
	bgn: 0.55,
	end: 0.9,
	dur: 43,
	amp: 11, // it's kinda quite
     ])
);


// fire blazin' on a monitor
Pdef(\002,
    Pbind(*[
        type: \cln,
	ton: Pseq([0.4], inf).trace,
        snd: \wah,
        num: 0,
	spd: Pexprand(Pkey(\ton), Pkey(\ton)+0.01),
	shp: 0.8,
	dst: 0.77,
	detune: 1.5,
	dur: 1/50,
	crv: -8,
	hpq: 0.5,
        amp: 0.3,
	lpf: 800,
    ])
);

// water pouring profusely through a faucet onto a stainless steal sink
// via black and white footage
Pdef(\003,
    Pbind(*[
        type: \cln,
	ton: Pseq([2.8,1.5,1.2,0.8], inf),
        snd: \wah,
        num: 0,
	spd: Pexprand(Pkey(\ton), Pkey(\ton)+0.01),
	shp: 0.8,
	dst: 0.77,
	detune: 1.5,
	dur: 1/50,
	crv: -8,
	hpq: 0.5,
        amp: 0.3,
	lpf: 800,
    ])
);
);




Pdef(\001).play;
Pdef(\001).stop;

(
Pdef(\003).play;
Pdef(\002).stop;
)
(
Pdef(\002).play;
Pdef(\003).stop;
)
