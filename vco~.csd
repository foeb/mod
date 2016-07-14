<CsoundSynthesizer>
<CsOptions>
</CsOptions>
; ============================================================================
<CsInstruments>

sr     = 44100
ksmps  = 16
nchnls = 3
0dbfs  = 1

instr 1
  kfreq invalue "freq"
  kfine invalue "fine"
  kfreq cpsmidinn kfreq + kfine/32
  kamp  invalue "amp"
  kpw   invalue "pw"      ; pulse width between 1 and 256

  asin  oscili kamp, kfreq
  asaw  vco2 kamp, kfreq, 4, kpw
  apul  vco2 kamp, kfreq, 2, kpw
        outs asin, asaw, apul
endin

</CsInstruments>
; ============================================================================
<CsScore>
i1 0 36000
</CsScore>
</CsoundSynthesizer>

