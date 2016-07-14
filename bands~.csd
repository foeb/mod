<CsoundSynthesizer>
<CsOptions>
</CsOptions>
; ============================================================================
<CsInstruments>

sr     = 44100
ksmps  = 64
nchnls = 1
0dbfs  = 1

opcode bpbank, a, akkk
  asig, kfreq, kbw, ksep xin
  ksep cpsmidinn ksep
  a0   butbp asig, kfreq + ksep * 0, kbw
  a1   butbp asig, kfreq + ksep * 1, kbw
  a2   butbp asig, kfreq + ksep * 2, kbw
  a3   butbp asig, kfreq + ksep * 3, kbw
  a4   butbp asig, kfreq + ksep * 4, kbw
  a5   butbp asig, kfreq + ksep * 5, kbw
  a6   butbp asig, kfreq + ksep * 6, kbw
  a7   butbp asig, kfreq + ksep * 7, kbw
  a8   butbp asig, kfreq + ksep * 8, kbw
  a9   butbp asig, kfreq + ksep * 9, kbw
  asig sum a0, a1, a2, a3, a4, a5, a6, a6, a7, a8, a9
  asig = asig / 10
  xout asig
endop

instr 1
  asig  inch 1
  kfreq invalue "freq"
  kbw   invalue "bw"
  ksep  invalue "sep"
  aout  bpbank asig, kfreq, kbw, ksep
        outs aout
endin

</CsInstruments>
; ============================================================================
<CsScore>
i1 0 36000
</CsScore>
</CsoundSynthesizer>

