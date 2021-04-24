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

Pdef(\002).play(quant:1); 
Pdef(\002).stop; 
Pdef(\003).stop; 


(
Pdef(\001, 
	Pseed(222, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \ebow,
	num: [2, 3],  // 5 is bad

	// common parameters
	scale: Scale.pelog, 
	dur: 5,  
	atk: 0.1, 
	hld: 3, 
	rel: 2, 
	legato: 3, 
	sustain: 20, 
	degree: Pwhite(0, 7), 
	spd: 0.5, 
	amp: 1.5, 
    ])
    )
).play(quant:1);

Pdef(\002, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \bow,
	dur: 1,
	scale: Scale.pelog, 
	depgree: Pwhite(0, 7), 
//	freq: Pwhite(100, 500), 
//	degree: Pwhite(0, 7), 	
        sustain: Pexprand(19.0, 60.0),
        legato: Pexprand(19.0, 60.0),
        atk: Pexprand(1.0, 15.0) - 1,
        hld: Pwhite(0.5, 4.0),
        rel: Pwhite(5.0, 10.0),
 

	amp: 0.40, 
	frc: Plprand(1, 15), 
	pos: Phprand(0, 1.0), 
	sustain: 20, 
	bpr: Pseg([1, 1/256], Pwhite(30, 90), \sine, inf), 
    ])
).play(quant:1);

Pdef(\003, 
	Pseed(222, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \ebow,
	num: 0,  // 5 is bad

	// common parameters
	scale: Scale.pelog, 
	dur: 5,  
	atk: 0.1, 
	hld: 3, 
	rel: 2, 
	legato: 1, 
	degree: Pwhite(0, 3).trace, 
	spd: 0.5, 
	amp: 1, 
    ])
    )
).play(quant:1);




)

Scale.directory

// an example using bow which is a digital wave guide physical model of a bowed instrument
(
var a = Pwhite(0.0, 0.25).asStream; // you could do a similar thing as above, but with variables
var b = Pwhite(0.75, 1.0).asStream; // what if we wanted to use both these variables on the same key?
Pdef(0,
    Pseed(263,
        Pbind(*[
            type: \cln,
            snd: \bow,
            frc: Pexprand(0.1, 1.0),
            pos: Pexprand(0.07, 0.7),
            octave: Pstutter(Pexprand(1, 5), Pxrand((1 .. 6), inf)),
            scale: Scale.aeolian.tuning_(Tuning.vallotti),
            degree: Pstutter(Pexprand(1, 5), Pxrand((0 .. 7), inf)),
            mtranpose: Pstutter(Pexprand(1, 5), Pxrand((-11 .. 3), inf)),
            amp: Pstutter(2, Pexprand(0.444, 0.66666 / Pkey(\octave).linexp(1, 6, 1, 2))),
            atk: Pexprand(1.0, 15.0) - 1,
            hld: Pwhite(0.5, 4.0),
            rel: Pwhite(5.0, 10.0),
            crv: Pwhite(0.0, 8.0) - Prand([0, 8], inf),
            sustain: Pexprand(19.0, 60.0),
            legato: Pexprand(19.0, 60.0),
            pan: Pseq([Pfuncn({ a.next }, 1), Pfuncn({ b.next }, 1)], inf).trace, // Pfunc let's us weave together two vars
            lhf: Pexprand(0.25, 0.75), // .next moves things along on the recieving end
            bpr: Pseg([1, 1/256], Pwhite(30, 90), \sine, inf),
            dur: 1 / Pwrand2([1/4, 1/2, 1, 2, 4, 5], [8, 6, 4, 2, 1, 1/2], inf),
            dla: 1/64,
            dlf: 0,
            dlt: 16, 
            dark: 1/16,
        ])
    )   
).play(quant:1);
)

