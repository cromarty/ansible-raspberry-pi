
# Status Updates

2020/10/05

Currently there is a problem with the copy of espeakup from the
Debian/Ubuntu/Raspbian repositories. Espeak does not
shut up when control is pressed. I believe this relates to espeakup now being
built against espeak-ng. The shut up functionality is in espeak rather than
espeakup.

Furthermore, building espeakup from source against the non ng version of espeak
causes espeakup to fail because of errors in function calls to audio libraries.
I think espeakup has just fallen behind in maintenance.

There have also been changes to Fenrir installation since the fenrir role in
this repository was first written.

I am working on the above.

Plans to include new roles; espeakup and speechd_up to split out espeakup
compilation and install speechd-up as an alternative to connect speakup to
speech-dispatcher.



