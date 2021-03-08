# GGPO-d
D reimplementation of GGPO, using code referenced from the [original GGPO library](https://github.com/pond3r/ggpo).  
This library allows for deterministic multiplayer gameplay for games like fighting games.  
Using rollback and speculative execution this library gives the illusion of smooth network play even on slower connections, using rollback to correct wrong predictions.

# How to use
Add the library via dub
```
dub add ggpo-d
```

**NOTE: This has not been pushed to dub yet, this instruction only counts once that happens**