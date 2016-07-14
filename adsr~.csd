<CsoundSynthesizer>
<CsOptions>
</CsOptions>
; ============================================================================
<CsInstruments>

sr     = 44100
ksmps  = 64
nchnls = 1
0dbfs  = 1

instr 1
  agate inch 1
  katk  invalue "atk"   ; attack
  kdec  invalue "dec"   ; decay
  kslev invalue "slev"  ; sustain level
  krel  invalue "rel"   ; release

  katk  init 1
  kdec  init 1
  kslev init 1
  krel  init 1

  klev  init 0          ; current envelope level in [0, 1]
  kdur  init 0          ; how long the note has been held so far
  kprev init 0          ; last nonzero gate level
  idead init 0.05       ; the "deadzone" -- gate levels below this are considered zero

  kgate downsamp agate
  if kgate < idead goto discharge
    kdur = kdur + 1
    kprev = agate

;;;;;;; ADSR state machine: hold ;;;;;;

    if (kdur > katk) goto doneatk
      ktemp divz 1, katk, 0 ; safely divide by zero
      klev  min klev + ktemp, 1
            goto output
  doneatk:
    if (kdur > kdec + katk) goto donedec
      ktemp divz 1 - kslev, kdec, 0 ; safely divide by zero
      klev  max klev - ktemp, kslev
            goto output
  donedec:
    kdur  min kdur, kdec + katk + 1
    klev = (kslev + klev)/2
            goto output

;;;;; ADSR state machine: release ;;;;;;

discharge:
  kdur = 0
  ktemp divz 1, krel, 0 ; safely divide by zero
  klev  max klev - ktemp, 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

output:
        ;printks "    %2.5f%n", 0.1, klev
  aprev upsamp kprev
        out aprev * klev
endin

</CsInstruments>
; ============================================================================
<CsScore>
i1 0 36000
</CsScore>
</CsoundSynthesizer>

