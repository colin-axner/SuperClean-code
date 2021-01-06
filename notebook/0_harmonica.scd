// TODO: insert location where samples can be retreived 
~clean.loadSoundFiles("~/music/samples/harmonica/special20/c/twosecondhold");
~clean.loadSoundFiles("~/music/samples/harmonica/special20/c/wah");

// This material was inspired by the effort to create sound using only my Special 20 Harmonica in the key of C.
// This was apart of a compositional challenge intended to encourage the exploration of the harmonica in as many ways 
// as I could. 

(
Pdef(\lullaby,
    Pbind(*[
        type: \clean,
        s: \twosecondhold,
        n: Pseq([0,1,2,3,5], inf),
        // freq: 200,
        dur: Pwrand([1/Pstutter(4, Pseq([12,16,20], inf)), Rest(1/8)], [1,1].normalizeSum, inf),
        // lpf: Pexprand(200,1000),
        lpf: Pseq([Pseries(100,2,200)], inf),
        hpf: Pkey(\lpf),
        dlf: 0.94,
        crv: -8,
        gain: Pstutter(10,Pexprand(2,5)),
    ])
).play(quant:1);

Pdef(\cello,
    Pbind(*[
        type: \clean,
        s: \wah,
        n: 0,
        // use 50 as a base frequency, nice sounding
        //  freq: Pseq([50,75,100,125,150,175], inf), // wah
        freq: Pstutter(60, Pseq([33,66,33], inf)),
        dur: 1/Pstutter(60, Pseq([15,20,25], inf)).trace,
        dlf: 0.5,
        dlf: 0.94,
        gain:Pstutter(15,Pexprand(0.1,0.5)),
        hpf: Pstutter(5, Pexprand(200,600)),
    ])
).play(quant:1);
);

Pdef(\cello).play;
Pdef(\cello).stop;

Pdef(\lullaby).play;
Pdef(\lullaby).stop;





