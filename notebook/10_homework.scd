(
~clean.loadSoundFiles("~/music/samples/")
)

/*
Inspired by ...

*/ 

// Controllers
Pdef(\001).play(quant:1); 
Pdef(\001).stop; 
Pdef(\003).play(quant:1); 
Pdef(\003).stop; 
Pdef(\004).play(quant:1); 
Pdef(\004).stop; 





(
Pdef(\001, 
    Pbind(*[
        type: \cln,
        snd: 'reed',

        dur: Pwhite(5, 10), 
        legato: Pwhite(5, 10), 
        atk: Pwhite(10, 15),
        hld: 0, 
        rel: Pwhite(1, 5),
        lpf: Pwhite(500, 2000), 
        //        lpf: 2000, 
        crv: -8, 
        amp: Plprand(0.4, 0.5), 

        degree: Prand([[-7, -3, 0, 2], [-7, -2, 0, 3], [-7, -1, 1, 4]], inf) * Pbrown(Pwhite(-5, 0), Pwhite(2, 8), 1, inf) * (1.0, 1.0005 .. 1.002),
        // degree: [-7, -3, 2, 0] * Pwhite(-2, 7), 
        // ocu: Pwhite(0.0, 4), 
        // ocd: Pwhite(0.0, 2), 

        dark: 0.6, 
    ])
).play(quant:1);
Pdef(\003, 
    Pbind(*[
        type: \cln,
        snd: Pwrand2(['sin', 'r'], [1, 3], inf),

        dur: 1/3, 
        legato: Pwhite(2, 10), 
        atk: 0.2,
        hld: 1, 
        rel: 0.2,
        crv: -8, 
        amp: Pseg(Pwhite(0.4, 0.6), Pwhite(10, 20), \sin, inf), 

        rest: 0, 
        sh:Pwhite(0.0, 13), 
        fsh: Pwrand2([Pkey('rest'), Pkey('sh')], [3, 1],  inf),
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



// http://sccode.org/1-51m with very small modifications
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

// original
// http://sccode.org/1-51m
(
SynthDef(\organ_reed, {
    //Reed Organ Simulation
    |out = 0, freq = 440, amp = 0.1, gate = 1, attack = 0.3, release = 0.3|
    var snd, blow;
    freq = freq.clip(20, 20000);
    // pulse with modulating width
    snd = Pulse.ar((Rand(-0.03, 0.05) + freq.cpsmidi).midicps, 0.48 + LFNoise1.kr(0.06, 0.1), 0.2);
    // add a little "grit" to the reed
    snd = Disintegrator.ar(snd, 0.5, 0.7);
    // a little ebb and flow in volume
    snd = snd * LFNoise2.kr(5, 0.05, 1);
    // use the same signal to control both the resonant freq and the amplitude
    blow = EnvGen.ar(Env.asr(attack, 1.0, release), gate, doneAction: 2);
    snd = snd + BPF.ar(snd, blow.linexp(0, 1, 2000, 2442), 0.3, 3);
    // boost the high end a bit to get a buzzier sound
    snd = BHiShelf.ar(snd, 1200, 1, 3);
    snd = snd * blow;
    Out.ar(out, Pan2.ar(snd, 0, amp));

    //By Nathan Ho aka Snappizz
    //http://sccode.org/1-51m
}).add;

SynthDef(\organ_donor,{|out= 0 freq = 440 amp = 0.2 gate=1 lforate = 10 lfowidth= 0.0 cutoff= 100 rq=0.5 pan=0.0|

    //Simulation of transistor organ from Steal This Sound
    var vibrato, pulse, filter, env;

    vibrato = SinOsc.ar(lforate,Rand(0,2.0));

    //up octave, detune by 4 cents
    //11.96.midiratio = 1.9953843530485
    //up octave and a half, detune up by 10 cents
    //19.10.midiratio = 3.0139733629359

    //Pulse version
    //pulse = Mix(Pulse.ar(([1,1.9953843530485,3.0139733629359]*freq)*(1.0+(lfowidth*vibrato)),Rand(0.4,0.6)!3,[1.0,0.7,0.3]))*0.5;

    //better alternative
    pulse = Mix(VarSaw.ar(([1,1.9953843530485,3.0139733629359]*freq)*(1.0+(lfowidth*vibrato)),Rand(0.0,1.0)!3,Rand(0.3,0.5)!3,[1.0,0.7,0.3]))*0.5;

    filter = RLPF.ar(pulse,cutoff,rq);

    env = EnvGen.ar(Env.adsr(0.01,0.5,1.0,0.5),gate,doneAction:2);

    Out.ar(out,Pan2.ar(filter*env*amp,pan));

    //By Nick Collins, from Mitchell Sigman (2011) Steal this Sound
    //http://www.sussex.ac.uk/Users/nc81/index.html
}).add;
SynthDef(\organ_tonewheel4,{|out= 0 freq = 440 amp = 0.1 gate=1 lforate = 4.85 lfowidth= 0.1 cutoff= 5000 rq=0.25 pan = 0.0|
    //Subtractive tonewheel organ from Steal this Sound example
    var lfo, pulse, filter, env;

    lfo = LFTri.kr(lforate*[1,1.01],Rand(0,2.0)!2);

    pulse = Pulse.ar( (((freq*[1,3]).cpsmidi) + (lfo*lfowidth)).midicps,[0.5,0.51],[0.4,0.6]);

    env = EnvGen.ar(Env.adsr(0.0,0.0,1.0,0.1),gate,doneAction:2);

    filter = BLowPass4.ar(pulse,cutoff,rq);

    filter= BPeakEQ.ar(filter,500,1.0,3);

    Out.ar(out,Pan2.ar(Mix(filter)*env*amp,pan));

    //By Nick Collins, from Mitchell Sigman (2011) Steal this Sound
    //http://www.sussex.ac.uk/Users/nc81/index.html
}).add;
SynthDef(\organ_tonewheel3, {
    //subtractive tonewheel organ with more CPU usage
    arg freq = 440, amp = 0.9, atk = 0.001, sus = 0.4, rel = 0.1, vrate = 6, vdepth = 0.02, vdelay = 0.1, vonset = 0, vrateVariation = 0.1, vdepthVariation = 0.1, rq =1;
    var sig, env, vibrato;
    env = EnvGen.ar(Env.linen(atk, sus, rel, 0.5), doneAction: Done.freeSelf);
    vibrato = Vibrato.kr(DC.kr(freq), DC.kr(vrate), DC.kr(vdepth), DC.kr(vdelay), DC.kr(vonset), DC.kr(vrateVariation), DC.kr(vdepthVariation));
    sig = LFPulse.ar(freq, 0, 0.5, 0.2) + LFPulse.ar(freq + vibrato, 0, 0.18);
    sig = BLowPass4.ar(sig, ((28.midiratio) * (freq)) , rq) ;

    sig = sig * env;
    sig = sig * amp;
    sig = LeakDC.ar(sig);
    Out.ar(0, sig!2);

    //By Zé Craum
}).add;
SynthDef(\organ_tonewheel2, {
    //subtractive tonewheel organ with cheap CPU usage
    arg freq = 440, amp = 0.9, atk = 0.001, sus = 0.4, rel = 0.1, tune = 0.29, tuneRate = 6.0, rq = 1;
    var sig, env, vibrato;
    env = EnvGen.ar(Env.linen(atk, sus, rel, 0.5), doneAction: Done.freeSelf);
    vibrato = SinOsc.ar(tuneRate).range(freq, freq * (tune.midiratio));
    sig = LFPulse.ar(freq, 0, 0.5, 0.2) + LFPulse.ar(freq + vibrato, 0, 0.18);
    sig = RLPF.ar(sig /*+ PinkNoise.ar(20/freq) */, ((28.midiratio) * (freq)) , rq) ;

    sig = sig * env;
    sig = sig * amp;
    sig = LeakDC.ar(sig);
    Out.ar(0, sig!2);
    //By Zé Craum
}).add;
SynthDef(\organ_tonewheel1, {
    //additive tonewheel organ with more CPU usage

    arg freq = 440, amp = 0.7, atk = 0.001, sus = 0.2, rel = 0.01, pan = 0,
    bass = 1, quint = 1, fundamental = 1, oct = 1, nazard = 1, blockFlute = 1, tierce = 1, larigot = 1, sifflute = 1, //organ voices (drawbars) amplitudes
    vrate = 3, vdepth = 0.008, vdelay = 0.1, vonset = 0, vrateVariation = 0.1, vdepthVariation = 0.1; //vibrato arguments
    var sig, env, vibrato;

    vibrato = Vibrato.kr(DC.kr(freq), DC.kr(vrate), DC.kr(vdepth), DC.kr(vdelay), DC.kr(vonset), DC.kr(vrateVariation), DC.kr(vdepthVariation));
    env = EnvGen.ar(Env.linen(atk, sus, rel), doneAction: Done.freeSelf);
    sig = DynKlang.ar(`[[1/12,  1/7, 1, 12, 19, 24, 28, 31, 36].midiratio, ([DC.ar(bass) , DC.ar(quint), DC.ar(fundamental), DC.ar(oct), DC.ar(nazard), DC.ar(blockFlute), DC.ar(tierce), DC.ar(larigot), DC.ar(sifflute)].normalizeSum), nil], vibrato);

    sig = sig * env;
    Out.ar(0, Pan2.ar(sig, pan, amp));
    //By Zé Craum
}).add;
SynthDef(\organ_tonewheel0, {
    //additive tonewheel organ with few CPU usage

    arg freq = 440, amp = 0.7, atk = 0.001, sus = 0.2, rel = 0.01, pan = 0,
    bass = 1, quint = 1, fundamental = 1, oct = 1, nazard = 1, blockFlute = 1, tierce = 1, larigot = 1, sifflute = 1, //organ voices (drawbars) amplitudes
    vrate = 3, vdepth = 0.008; //vibrato arguments
    var sig, env, vibrato;

    vibrato = SinOsc.kr(DC.kr(vrate)).range(1 - DC.kr(vdepth), 1+ DC.kr(vdepth));
    env = EnvGen.ar(Env.linen(atk, sus, rel), doneAction: Done.freeSelf);
    sig = DynKlang.ar(`[[1/12,  1/7, 1, 12, 19, 24, 28, 31, 36].midiratio, ([DC.ar(bass) , DC.ar(quint), DC.ar(fundamental), DC.ar(oct), DC.ar(nazard), DC.ar(blockFlute), DC.ar(tierce), DC.ar(larigot), DC.ar(sifflute)].normalizeSum), nil], vibrato * freq);

    sig = sig * env;
    Out.ar(0, Pan2.ar(sig, pan, amp));
    //By Zé Craum
}).add;
SynthDef(\harpsichord_simple, { arg out = 0, freq = 440, amp = 0.1, pan = 0;
    var env, snd;
    env = Env.perc(level: amp).kr(doneAction: 2);
    snd = Pulse.ar(freq, 0.25, 0.75);
    snd = snd * env;
    Out.ar(out, Pan2.ar(snd, pan));

    //Simple and light harpsichord
    //By Bruno Ruviaro
    //https://github.com/brunoruviaro/SynthDefs-for-Patterns/blob/master/harpsichord.scd
}).add;


SynthDef(\bell_tubular, {
    |freq = 440, t60=9, pitchy=1, amp=0.25, gate=1, pan = 0|
    var sig, exciter;
    exciter = WhiteNoise.ar() * EnvGen.ar(Env.perc(0.001, 0.05), gate) * 0.25;
    sig = DynKlank.ar(
        `[
            [1, 2, 2.803, 3.871, 5.074, 7.81, 10.948, 14.421],   // freqs
            [1, 0.044, 0.891, 0.0891, 0.794, 0.1, 0.281, 0.079], // amplitudes
            [1, 0.205, 1, 0.196, 0.339, 0.047, 0.058, 0.047]*t60     // ring times
        ],
        exciter,
        freqscale: freq);
        DetectSilence.ar(sig, 0.001, 0.5, doneAction:2);
        Out.ar(0, Pan2.ar(sig, pan, amp));
        //This is the same used for glockenspiel, xylophone, marimba and regular bell, what changes is only the ring time t60
        //By nicolaariutti and edited by Zé Craum
        //	http://sccode.org/1-5ay#c835
    }).add;
    SynthDef(\marimba, {
        |freq = 440, t60=0.5, pitchy=1, amp=0.25, gate=1, pan = 0|
        var sig, exciter;
        exciter = WhiteNoise.ar() * EnvGen.ar(Env.perc(0.001, 0.05), gate) * 0.25;
        sig = DynKlank.ar(
            `[
                [1, 2, 2.803, 3.871, 5.074, 7.81, 10.948, 14.421],   // freqs
                [1, 0.044, 0.891, 0.0891, 0.794, 0.1, 0.281, 0.079], // amplitudes
                [1, 0.205, 1, 0.196, 0.339, 0.047, 0.058, 0.047]*t60     // ring times
            ],
            exciter,
            freqscale: freq);
            DetectSilence.ar(sig, 0.001, 0.5, doneAction:2);
            Out.ar(0, Pan2.ar(sig, pan, amp));
            //This is the same used for glockenspiel, xylophone, marimba and regular bell, what changes is only the ring time t60
            //By nicolaariutti and edited by Zé Craum
            //	http://sccode.org/1-5ay#c835
        }).add;

        SynthDef("flute_waveguide", { arg scl = 0.2, freq = 440, ipress = 0.9, ibreath = 0.09, ifeedbk1 = 0.4, ifeedbk2 = 0.4, dur = 1, gate = 1, amp = 0.4;

            var kenv1, kenv2, kenvibr, kvibr, sr, cr, block;
            var poly, signalOut, ifqc;
            var aflow1, asum1, asum2, afqc, atemp1, ax, apoly, asum3, avalue, atemp2, aflute1;
            var fdbckArray;

            sr = SampleRate.ir;
            cr = ControlRate.ir;
            block = cr.reciprocal;

            ifqc = freq;

            // noise envelope
            kenv1 = EnvGen.kr(Env.new(
                [ 0.0, 1.1 * ipress, ipress, ipress, 0.0 ], [ 0.06, 0.2, dur - 0.46, 0.2 ], 'linear' )
            );
            // overall envelope
            kenv2 = EnvGen.kr(Env.new(
                [ 0.0, amp, amp, 0.0 ], [ 0.1, dur - 0.02, 0.1 ], 'linear' ), doneAction: 2
            );
            // vibrato envelope
            kenvibr = EnvGen.kr(Env.new( [ 0.0, 0.0, 1, 1, 0.0 ], [ 0.5, 0.5, dur - 1.5, 0.5 ], 'linear') );

            // create air flow and vibrato
            aflow1 = LFClipNoise.ar( sr, kenv1 );
            kvibr = SinOsc.ar( 5, 0, 0.1 * kenvibr );

            asum1 = ( ibreath * aflow1 ) + kenv1 + kvibr;
            afqc = ifqc.reciprocal - ( asum1/20000 ) - ( 9/sr ) + ( ifqc/12000000 ) - block;

            fdbckArray = LocalIn.ar( 1 );

            aflute1 = fdbckArray;
            asum2 = asum1 + ( aflute1 * ifeedbk1 );

            //ax = DelayL.ar( asum2, ifqc.reciprocal * 0.5, afqc * 0.5 );
            ax = DelayC.ar( asum2, ifqc.reciprocal - block * 0.5, afqc * 0.5 - ( asum1/ifqc/cr ) + 0.001 );

            apoly = ax - ( ax.cubed );
            asum3 = apoly + ( aflute1 * ifeedbk2 );
            avalue = LPF.ar( asum3, 2000 );

            aflute1 = DelayC.ar( avalue, ifqc.reciprocal - block, afqc );

            fdbckArray = [ aflute1 ];

            LocalOut.ar( fdbckArray );

            signalOut = avalue;

            OffsetOut.ar( 0, [ signalOut * kenv2, signalOut * kenv2 ] );

            // Originally found at http://ecmc.rochester.edu/ecmc/docs/supercollider/scbook/Ch21_Interface_Investigations/ixi%20SC%20tutorial/ixi_SC_tutorial_10.html
            //by Wilson, Cottle and Collins
            //also available at Bruno Ruviaro Collection https://github.com/brunoruviaro/SynthDefs-for-Patterns/blob/master/flute.scd
        }).add;
    )
