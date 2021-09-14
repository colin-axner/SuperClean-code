(
~clean.loadSoundFiles("/home/bartleby/music/samples/free") // this is ok to change
)

/*
    Initial inspiration https://www.plasbodfa.com/sounds-for-an-empty-house-open-call
    recording in folder #3 was used for construction of the piece.

    Composition is intended for any improvised recording of any length. 
*/ 
(
Pdef(\001).stop; 
Pdef(\002).stop; 
)

(
~dup = Pbrown(5, 13, Prand((2, 4 .. 8), inf), inf).asStream;
~amp = Pexprand(-5.dbamp, 0.dbamp).asStream;  // this is ok to change


Pdef(\001, 
    Pdup(Pseq([~dup, 1], inf),
    Pbind(*[
        type: Pseq([\cln, \r], inf), 
        num: Pwhite(0, 10), 
        snd: \free,
        bgn: Pwhite(0.0, 1.0), // this is ok to change


        dur: (Pwhite(0.5, 5) / ~dup * 6), 
        atk: Pwhite(0.1, 4), 
        hld: 0.001, 
        rel: Pwhite(0.5, 4), 
        crv: -8, 
        spd: Pwrand2([Pexprand(0.1501, 0.5), Pexprand(0.5, 1)], [4, 1], inf).trace, // the lower bound in first Pexprand may be changed


        amp: ~amp,
        dla: 0.1, 
        legato: Pkey(\dur).linlin(0.5, 5, 20, 2),


        hpf: Pwhite(0, 50), 
        lpf: Pwhite(1000, 20000), 
        dst: Pwhite(0.00001, 0.06) * Pwrand2([0, 1], [4, 1], inf),  


        cav: 0.33498, 
        cvt: 0.3, 
    ])
)).play(quant:1);

Pdef(\002, 
    Pbind(*[
        type: \cln,
        snd: \free,
        num: Pwhite(0, 10), 
        bgn: Pwhite(0.0, 1.0), // this is ok to change


        dur: ~dup * Pwhite(0.4, 1), 
        atk: Pwhite(1, 5), 
        hld: 4, 
        rel: Pkey(\atk),
        crv: -8, 
        spd: Pexprand(0.1001, 8) * Pwrand2([1, -1], [4, 1], inf), // the Pexprand may be changed to Pwhite 


        amp: ~amp, 
        legato: 10, 

        fsh: Pwhite(1, 10), 
        fsm: Pwrand2([0, Pwhite(1, 4)], [4, 1], inf), 

        hpf: Pwhite(0, 50), 
        lpf: Pwhite(1000, 20000),   

        pan: Pseg(Pwhite(0.0, 1.0), 5, \wel, inf), 
        cav: 0.33498, 
        cvt: 0.3, 
    ])
).play(quant:1);
)

