(
~clean.loadSoundFiles("/run/user/1000/gvfs/smb-share:server=valv,share=musik/samples/harmonica/special20/c/011821");
)

// more material using my special 20 c harmonica 
// did some takes aimed on sampling recordings that used more than a single note
// however, single notes are great so some of the recordings included them
// samples were stored in a folder called 011821 for the date taken

Pdef(\001).play;
Pdef(\001).stop;


(
Pdef(\001,
    Pbind(*[
        // basic setup
        type: \cln,
        snd: \011821,
        num: 9,
	dur: 1/3, 

	dst: 0.005,
	amp: 0.3, 
	scale: Scale.harmonicMinor, 
	degree: (Pdup(81, Pexprand(0.001, 1.0), inf)*7)+0+Pseq([0, 3, 0, 0, 3, 3, 0, 0, 4, 3, 0, 0], inf),
	rma: 0.1,
	shp: 0.7,
	spd: 0.09,
	rmf: 3520.00, 
	rdf: 10,
	rdt: Pkey(\dur), 
    ])
).play(quant:1);
)

