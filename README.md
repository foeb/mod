This is a collection of pd/csound patches I've been working on for a
general purpose modular synthesizer in pure data. If you're looking at
this and have pure data and csound6~ up and running (see my blog,
foeb.github.io for instructions), try playing around with
`dissonant-sound-generator-5000.pd`. You can make a lot of interesting
"underwater" soundscapes with this.

The only extra library required is `bob~`, an emulation of a moog lowpass
filter. If you can't get that working, you can easily edit one of my other
filter patches to use one of csound's opcodes, or just simply use `lop~`
instead.
