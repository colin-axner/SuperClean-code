(
~clean.loadSoundFiles("~/music/superclean/samples/fieldrecordings/random");
)

// This file is initially inspired by a field recording I took while on a solo backpacking trip
// It may include samples from sounds not recorded during that trip'
// 001: ax being swung into wood. I've never chopped wood before. 
Pdef(\001).play;
Pdef(\001).stop;

(
Pdef(\001,
	Pbind(*[
		// basic setup
		type: \cln,
		snd: \random,
		num: 0, // ax
		bgn: 0.15,
		end: 0.9,
		amp: 4, // lower to 0.8 before using shp
		lop: 1000,
		cut: 0.7, // stops somethin' from going wild.

		// some style
		// shp: 0.90,
		// dst: 0.5, // this makes it intense
		// dla: 0.9, 
		// lpf: Pexprand(500, 20000), // mix it up just a tad
		// crv: -6, 

		// go wild
		// spd: 1,
		// dur: 1/3, 
		// dur: Pseq([1/2, 1/6, 1/3, 1/3], inf),//  2, 6, 3, 3 or whatever
		// scale: Scale.harmonicMinor,
		// degree: 5,
		// enh: Pseq([Pexprand(0.1, 0.35), Pexprand(0.1, 0.9)], inf), // flare
		// rel: 0.3, // release time, make sharp with low
		// smr: 0.75,

		// rmf: 5000,
		// rma: 0.5, 
		// rdf: 2000, 
		// rdt: 0.4, 
		


	])
).play(quant:1);

)




