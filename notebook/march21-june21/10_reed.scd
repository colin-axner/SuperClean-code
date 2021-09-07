// http://sccode.org/1-51m with very small modifications
(
SynthDef(\reed, {
    |out = 0, freq = 440, amp = 0.1, gate = 1, attack = 0.3, release = 0.3, ebr = 3, ebm = 0.1, mwr = 0.06, mwm = 0.1|
    var snd, blow;
    // pulse with modulating width
    snd = Pulse.ar((Rand(-0.06, 0.05) + freq.clip(20, 20000).cpsmidi).midicps, 0.48 + LFNoise1.kr(mwr, mwm), 0.2);
    //          add a little "grit" to the reed
    //          snd = Disintegrator.ar(snd, 0.3, 0.9);
    // a little ebb and flow in volume
    snd = snd * LFNoise2.kr(ebr, ebm, 1);
    // use the same signal to control both the resonant freq and the amplitude
    blow = EnvGen.ar(Env.asr(attack, 1.0, release), gate, doneAction: 2);
    snd = snd + BPF.ar(snd, blow.linexp(0, 1, 2000, 2442), 0.3, 3);
    // boost the high end a bit to get a buzzier sound
    //          snd = BHiShelf.ar(snd, 1200, 1, 3);
    snd = snd * blow;
    Out.ar(out, Pan2.ar(snd, 0, amp));
}).add;
) 

// controllers
Pdef(\001).play(quant:1); // plays automatically
Pdef(\001).stop; 
Pdef(\003).play(quant:1); // add when ready
Pdef(\003).stop; 
Pdef(\004).play(quant:1); // add when ready
Pdef(\004).stop; 

(
Pdef(\001, 
    Pbind(*[
        type: \cln,
        snd: 'reed', // initialize the synth at the bottom of this file first

        dur: Pwhite(3, 12), 
        legato: Pwhite(5, 10), 
        atk: Pwhite(10, 15),
        hld: 0, 
        rel: Pwhite(1, 5),
        crv: -8, 

        amp: Pseg(Pbrown(-13.dbamp, -1.dbamp, 0.25.dbamp, inf), Plprand(5.0, 10.0), \sin, inf),
        lhf: Pseg(Phprand(0.1, 0.5), Plprand(15.0, 45.0), \exp, inf),

        degree: Prand([[-7, -3, 0, 2], [-7, -2, 0, 3], [-7, -1, 1, 4]], inf) 
            * Pbrown(Pwhite(-5, 0), Pwhite(2, 8), 1, inf) 
            * (1.0, 1.0005 .. 1.002),

        r: (Pwhite(1, 10) * 3).trace, 
        ebr: Pkey('r'), 
        ebm: (Pwhite(1, 200) / 1000), 
        mwr: Pkey('r') , 
        mwm: (Plprand(1, 200) / 1000), 
        mwm: Pseg(Plprand(0.001, 0.3), 1, \wel, inf),

        dark: 0.6, 
        pan: Pwhite(0.0, 1.0), 
    ])
).play(quant:1);
Pdef(\003, 
    Pbind(*[
        type: \cln,
        snd: Pwrand2(['sin', 'r'], [1, 3], inf), // increase/decrease rest probability

        dur: 1/3, 
        legato: Pwhite(2, 10), 
        atk: 0.2,
        hld: 1, 
        rel: 0.2,
        crv: -8, 
        amp: Pseg(Pwhite(0.4, 0.6), Pwhite(10, 20), \sin, inf), 
        amp: Pseg(Pbrown(-9.dbamp, -0.1.dbamp, 1.dbamp, inf), Plprand(1.0, 5.0), \sin, inf),

        rest: 0, 
        sh:Pwhite(0.0, 13), 
        fsh: Pwrand2([Pkey('rest'), Pkey('sh')], [4, 1],  inf),
        fsm: Pkey('fsh') / Pwhite(3, 5), 

        degree: [-7, -3, 2, 0]*Pbrown(Pwhite(-5, 0), Pwhite(2, 12), 1, inf),

        dark: 0.6, 
        pan: Pwhite(0.0, 1.0), 
    ])
);
Pdef(\004, 
    Pbind(*[
        type: \cln,
        snd: Pwrand2(['drm', 'r'], [1, 3],  inf),

        dur: 1, 
        legato: Pwhite(2, 10), 
        atk: 0.2,
        hld: 1, 
        rel: 0.2,
        crv: -8, 
        amp: Pseg(Pwhite(0.05, 0.1), Pwhite(10, 20), \sin, inf), 
        amp: Pseg(Plprand(-20.dbamp, -10.dbamp), Plprand(1.0, 5.0), \sin, inf),
        fed: Pwhite(0.01, 0.1), 

        rest: 0, 
        sh:Pwhite(0.0, 13), 
        fsh: Prand([Pkey('sh')], inf),
        fsm: Pkey('fsh') / Pwhite(3, 5), 

        degree: [-7, -3, 2, 0]*Pbrown(Pwhite(-5, 0), Pwhite(2, 12), 1, inf),
        dark: 0.6, 
        pan: Pwhite(0.0, 1.0), 
    ])
);
)

/*
    Spent some time tinkering with the reed SynthDef. Got something going. 
    The other patterns kinda go with the reed SynthDef, not entirely. They use the same format, so it works.
    Unfinished. Need to try adding more parameters to control the 'reed'

    No samples needed!
*/ 


