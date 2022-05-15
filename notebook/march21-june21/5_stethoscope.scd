// I will try to make all my samples accessible someday, for now, some are hosted 
// in the samples directory in this repository.
(
~clean.loadSoundFiles("~/music/samples/harmonica/turbotwenty");
~clean.loadSoundFiles("~/music/samples/harmonica/stethoscope");
~clean.loadSoundFiles("~/music/samples/harmonica/marineband/a/octaves");
~clean.loadSoundFiles("~/music/samples/harmonica/marineband/a/cross");
~clean.loadSoundFiles("~/music/samples/harmonica/special20/c/growl");
~clean.loadSoundFiles("~/music/samples/harmonica/chrometta");
~clean.loadSoundFiles("~/music/samples/guitar/ebow");
)

/*
Inspired by the new harmonica I got which can connect to a stethoscope!

*/ 

Pdef(\0040).stop; 

Scale.directory;
(
Pdef(\0040, 
    Pbind(*[
        type: Pwrand2([\cln, \r], [1, 0], inf),
        snd: Prand([\stethoscope], inf).trace, 
        // num: Prand([[0], [1], [2]], inf), 
        num: Prand([[0], [1], [2], [4], [5], [6], [0, 1], [0, 2], [1, 2], [0, 1, 5], [0, 1, 6], [5, 6], [4, 6]], inf).trace, 

        // pacing
        dur: Plprand(0.1, 8.0), 
        amp: Pseg(Pbrown(-12.dbamp, 0.dbamp, 0.5.dbamp, inf), Plprand(5.0, 10.0), \sin, inf),
        atk: Pwhite(5, 15), 
        hld: 0, 
        rel: Pwhite(5, 15), 
        sustain: Pkey(\atk)+Pkey(\rel), 

        // texture
        hpf: Pwhite(30, 300).trace, 
        scale: Scale.shang,
        degree: Pwhite(-28, -10).trace, 
                spd: Pn(Plazy { 
            Pif(Pkey(\hpf) > 240, (1.0, 1.0001 .. 1.003), [1]);
        }), 
        bgn: Pwhite(0.0, 0.2), 

        // experimental
        //bpq: 300, 
        //fsh: Pseg(Pwhite(-32,32), Plprand(0.5, 5.0), \sin, inf), 
        //fsm: Pseg(Pwhite(4.0, -4.0), Plprand(0.5, 5.0), \sin, inf) , 
        //ocu: Pwhite(0, 2).trace, 
        //ocu: 2, 

        
        // mood
        // hal: 4, 
        // rts: 3, 
        cav: 0.2,
        cvl: 0.3,

        pan: Pwhite(0.0, 1.0), 
    ])
).play(quant:1);


)


