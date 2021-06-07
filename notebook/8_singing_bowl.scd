// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("~/music/samples/guitar/bowl");
~clean.loadSoundFiles("~/music/samples/guitar/match");
~clean.loadSoundFiles("~/music/superclean/samples/fieldrecordings/random");
)

/*
Inspired by ...

*/ 

// Controllers
Pdef(\002).play(quant:1); 
Pdef(\002).stop; 

(
Pdef(\001, 
    Pbind(*[
        // basic setup
        type: Pwrand2([\cln, \r], [1, 1], inf) ,
        snd: \bowl,
        num: Pwhite(1, 7).trace, 

        // common parameters
        dur: Pwhite(0.3, 20), 
        atk: Pwhite(20, 50), 
        hld: 0, 
        rel: Pwhite(20, 50), 
        legato: 7, 
        //	hal: 1, 
        //	rts: 2, 
        dark: 0.5, 
        pan: Pwhite(0.0, 1.0), 

        spd: Pwhite(0.1, 2.0).trace,
        amp: Phprand(1, 1.5) 
        / Pkey(\spd).linlin(0.1, 2.0, 1.0, 1.5),  
        aux: 2, 
    ])
).play(quant:1);

Pdef(\002, 
    Pbind(*[
        // basic setup
        type: \cln, 
        snd: \match, 
        num: 0, 
        dur: Pwhite(40, 80), 

        atk: Pwhite(40, 80), 
        hld: 0, 
        rel: Pwhite(40, 80), 

        spd: Pwhite(0.25, 1.1), 
        amp: Plprand(0.3, 0.5), 
        aux: 1, 
    ])	
);
)

(
Pdef(0,
    Pseed(949,
        Pbind(*[
            type: \cln,
            snd: \bowl,
            num: 1, 
            spd: Plprand(1/4, 7.0).round(1/7).trace,
            dur: Phprand(10.0, 20.0),
            amp: Plprand(0.1, 0.9) 
            / Pkey(\spd).linexp(1/4, 7.0, 0.5, 6.0) / 2.25,
            bgn: Pwhite(0.0, 0.9),
            atk: Pwhite(5.0, 30.0),
            hld: Pwhite(9.0, 99.0),
            rel: Pwhite(9.0, 99.0),
            pan: Pwhite(0.0, 1.0),
            crv: 8,
            dark: 0.5,
        ])
    )
).play;
)
