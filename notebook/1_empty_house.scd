(
~clean.loadSoundFiles("/home/bartleby/music/samples/emptyhouse")
)

/*
    Inspired by https://www.plasbodfa.com/sounds-for-an-empty-house-open-call
    recording in folder #3

*/ 

// Controllers
Pdef(\001).play(quant:1); 

Pdef(\001).stop; 
Pdef(\002).stop; 

(
Pdef(\001, 

    Pdup(Pwhite(1, 10),
    Pbind(*[
	// basic setup
	type: Pseq([\cln], inf), 
    snd: \emptyhouse,
	num: 0, 
    bgn: Pwhite(0.5, 1.0),
    legato: 5, 

	// common parameters
	dur: 5 / Pwhite(1, 10), 
    atk: 1, 
    hld: 1, 
    rel: 1, 
	spd: 0.25, 
    hpf: 20, 

    amp: 3.dbamp, 

    dark: 1, 
    ])
)).play(quant:1);



Pdef(\002, 
    Pbind(*[
	// basic setup
	type: \cln,
    snd: \emptyhouse,
	num: 0, 
    bgn: Pwhite(0.5, 1.0),
    legato: 5, 

	// common parameters
	dur: Pwhite(1, 15), 
    atk: Pwhite(1, 5), 
    hld: 4, 
    rel: Pkey(\atk),
    crv: -8, 
	spd: Pwhite(0.5, 5) * Prand([1, -1], inf), 
    fsh: Pwhite(1, 10), 
    fsm: Pwhite(1, 4), 


    amp: Pexprand(-6.dbamp, 0.dbamp), 

    pan: Pwhite(0.0, 1.0), 
    dark: 1, 
    ])
).play(quant:1);

)

