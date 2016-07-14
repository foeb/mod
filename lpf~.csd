<CsoundSynthesizer>
<CsOptions>
</CsOptions>
; ============================================================================
<CsInstruments>

sr     = 44100
ksmps  = 16
nchnls = 2
0dbfs  = 1

instr 1
  ainl  inch 1
  ainr  inch 2
  kfco  invalue "fco"
  kres  invalue "res"
  kdist invalue "dist"
  aoutl lpf18 ainl, kfco, kres, kdist
  aoutr lpf18 ainr, kfco, kres, kdist
        out aoutl, aoutr
endin

</CsInstruments>
; ============================================================================
<CsScore>
i1 0 36000
e
</CsScore>
</CsoundSynthesizer>

