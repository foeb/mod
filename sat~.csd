<CsoundSynthesizer>
<CsOptions>
</CsOptions>
; ============================================================================
<CsInstruments>

sr     = 44100
ksmps  = 16
nchnls = 2
0dbfs  = 1

;; Taken from the Csound manual
gifn ftgen 0,0, 257, 9, .5,1,270,1.5,.33,90,2.5,.2,270,3.5,.143,90,4.5,.111,270

instr 1
  ainl  inch 1
  ainr  inch 2
  kdist invalue "dist"
  aoutl distort ainl, kdist, gifn
  aoutr distort ainr, kdist, gifn
        out aoutl, aoutr
endin

</CsInstruments>
; ============================================================================
<CsScore>
i1 0 36000
e
</CsScore>
</CsoundSynthesizer>

