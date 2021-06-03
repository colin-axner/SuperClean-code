// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("~/music/samples/harmonica/turbotwenty");
~clean.loadSoundFiles("~/music/samples/harmonica/stethoscope");
~clean.loadSoundFiles("~/music/samples/harmonica/chrometta");
~clean.loadSoundFiles("~/music/samples/guitar/ebow");
)

/*
    Inspired by the new harmonica I got which can connect to a stethoscope!

*/ 
d = DayTimer(\today);
Quarks.gui
Quarks.install("https://github.com/supercollider-quarks/DayTimer"); 

// Controllers
Pdef(\002).play(quant:1); 
Pdef(\004).stop; 
Quarks.install("https://github.com/supercollider-quarks/Bjorklund");
~clean.modules;

Scale.directory;
(
Pdef(\004, 
    Pbind(*[
	// basic setup
	type: Pwrand2([\cln, \r], [1, 2], inf),
//	type: \cln, 
	snd: \stethoscope,
//	num: Pwhite(0, 6), 
	num: Prand([[0], [1], [2]], inf), 
//	num: Prand([[0], [1], [2], [4], [5], [6], [0, 1], [0, 2], [1, 2], [0, 1, 5], [0, 1, 6], [5, 6], [4, 6]], inf), 
//	num: [6], 

	// common parameters
	dur: Plprand(0.1, 8.0), 
	amp: Pexprand(0.3, 0.5), 
	atk: Pwhite(5, 15), 
	hld: 0, 
	rel: Pwhite(5, 15), 

	hal: 4, 
	rts: 3, 
	hpf: Pwhite(30, 300), 
        scale: Scale.mixolydian,
	pan: Pwhite(0.0, 1.0), 
	degree: Pwhite(-28, -14), 
//	ocu: Pwhite(0, 2).trace, 
//	ocu: 2, 
	spd: Pn(Plazy { 
		Pif(Pkey(\hpf) > 225, (1.0, 1.0001 .. 1.003), [1]);
	}), 
	bgn: Pwhite(0.0, 0.2), 
//	fsh: Pseg(Pwhite(-32,32), Plprand(0.5, 5.0), \sin, inf), 
//	fsm: Pseg(Pwhite(4.0, -4.0), Plprand(0.5, 5.0), \sin, inf) , 
	aux: 0, 
	sustain: 20, 
    ])
).play(quant:1);

Pdef(\003, 
	Pseed(222, 
    Pbind(*[
	// basic setup
	type: \cln,
	snd: \chrometta,
	num: [17], // 3, 4, 5, 7s, 8s, 10s, 14, 20, 21, 22 // no good - 6

	// common parameters
	dur: Pstutter(Pexprand(1, 9), Prand([1/3, 1/6, 1/9, 1/12, 1/16], inf), inf), 
//	degree: Pwhite(-5, 5), 
	atk: 0.1, 
//	dst: Pwrand2([0.05, 0], [1, 5], inf), 
//	hpf: 100, 
	ctv: -8, 
	pan: Pstutter(3, Pwhite(0.0, 1.0), inf), 
	hld: 1, 
	rel: 1, 
	sustain: 20, 
//	lpf: Phprand(500, 3000), 
	amp: 0.55, 
	bgn: 0.05, 
	legato:1, 
	aux: 1, 
	spd: Pstutter(Pwhite(1, 3), Prand([0.25, 0.5, 0.75,1], inf), inf) + Pwhite(0.0, 0.013), 
    ])
    )
);

)


