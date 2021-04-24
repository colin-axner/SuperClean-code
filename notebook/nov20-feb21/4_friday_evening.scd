(
~clean.loadSoundFiles("/run/user/1000/gvfs/smb-share:server=valv,share=musik/samples/harmonica/special20/c/011821");
~clean.loadSoundFiles("~/music/superclean/samples/fieldrecordings/random");
)

// No particular inspiration here, just wanted to continue exploration 

Pdef(\001).play;
Pdef(\001).stop;

Pdef(\002).play;
Pdef(\002).stop;

(
Pdef(\001,
    Pbind(*[
        // basic setup
        type: \cln,
        snd: \011821,
        num: 3,
	dur: 1, 
	// dur: 2, // a nice intro 
	amp: 0, 
	degree: Pseq([-5, -6, -7, -8, -9, -10, -11,\Rest, \Rest, \Rest], inf), 
	cut: 1, 
	spd: -0.5, 
	dst: 0.5,
	shp: 0.8,
    ])
).play(quant:1);

// taken from backpacking
Pdef(\002,
	Pbind(*[
		// basic setup
		type: \cln,
		snd: \random,
		num: 0, // ax
		bgn: 0.15,
		end: 0.9,
		amp: 0.6, // lower to 0.8 before using shp, and dst
		amp: 4, // DONT FORGET TO TURN DOWN AMP BEFORE UNCOMMENTING THE BELOW MULTILINE COMMENTS
		amp: 0, 
		lop: 1000,
		cut: 0.7, // stops somethin' from going wild.
		pan: Pseq([0, 1], inf), 

		/*
		// DISTORTIAN TIME
		// some style
		shp: 0.59, 
		dst: 0.5, // this makes it intense
		dla: 0.9, 
		lpf: Pexprand(500, 20000), // mix it up just a tad
		crv: -6, 
		*/

		/* it's all flare
		// go wild
		// spd: 1,
		// dur: 1/3, 
		dur: Pseq([1/2, 1/6, 1/3, 1/3], inf),//  2, 6, 3, 3 or whatever
		scale: Scale.harmonicMinor,
		degree: 5,
		enh: Pseq([Pexprand(0.1, 0.35), Pexprand(0.1, 0.9)], inf), // flare
		rel: 0.3, // release time, make sharp with low
		smr: 0.75,
		*/

		// rmf: 5000,
		// rma: 0.5, 
		// rdf: 2000, 
		// rdt: 0.4, 
		


	])
).play(quant:1);
)




