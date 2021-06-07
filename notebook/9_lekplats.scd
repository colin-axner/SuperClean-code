// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("~/music/samples/")
)

/*
Focus is on building knowledge on synth defs, will browse internet and modify things

*/ 

// Controllers
Pdef(\001).play(quant:1); 
Pdef(\001).stop; 

(
Pdef(\001, 
    Pbind(*[
        type: \cln,
        snd: Prand([\dfd, \sin, \saw, \sqr], inf), 
        snd: \reed, 

        dur: Plprand(0.1, 8.0), 
        //dur: 3, 
        sustain: 20, 
        amp: Plprand(0.3, 0.5), 

//        degree: [-7, -3, 0, 2] * (1.0, 1.00000000000001 .. 1.00000000000009) * Pwhite(-4, 4), 
        degree: [-7, -3, 0, 2] * Pwhite(-7, 7), 

       // ocu: Pwhite(-3, 3), 
        scale: Scale.zamzam,

        atk: Pwhite(5, 10), 
        hld: 0, 
        rel: Plprand(1, 5), 
        crv: -8, 
        pan: Pwhite(0.0, 1.0), 

       dark: 0.2, 
    ])
).play(quant:1);
)

Scale.directory
// http://sccode.org/1-51m
(
SynthDef(\reed, {
    |out = 0, freq = 440, amp = 0.1, gate = 1, attack = 0.3, release = 0.3|
    var snd, blow;
    // pulse with modulating width
    snd = Pulse.ar((Rand(-0.06, 0.05) + freq.clip(20, 20000).cpsmidi).midicps, 0.48 + LFNoise1.kr(0.06, 0.1), 0.2);
    // add a little "grit" to the reed
//        snd = Disintegrator.ar(snd, 0.3, 0.9);
    // a little ebb and flow in volume
    snd = snd * LFNoise2.kr(3, 0.1, 1);
    // use the same signal to control both the resonant freq and the amplitude
    blow = EnvGen.ar(Env.asr(attack, 1.0, release), gate, doneAction: 2);
    snd = snd + BPF.ar(snd, blow.linexp(0, 1, 2000, 2442), 0.3, 3);
    // boost the high end a bit to get a buzzier sound
   // snd = BHiShelf.ar(snd, 1200, 1, 3);
    snd = snd * blow;
    Out.ar(out, Pan2.ar(snd, 0, amp));
}).add;
)
