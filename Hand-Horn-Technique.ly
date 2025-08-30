\version "2.24.1"

#(set-default-paper-size "letter")

date = #(strftime "%Y–%m–%d" (localtime (current-time)))
\header {
  tagline = ##f
  copyright = \markup \concat {
    \italic "CC0, no rights reserved · last updated "
    \italic \date
    " · github.com/claysmalley/hand-horn-technique"
  }
  title = "Hand Horn Technique"
  composer = \markup \italic "Clay Smalley"
}
\paper {
  indent = 0
  scoreTitleMarkup = \markup {
    \override #`(direction . ,UP)
    \dir-column {
      \small \override #'(baseline-skip . 2.5)
      \fromproperty #'header:subpiece
      \bold \fontsize #1
      \fromproperty #'header:piece
    }
  }
}

centermarkup = {
  \once \override TextScript.staff-padding = #2
  \once \override TextScript.self-alignment-X = #CENTER
  \once \override TextScript.X-offset = #(lambda (g)
  (+ (ly:self-alignment-interface::centered-on-x-parent g)
     (ly:self-alignment-interface::x-aligned-on-self g)))
}

fingerTO = \markup \overtie \abs-fontsize #6 \concat { " " \slashed-digit #0 " " }
fingerTB = \markup \overtie \abs-fontsize #6 \finger " 2 "
fingerTAB = \markup \overtie \abs-fontsize #6 \finger 12
fingerLO = \markup \undertie \abs-fontsize #6 \concat { " " \slashed-digit #0 " " }
fingerLB = \markup \undertie \abs-fontsize #6 \finger " 2 "
fingerLA = \markup \undertie \abs-fontsize #6 \finger " 1 "
fingerLAB = \markup \undertie \abs-fontsize #6 \finger 12
fingerLAC = \markup \undertie \abs-fontsize #6 \finger 13

tuningZero = \markup
\bold
\abs-fontsize #9
"="
tuningSharpFive = \markup
\bold
\abs-fontsize #9
\concat {
  \super
  \sharp
  ".05"
}
tuningSharpForty = \markup
\bold
\abs-fontsize #9
\concat {
  \super
  \sharp
  ".40"
}
tuningFlatTen = \markup
\bold
\abs-fontsize #9
\concat {
  \super
  \flat
  ".10"
}
tuningFlatFifteen = \markup
\bold
\abs-fontsize #9
\concat {
  \super
  \flat
  ".15"
}
tuningFlatThirty = \markup
\bold
\abs-fontsize #9
\concat {
  \super
  \flat
  ".30"
}
tuningFlatFifty = \markup
\bold
\abs-fontsize #9
\concat {
  \super
  \flat
  ".50"
}

reallyopen = \markup {
  \combine
  \abs-fontsize #12 \musicglyph "scripts.open"
  \abs-fontsize #22 \musicglyph "scripts.flageolet"
}
moreopen = \markup {
  \overtie \abs-fontsize #12 \musicglyph "scripts.open"
}
fullopen = \markup {
  \abs-fontsize #12 \musicglyph "scripts.open"
}
halfstopped = \markup {
  \abs-fontsize #12 \musicglyph "scripts.halfopenvertical"
}
mostlystopped = \markup {
  \combine
  \abs-fontsize #12 \musicglyph "scripts.halfopenvertical"
  \abs-fontsize #12 \musicglyph "scripts.tenuto"
}
fullstopped = \markup {
  \abs-fontsize #12 \musicglyph "scripts.stopped"
}

stoppingGuide = \markup \override #'(padding . 5) \table #'(0 0 0 0 0 0) {
  \line {
    \center-column {
      \musicglyph "noteheads.s1"
      \vspace #-1.5
      \fullstopped
    }
    \small \italic { fully stopped }
  }
  \line {
    \center-column {
      \musicglyph "noteheads.s1"
      \vspace #-1.5
      \mostlystopped
    }
    \small \italic { echo (mostly stopped) }
  }
  \line {
    \center-column {
      \musicglyph "noteheads.s1"
      \vspace #-1.5
      \halfstopped
    }
    \small \italic { half stopped }
  }
  \line {
    \center-column {
      \musicglyph "noteheads.s1"
      \vspace #-1.5
      \fullopen
    }
    \small \italic { open }
  }
  \line {
    \center-column {
      \musicglyph "noteheads.s1"
      \vspace #-1.5
      \moreopen
    }
    \small \italic { more open }
  }
  \line {
    \center-column {
      \musicglyph "noteheads.s1"
      \vspace #-1.5
      \reallyopen
    }
    \small \italic { extra open }
  }
}

\markup \column {
  \wordwrap {
    The modern valve horn can trace its origins back to European hunting horns,
    with written music dating back to the \concat { 14 \super th } century.
    These horns lacked valves,
    and naturally, their music was limited to pitches along the harmonic series.
    But Classical–era hornists were eager to unlock the chromatic capabilities of the instrument,
    and in the \concat { mid–18 \super th } century,
    they began to develop and master hand horn technique.
  }
  \null
  \wordwrap {
    In this period, a hornist would carry around a set of crooks,
    allowing them to change the transposition of the horn to whatever a piece may call for.
    This way, players needed not worry about key signatures,
    and notation would tell them the most relevant information about playing the instrument,
    regardless of the actual key:
    which partial to buzz, and how far to bend the pitch with the right hand.
    By the advent of the Romantic period in the early \concat { 19 \super th } century,
    valve horns had become popular in professional orchestras,
    but some composers, like Brahms,
    stubbornly resisted the change and continued to write only for natural horn.
    Others, like Saint-Saëns, experimented with both varieties of horn playing together.
  }
  \null
  \wordwrap {
    Today, we can change the key of the instrument swiftly and easily with valves,
    and horn music is almost always written transposed to F.
    But hand horn technique can still be useful for a number of reasons:
    to gain more control and flexibility on the instrument,
    to aid in reading transposed music,
    or to emulate the sound of a natural horn.
  }
  \null
  \wordwrap {
    The harmonic series as playable on natural horn is shown here,
    starting on C and ascending chromatically.
    Partial numbers are listed to the right of each pitch,
    and deviation from the written pitch (in twelve–tone equal temperament) is shown below, rounded to the nearest 5 cents.
  }
}
\score {
  \layout {
    #(layout-set-staff-size 20)
    \override Lyrics.LyricText.font-series = #'bold
    \context {
      \Score
      \omit BarNumber
    }
  }
  <<
    \new Staff
    \new Voice = "harmonicSeries"
    \relative c''' {
      \accidentalStyle Score.forget
      \set Score.timing = ##f
      \omit Staff.TimeSignature
      \override Stem.length = 0
      \set fingeringOrientations = #'(right)
      \override Fingering.whiteout = ##t
      \override Fingering.whiteout-style = #'rounded-box

      \clef treble
      <c-16 c,-8 c,-4 c,-2>2*2
      \bar "|"
      <cis-17>2*2
      \bar "|"
      <d-18 d,-9>2*2
      \bar "|"
      <ees-19>2*2
      \bar "|"
      <e-20 e,-10 e,-5>2*2
      \bar "|"
      \parenthesize \xNote f,4*4
      \bar "|"
      <fis-11>2*2
      \bar "|"
      <g-12 g,-6 g,-3>2*2
      \bar "|"
      <aes-13>2*2
      \bar "|"
      \parenthesize \xNote a4*4
      \bar "|"
      <bes-14 bes,-7>2*2
      \bar "|"
      <b-15>2*2
    }
    \new Lyrics = "tuning"
    \context Lyrics = "tuning" {
      \lyricsto "harmonicSeries" {
        \override Lyrics.LyricText.font-size = #-2
        \tuningZero
        \tuningSharpFive
        \tuningSharpFive
        \tuningZero
        \tuningFlatFifteen
        " "
        \tuningFlatFifty
        \tuningZero
        \tuningSharpForty
        " "
        \tuningFlatThirty
        \tuningFlatTen
      }
    }
  >>
}
\markup \wordwrap {
  We can use our knowledge of hand stopping to bring some of these pitches into tune
  and reach additional pitches in between them.
  The following is a guide to hand positions for the natural horn.
  Every horn and hand is different, but an \italic open position should produce the most desirable horn sound,
  and a \italic { fully stopped } position should seal off as much of the bell as possible.
  The \italic { extra open } position might necessitate removing the hand from the bell entirely.
}
\markup \null
\stoppingGuide
\markup \null
\score {
  \layout {
    \context {
      \Score
      \omit BarNumber
    }
  }
  \new Staff
  \relative c''' {
    \accidentalStyle Score.forget
    \set Score.timing = ##f
    \omit Staff.TimeSignature
    \override Stem.length = 0
    \set fingeringOrientations = #'(right)
    \override Fingering.whiteout = ##t
    \override Fingering.whiteout-style = #'rounded-box

    \clef treble
    \centermarkup <c-16 c,-8 c,-4 c,-2>2^\fullopen
    \bar "|"
    \centermarkup <cis-17>2^\fullopen
    \centermarkup <cis,-9>2^\mostlystopped
    \centermarkup <cis,-5 cis,-3>2^\fullstopped
    \bar "|"
    \centermarkup <d''-18 d,-9>2^\fullopen
    \centermarkup <d,,-5>2^\mostlystopped
    \bar "|"
    \centermarkup <ees''-19>2^\fullopen
    \centermarkup <ees,-10 ees,-5>2^\halfstopped
    \bar "|"
    \centermarkup <e'-20 e,-10 e,-5>2^\moreopen
    \bar "|"
    \centermarkup <f,-11>2^\halfstopped
    \centermarkup <f,-6>2^\fullstopped
    \bar "|"
    \centermarkup <fis'-11>2^\reallyopen
    \centermarkup <fis-12 fis,-6 fis,-3>2^\mostlystopped
    \bar "|"
    \centermarkup <g-12 g,-6 g,-3>2^\fullopen
    \bar "|"
    \centermarkup <aes-13>2^\halfstopped
    \centermarkup <aes,-7 aes,-4>2^\fullstopped
    \bar "|"
    \centermarkup <a'-13>2^\reallyopen
    \centermarkup <a-14 a,-7>2^\halfstopped
    \centermarkup <a-15>2^\fullstopped
    \bar "|"
    \centermarkup <bes-14 bes,-7>2^\reallyopen
    \bar "|"
    \centermarkup <b-15>2^\moreopen
    \centermarkup <b,-8 b,-4>2^\mostlystopped
  }
}
\score {
  \header {
    piece = \markup \concat { \box { 1 } " Hand Horn Chromatic Scale" }
    subpiece = \markup \wordwrap {
      Repeat this exercise in
      \bold F \concat { \fingerLO "," } 
      \bold E \concat { \fingerLB "," } 
      \bold \concat { "E" \super \flat } \concat { \fingerLA "," }
      \bold D \fingerLAB and
      \bold C \concat { \fingerLAC "," } 
      then
      \bold G \concat { \fingerTAB "," } 
      \bold A \fingerTB and
      \bold { \concat { "B" \super \flat } alto } \concat { \fingerTO "." } 
    }
  }
  \layout {
    \context {
      \Score
      \omit BarNumber
    }
  }
  \new Staff
  \relative c' {
    \accidentalStyle Score.modern

    \clef treble
    \time 3/4
    \tempo 4 = 76 - 176
    \centermarkup e4\mp^\moreopen
    \centermarkup f4^\fullstopped
    \centermarkup fis4^\mostlystopped |
    \centermarkup g4^\fullopen
    \centermarkup aes4^\fullstopped
    \centermarkup a4^\halfstopped |
    \centermarkup bes4^\reallyopen
    \centermarkup b4^\mostlystopped
    \centermarkup c4^\fullopen |
    \centermarkup cis4^\mostlystopped
    \centermarkup d4^\fullopen
    \centermarkup ees4^\halfstopped |
    \centermarkup e4^\moreopen
    \centermarkup f4^\halfstopped
    \centermarkup fis4^\reallyopen^\mostlystopped |
    \centermarkup g4^\fullopen
    fis4
    f4 |
    e4
    ees4
    d4 |
    cis4
    c4
    b4 |
    bes4
    a4
    aes4 |
    g4
    fis4
    f4 |
    e2.
    R2.
    \bar ":|."
  }
}
\pageBreak
\stoppingGuide
\markup \null
\markup \large \bold \italic "Hand Horn Scales and Arpeggios in the Middle Register"
\markup \small \wordwrap {
  Repeat these exercises in
  \bold F \concat { \fingerLO "," } 
  \bold E \concat { \fingerLB "," } 
  \bold \concat { "E" \super \flat } \concat { \fingerLA "," }
  \bold D \fingerLAB and
  \bold C \concat { \fingerLAC "," } 
  then
  \bold G \concat { \fingerTAB "," } 
  \bold A \fingerTB and
  \bold { \concat { "B" \super \flat } alto } \concat { \fingerTO "." } 
}
\markup \null
\score {
  \header {
    piece = \markup \concat { \box { 2 } " G Major" }
  }
  \layout {
    \context {
      \Score
      \omit BarNumber
    }
  }
  \new Staff
  \relative c'' {
    \clef treble
    \time 4/4
    \tempo 4 = 76 - 176
    \centermarkup g2\mp^\fullopen
    \centermarkup a4^\halfstopped
    \centermarkup b4^\mostlystopped |
    \centermarkup c4^\fullopen
    \centermarkup d4^\fullopen
    \centermarkup e4^\moreopen
    \centermarkup fis4^\reallyopen^\mostlystopped |
    \centermarkup g2^\fullopen
    fis4
    e4 |
    d4
    c4
    b4
    a4 |
    g2
    b4
    d4 |
    g2
    d4
    b4 |
    g1
    R1
    \bar ":|."
  }
}
\score {
  \header {
    piece = \markup \concat { \box { 3 } " G Mixolydian/Dominant 7" \super th }
  }
  \layout {
    \context {
      \Score
      \omit BarNumber
    }
  }
  \new Staff
  \relative c'' {
    \clef treble
    \time 4/4
    \centermarkup g2^\fullopen
    \centermarkup a4^\halfstopped
    \centermarkup b4^\mostlystopped |
    \centermarkup c4^\fullopen
    \centermarkup d4^\fullopen
    \centermarkup e4^\moreopen
    \centermarkup f4^\halfstopped |
    \centermarkup g2^\fullopen
    f4
    e4 |
    d4
    c4
    b4
    a4 |
    g4
    b4
    d4
    f4 |
    g4
    f4
    d4
    b4 |
    g1
    R1
    \bar ":|."
  }
}
\score {
  \header {
    piece = \markup \concat { \box { 4 } " G Minor" }
  }
  \layout {
    \context {
      \Score
      \omit BarNumber
    }
  }
  \new Staff
  \relative c'' {
    \clef treble
    \time 4/4
    \centermarkup g2^\fullopen
    \centermarkup a4^\halfstopped
    \centermarkup bes4^\reallyopen |
    \centermarkup c4^\fullopen
    \centermarkup d4^\fullopen
    \centermarkup ees4^\halfstopped
    \centermarkup f4^\halfstopped |
    \centermarkup g2^\fullopen
    f4
    ees4 |
    d4
    c4
    bes4
    a4 |
    g2
    bes4
    d4 |
    g2
    d4
    bes4 |
    g1
    R1
    \bar ":|."
  }
}
\score {
  \header {
    piece = \markup \concat { \box { 5 } " E" \super \flat " Major" }
  }
  \layout {
    \context {
      \Score
      \omit BarNumber
    }
  }
  \new Staff
  \relative c' {
    \clef treble
    \time 4/4
    \centermarkup ees2^\halfstopped
    \centermarkup f4^\fullstopped
    \centermarkup g4^\fullopen |
    \centermarkup aes4^\fullstopped
    \centermarkup bes4^\reallyopen
    \centermarkup c4^\fullopen
    \centermarkup d4^\fullopen |
    \centermarkup ees2^\halfstopped
    d4
    c4 |
    bes4
    aes4
    g4
    f4 |
    ees4
    g4
    bes4
    ees4 |
    \centermarkup g4^\fullopen
    ees4
    bes4
    g4 |
    ees1
    R1
    \bar ":|."
  }
}
\score {
  \header {
    piece = \markup \concat { \box { 6 } " C Major" }
  }
  \layout {
    \context {
      \Score
      \omit BarNumber
    }
  }
  \new Staff
  \relative c' {
    \clef treble
    \time 4/4
    \centermarkup c2^\fullopen
    \centermarkup d4^\mostlystopped
    \centermarkup e4^\moreopen |
    \centermarkup f4^\fullstopped
    \centermarkup g4^\fullopen
    \centermarkup a4^\halfstopped
    \centermarkup b4^\mostlystopped |
    \centermarkup c2^\fullopen
    b4
    a4 |
    g4
    f4
    e4
    d4 |
    c4
    e4
    g4
    c4 |
    \centermarkup e4^\moreopen
    c4
    g4
    e4 |
    c1
    R1
    \bar ":|."
  }
}
\markup \null
\markup \large \bold \italic "Hand Horn Scales and Arpeggios in the High Register"
\markup \small \wordwrap {
  Repeat these exercises in
  \bold F \concat { \fingerLO "," } 
  \bold E \concat { \fingerLB "," } 
  \bold \concat { "E" \super \flat } \concat { \fingerLA "," }
  \bold D \fingerLAB and
  \bold C \concat { \fingerLAC "." } 
}
\markup \null
\score {
  \header {
    piece = \markup \concat { \box { 7 } " C Major" }
  }
  \layout {
    \context {
      \Score
      \omit BarNumber
    }
  }
  \new Staff
  \relative c'' {
    \clef treble
    \time 4/4
    \centermarkup c2^\fullopen
    \centermarkup d4^\fullopen
    \centermarkup e4^\moreopen |
    \centermarkup f4^\halfstopped
    \centermarkup g4^\fullopen
    \centermarkup a4^\reallyopen^\halfstopped
    \centermarkup b4^\moreopen |
    \centermarkup c2^\fullopen
    b4
    a4 |
    g4
    f4
    e4
    d4 |
    c2
    e4
    g4 |
    c2
    g4
    e4 |
    c1
    R1
    \bar ":|."
  }
}
\score {
  \header {
    piece = \markup \concat { \box { 8 } " B" \super \flat " Major" }
  }
  \layout {
    \context {
      \Score
      \omit BarNumber
    }
  }
  \new Staff
  \relative c'' {
    \clef treble
    \time 4/4
    \centermarkup bes2^\reallyopen
    \centermarkup c4^\fullopen
    \centermarkup d4^\fullopen |
    \centermarkup ees4^\halfstopped
    \centermarkup f4^\halfstopped
    \centermarkup g4^\fullopen
    \centermarkup a4^\reallyopen^\halfstopped |
    \centermarkup bes2^\reallyopen
    a4
    g4
    f4
    ees4
    d4
    c4 |
    bes2
    d4
    f4 |
    bes2
    f4
    d4 |
    bes1
    R1
    \bar ":|."
  }
}
