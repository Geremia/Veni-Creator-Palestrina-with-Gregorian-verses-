\version "2.23.1"
\include "deutsch.ly"
#(set-global-staff-size 15)
#(set-default-paper-size "letter")
#(ly:set-option 'point-and-click #f)

\header
{
  title="Veni Creator Spiritus"
  composer="Giovanni Pierluigi da Palestrina"
}

\markup {
  \epsfile #Y #12 "EPSs/Incipit.eps"
}

\paper
	{
	%annotate-spacing = ##t
	top-margin = 0.5 \in
	bottom-margin = 0.5 \in
	left-margin = 0.5 \in
	right-margin = 0.5 \in
	ragged-bottom = ##f
	ragged-last-bottom = ##t
        print-page-number = ##f
	system-system-spacing = #'((basic-distance . 17) (minimum-distance . 14) (padding . 5) (strechability . 250))
        system-score-spacing = #'((basic-distance . 17) (minimum-distance . 14) (padding . 5) (strechability . 250))
        score-system-spacing = #'((basic-distance . 17) (minimum-distance . 14) (padding . 5) (strechability . 250))
%	systems-per-page = 3
%	min-systems-per-page = 3
%	markup-system-spacing.basic-distance = #12
%	print-all-headers = ##t
	print-first-page-number = ##f
        oddFooterMarkup=\markup   \fill-line { "" \fromproperty #'page:page-number-string }
        evenFooterMarkup=\markup  \fill-line { \fromproperty #'page:page-number-string "" }
        last-bottom-spacing = #'((basic-distance . 12) (minimum-distance . 7) (padding . 4))
	}

	
global = {
	\key c \major
	\time 2/2 \set Score.measureLength = #(ly:make-moment 11/4)
        \newSpacingSection
        \set Score.currentBarNumber = #1
        \set Score.measureLength = #(ly:make-moment 2/1)
        % \time 3/1 \once \override Score.TimeSignature.style = #'single-digit \newSpacingSection
	}

	ficta = { \once \set suggestAccidentals = ##t }
	
	forget = #(define-music-function (music) (ly:music?) #{
		\accidentalStyle forget
		$music
		\accidentalStyle default
		#})
        % \mark \markup { \fontsize #-3 \note  {1} #1 = \fontsize #-3 \note {1.} #1 }


cantus =  \relative c''
	{
	c1 g
        a1 c
	d1 c
	d1 e2. e4
%5
	d1 r2 f |
	e4 d c h a2 h
	c2 e1 d2~
	d2 cis4 h cis2 cis
	d\breve
%10
	c1 d |
	e1 c
	a1 g
	c\breve
	d1 g,
%15
	a2. h4 c1~ |
	c2 h4 a h2 h
	c1 r
	h1 c
	a1 g~
%20
	g1 f |
	g2 c2. h4 h a8 g
	a2 a g2. f4
	e2 g1 \ficta fis2
	g1 h
%25
	c1 a |
	g\breve
	f1 g2 c~
	c4 h h a8 g a2 a
	g\breve
%30
	d'1. d2 |
	h\breve \bar "|."
	}

        
altus =  \relative c'
	{
	R\breve
	f1 c2 e
	f2 g a4 h c2~
        c4 h h2 a4 g c2~
%5
	c2 h c1~ |
	c1 r2 g
	e2 e g g
	a1. a2
	a1 f
%10
	g2 a f4 g a h |
	c2 g a2. g4
	f2 e d d
	c1 a
	a2 h c1
%15
	a2 a'2. g4 e f |
	g1. g2
	e\breve
	r1 e
	f1 d
%20
	e1 d |
	h2 e1 d2
	d2. c4 h2 e~
	e2 c d1~
	d1 r
%25
	e1 f |
	d1 e
	d1 h2 e~
	e2 d d2. c4
	h2 e4 d e f g2~
%30
	g2 fis4 e fis2 fis |
	g\breve |
	}


tenor =  \relative c'
	{
	R\breve
	R\breve
	R\breve
        r1 c
%5
	g1 a |
	c1 d
	c1 d
	e1. e2
	d1 r2 d
%10
	e2 f d4 e f g |
	c,2 e f c
	d4 c c1 h2
	a2 e' f1~
	f2 f e1
%15
	c2 f2. e4 e d8 c |
	d1. d2
	c2. h4 a1
	e1 r
	r1 h'
%20
	c1 a |
	g\breve
	f1 g2 c~
	c4 h g2 a a
	g4 a h c d1
%25
	R\breve |
	h1 c
	a1 g~
	g1 f
	g2 c2. h4 g2
%30
	a1. a2 |
	g\breve |
	}
	

bassus  =  \relative c
	{
	R\breve
        R\breve
	R\breve
	R\breve
%5
	r1 f |
	c2 e f g
	a4 h c1 h2
	a1. a2
	d,\breve
%10
	R\breve |
	r1 f~
	f1 g
	a1 f
	d1 c
%15
	f2. g4 a1 |
	g1. g2
	c,2 c'2. h4 a2~
	a2 gis a1
	d,1 g
%20
	c,1 d |
	e4 d c d e f g2
	d1 e2. d4
	c2 e d1
	r1 g
%25
	a2 a f d |
	g2 g c,1
	d1 e2 c4 d
	e4 f g2 d1
	e2 c2. d4 e2
%30
	d1. d2 |
	g\breve |
	}

        
lyricscantus = \lyricmode {
	Men -- tes tu -- o -- _ rum vi -- _ si -- ta,
        men -- tes __ _ _ _ _ tu -- o -- rum vi -- _ _ _ si -- ta,
        im -- ple __ _ su -- per -- _ na __ _ _ gra -- _ _ _ _ _ ti -- a
        quae __ _ tu cre -- a -- sti pe -- _ _ _ _ _ cto -- ra, __ _ _ _ _ _ 
        quae __ _ tu cre -- a -- sti pe -- _ _ _ _ _ cto -- ra,
        pe -- cto -- ra.
	}


lyricsaltus = \lyricmode {
	Men -- tes tu -- o -- rum vi -- _ _ _ _ _ _ _ si -- ta,
        men -- tes tu -- o -- rum vi -- si -- ta,
        im -- ple su -- per -- _ _ _ _ na gra -- _ _ _ _ ti -- a,
        im -- ple su -- per -- na gra -- _ _ _ _ ti -- a
        quae __ _ tu cre -- a -- sti pe -- cto -- ra, __ _ _ 
        pe -- cto -- ra,
        quae __ _ tu cre -- a -- sti pe -- cto -- ra, __ _ _
        pe -- _ _ _ _ _ _ _ cto -- ra.
	}


lyricstenor = \lyricmode {
        Men -- tes tu -- o -- _ rum vi -- _ si -- ta,
        im -- ple su -- per -- _ _ _ _ _ na gra -- _ _ _ ti -- a,
        im -- ple su -- per -- na gra -- _ _ _ _ _ ti -- a __ _ _ _
        quae __ _ tu cre -- a -- sti pe -- _ _ _ cto -- ra, __ _ _ _ _
        quae __ _ tu cre -- a -- sti pe -- _ _ _ cto -- ra.
	}


lyricsbassus = \lyricmode {
	Men -- tes tu -- o -- rum vi -- _ _ _ _ si -- ta,
        im -- ple __ _ su -- per -- _ na __ _ _ gra -- ti -- a,
        gra -- _ _ ti -- a
        quae __ _ tu cre -- a -- _ _ _ _ _ _ sti pe -- _ _ cto -- ra,
        quae tu cre -- a -- sti pe -- cto -- ra,
        quae tu cre -- _ _ _ _ a -- sti pe -- _ _ _ cto -- ra.
	}


\score
	{  
	% \transpose { 
	\new ChoirStaff \with { \override StaffGrouper.staff-staff-spacing.basic-distance = #12 }
	<<

	\new Staff << \global
	\new Voice="v1" {
		\set Staff.instrumentName="Cantus"
		\set Staff.midiInstrument = "choir aahs"
		\clef violin
		\cantus }
	\new Lyrics \lyricsto "v1" {\lyricscantus }
	>>


	\new Staff << \global
	\new Voice="v2" {
		\set Staff.instrumentName="Altus"
		\set Staff.midiInstrument = "choir aahs"
                \clef violin % "G_8"
		\altus}
	\new Lyrics \lyricsto "v2" {\lyricsaltus }
	>>


	\new Staff << \global
	\new Voice="v3" {
		\set Staff.instrumentName="Tenor"
		\set Staff.midiInstrument = "choir aahs"
		\clef "G_8"
		\tenor }
	\new Lyrics \lyricsto "v3" {\lyricstenor }
	>>


	\new Staff << \global
	\new Voice="v4" {
		\set Staff.instrumentName="Bassus"
		\set Staff.midiInstrument = "choir aahs"
		\clef bass 
		\bassus }
	\new Lyrics \lyricsto "v4" {\lyricsbassus}
	>>

	>>
	% } % transpose
	

	\layout
	{
	%indent = 2.5\cm
	\context { \Staff \override TimeSignature.break-visibility = #end-of-line-invisible }
%	\context { \Lyrics \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #2 }
%	\context { \Lyrics \override LyricText.font-size = #1 }
%	\context { \Staff \override InstrumentName.X-offset = #'-25 }
%	\context { \Voice \override Slur.transparent = ##t }
%	\context { \Voice \override AccidentalSuggestion.avoid-slur = #'ignore }
%	\context { \Voice \override AccidentalSuggestion.outside-staff-priority = ##f }
	\context { \Score \override BarNumber.padding = #2 }
	\context { \Voice \override NoteHead.style = #'baroque }
	}
	
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   QUI PARACLITUS DICERIS - PLAINCHANT

\pageBreak
\markup {
  \epsfile #Y #24 "EPSs/1.eps"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   TU SEPTIFORMIS MUNERE
       

cantus =  \relative c''
	{
        g1 a
	g1 f
	g1 a
	g4 a h c d2. c4
%5
	h2 c d1 |
	e1. d4 c
	h2 e2. d4 c2~
	c2 h4 a h2 h
	c2 c1 h2
%10
	a1 g2 e |
	g1. g2
	e1 r2 c'~
	c2 h c2. h4
	a4 g a2 f g
%15
	a1. a2 |
	\ficta b2 a1 g4 f
	e4 d e2 f1~
	f1 r
	c'\breve
%20
	d1 e |
	c1 a
	g1 c
	c2 d2. c4 c2~
	c2 h c1~
%25
	c2 h a1 |
	r1 r2 g
	a4 h c a h2 c
	a1 g2. f4
	g2 a2. g4 g2~
%30
	g2 \ficta fis g1 |
	h1 c
	a1 g~
	g1 f
	g1 c~
%35
	c1 h~ |
	h2 a4 g a2 a
	h\breve \bar "|."
	}


altus =  \relative c'
	{
	r1 d	
	e1 d
	c1. d2~
        d4 e8 f g2. fis4 fis e8 fis
%5
	g2 e f4 g a2~ |
	a4 g g1 \ficta fis2
	g\breve
	g1. g2
	e1 r2 g~ 
%10
	g2 \ficta fis g2. \forget f4 |
	e4 d e2 d1
	c2 c'2. h4 a2~
	a2 g4 f e2. d8 e |
	f4 g f2. e4 d2~
%15
        d2 cis4 h cis2 cis
	d1 f
	g1 a
	a1 g2. f4 |
	e4 d c h a1
%20
        f'1 g
	a1 f
	d1 c
	g'1. g2 |
	g1 e~
%25
        e1 r2 c
	d4 e f d e f g2~
	g2 fis g e
	d2 d h2. c4 |
	d2 a h c
%30
        d\breve
	r2 d e4 f g e
	f1 c2 e~
        e2 d c c |
	d2 e c1
%35
	a2 a'2. g4 g2 |
        fis2 g1 fis2
        g\breve |
	}


tenor =  \relative c'
	{
	R\breve
	R\breve
	R\breve
	g1 a
%5
	g1 f |
	g1 a
	g1 c
	d1. d2
	c4 d e c d1~
%10
	d1 r |
	c1 g
	a c
	d1 c~
	c1 d
%15
	e1. e2 |
	d\breve
	c\breve
	d1 e
	c1. a2
%20
	a2 f c'2. h4 |
	a4 g f g a h c2~
	c2 h a4 h c d
	e2 d e2. d8 c
	d1 c2. h8 a
%25
	g1 r |
	h1 c
	a1 g
	f1 g2. a4
	h2 c h a4 g
%30
	a2 a h2. c4 |
	d1 r2 c
	d4 e f d e2. d4
	c2 h a1
	g2 g' f e
%35
	f2 f d1~ |
	d1 d
	d\breve |
	}

	
bassus  =  \relative c
	{
	R\breve	
	R\breve
	R\breve
	r1 d
%5
	e1 d |
	c1 c2 d
	e2. d4 c d e c
	g'1. g2
	c,1 g'
%10
	d1 e |
	c2 c'1 h2
	c2. h4 a g a2
	f2 g a1
	f2. g8 a \ficta b1
%15
	a1. a2 |
	d,\breve
	r1 f~
	f1 g
	a1 f
%20
	d1 c |
	f\breve
	g1 a2. h4
	c2 h c1
	g1 c,
%25
	e1 f |
	d1 c
	r1 r2 c
	d4 e f d e f g2~
	g2 f g e
%30
	d1 g~ |
	g2 g c,1
	R\breve
	r2 g' a4 h c a
	h2 c a2. g4
%35
	f1 g |
	d1. d2
	g\breve |
	}


lyricscantus = \lyricmode {
	Tu sep -- ti -- _ for -- _ mis __ _ _ _ _ _ _ _ _ mu -- _ _ _ _ _ _ _ _ _ ne -- re,
        dex -- trae De -- i tu di -- gi -- tus,
        dex -- trae De -- _ _ _ _ i tu di -- gi -- tus, __ _ _ _ _ _ _ _
        tu ri -- _ te pro -- _ mis -- sum Pa -- _ _ _ tris, __ _ _
        ser -- mo -- _ _ _ _ ne di -- tans __ _ _ gut -- _ _ tu -- ra,
        ser -- _ mo -- ne di -- tans gut -- _ _ _ _ tu -- ra.
	}


lyricsaltus = \lyricmode {
	Tu sep -- ti -- _ for -- _ _ _ _ _ _ _ _ mis mu -- _ _ _ _ ne -- re,
        mu -- ne -- re,
        dex -- trae De -- _ _ _ _ i tu di -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ gi -- tus,
        tu ri -- _ te, __ _ _ _ _ _ _ _
        tu ri -- _ te pro -- _ mis -- sum Pa -- tris,
        ser -- mo -- _ _ _ _ _ _ ne di -- tans gut -- tu -- ra, __ _ _
        gut -- _ tu -- ra,
        ser -- mo -- _ _ _ _ ne di -- tans gut -- tu -- ra,
        ser -- mo -- ne di -- _ _ tans gut -- tu -- ra.
	}


lyricstenor = \lyricmode {
	Tu sep -- ti -- _ for -- _ mis mu -- _ ne -- re, __ _ _ _ _
        dex -- trae De -- i __ _ tu di -- _ gi -- tus,
        tu ri -- _ te pro -- mis -- sum Pa -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ tris, __ _ _ _
        ser -- _ mo -- ne di -- tans __ _ _ gut -- _ _ _ _ tu -- ra, __ _ _
        ser -- mo -- _ _ _ _ _ _ ne di -- tans,
        ser -- mo -- ne di -- tans gut -- tu -- ra.
	}


lyricsbassus = \lyricmode {
        Tu sep -- ti -- _ for -- mis mu -- _ _ _ _ _ _ ne -- re,
        dex -- trae De -- i,
        dex -- trae De -- _ _ _ _ i tu di -- _ _ _ _ _ gi -- tus,
        tu ri -- _ te pro -- _ mis -- sum Pa -- _ _ _ _ _ tris,
        ser -- _ mo -- ne,
        ser -- mo -- _ _ _ _ _ _ ne di -- tans gut -- _ tu -- ra,
        ser -- mo -- _ _ _ _ ne di -- _ _ tans gut -- tu -- ra.
	}



\score
	{  
	% \transpose { 
	\new ChoirStaff \with { \override StaffGrouper.staff-staff-spacing.basic-distance = #12 }
	<<

	\new Staff << \global
	\new Voice="v1" {
		\set Staff.instrumentName="Cantus"
		\set Staff.midiInstrument = "choir aahs"
		\clef violin
		\cantus }
	\new Lyrics \lyricsto "v1" {\lyricscantus }
	>>
        
	\new Staff << \global
	\new Voice="v2" {
		\set Staff.instrumentName="Altus"
		\set Staff.midiInstrument = "choir aahs"
		\clef violin % "G_8"
		\altus}
	\new Lyrics \lyricsto "v2" {\lyricsaltus }
	>>


	\new Staff << \global
	\new Voice="v3" {
		\set Staff.instrumentName="Tenor"
		\set Staff.midiInstrument = "choir aahs"
		\clef "G_8"
		\tenor }
	\new Lyrics \lyricsto "v3" {\lyricstenor }
	>>
        
        
	\new Staff << \global
	\new Voice="v4" {
		\set Staff.instrumentName="Bassus"
		\set Staff.midiInstrument = "choir aahs"
		\clef bass
		\bassus }
	\new Lyrics \lyricsto "v4" {\lyricsbassus }
	>>
	>>
	% } % transpose

	\layout
	{
	%indent = 1.6 \cm
%	\context { \Lyrics \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #2 }
%	\context { \Lyrics \override LyricText.font-size = #1 }
	\context { \Staff \override TimeSignature.break-visibility = #end-of-line-invisible }
%	\context { \Staff \override InstrumentName.X-offset = #'-25 }
%	\context { \Voice \override Slur.transparent = ##t }
%	\context { \Voice \override AccidentalSuggestion.avoid-slur = #'ignore }
%	\context { \Voice \override AccidentalSuggestion.outside-staff-priority = ##f }
	\context { \Score \override BarNumber.padding = #2 }
	\context { \Voice \override NoteHead.style = #'baroque }
	}

	
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   ACCENDE LUMEN SENSIBUS - PLAINCHANT

\pageBreak
\markup {
\epsfile #Y #24 "EPSs/3.eps"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%   HOSTEM REPELLAS LONGIUS


	
global = {
	\key c \major
	\time 2/2 \set Score.measureLength = #(ly:make-moment 2/1)
	}

	ficta = { \once \set suggestAccidentals = ##t }
	
	forget = #(define-music-function (music) (ly:music?) #{
		\accidentalStyle forget
		$music
		\accidentalStyle default
		#})
       


altus =  \relative c'
	{
	R\breve	
	R\breve
	R\breve
        R\breve
%5
	d1 e |
	d1 c
	d1 e
	d1 g~
	g2 f e1
%10
	d1 r2 g |
	g2 f e d
	c2. d4 e2 f
	g\breve~
	g1 a
%15
	g2 e e4 f g e |
	f1 e2 c~
	c2 h a a'
	g2 e e4 f g e
	f1 e2 c~
%20
	c2 h a a'~ |
	a2 \ficta gis a1~
	a1 f
	g1 a
	f2. e4 d1
%25
	c1 f~ |
	f2 e4 d g2 c~
	c2 a2. g4 e f
	g4 a g1 \ficta fis2
	g\breve~
%30
	g\breve |
	g\breve
	a1 g
	f2 e a f
	g1 r2 g
%35
	g2 f e2. d4 |
	c2 e d d
	h2. c4 d2 a~
	a4 h c d e1
	f2 g1 \ficta fis2
%40
	g2. f8 e d1 |
	r1 r2 g
	g2 f e2. d4
	c2 e d d
	h2. c4 d2 a~
%45
	a4 h c d e1 |
	f2 g1 fis2
	g\breve  \bar "|."
	}


tenor =  \relative c'
	{
	R\breve
	g1 a
	g1 f
	g1 a
%5
	g1 c~ |
	c2 h a1
	g1 r2 g'
	g2 f e c
	d1 g,2. a4
%10
	h2 a g1 |
	a1 g2 g'
	f2 e c c
	d2 e d1
	e1 f
%15
	e2 c h4 a h c |
	d1 g,~
	g1 r
	c1 g
	a1 c
%20
	d1 c |
	d1 e2. e4
	d2 f1 e4 d
	c1 r
	R\breve
%25
	r1 c |
	d1 e
	c1 a
	g1 c
	d1 c~
%30
	c2 h4 a h2 h |
	c1 c
	f,1 g
	R\breve
	h1 c
%35
	a1 g~ |
	g1 f
	g1 a
	c1. h2
	a2 g a d
%40
	d2. c4 h2 a |
	g2 g'2. f4 e2~
	e2 c g'2. f4
	e4 d c h a2 a
	g2 g' g f
%45
	e2. d4 c2 e |
	d2 c4 h8 c d2 d
	d\breve |
	}

        
quintus =  \relative c'
	{
        d1 e
	d1 c
	d1. c4 d
	e2 d2. c4 c2~
%5
	c4 h h2 a c |
	g1 r2 c~
	c4 h8 a h2 c c
	a1 g
	a2 h c g'
%10
	g2 f e c |
	d2. c4 h a h2
	a2 c1 h4 a
	h2 c1 h2
	c\breve
%15
	c1 g |
	a1 c
	d1 c
	e2. d8 c h2. c4
	d1 g
%20
	g2 g f e~ |
	e2 d1 \ficta cis2
	d1 d
	e2 e f4 e d c
	d2 c c h |
%25
	c1 a |
	h2 h c4 h a g
	a2. h4 c1
	d1 e2 c~
	c4 h h c8 d e1
%30
	d1. d2 |
	e1 e
	f1 d
	c\breve
	d1 e
%35
	c1 g'2. f4 |
	e4 d c h a2 a
	g2 g' g f
	e2. d4 c2 e
	d2 c d1
%40
	h1 r |
	h1 c
	a1 g~
	g1 f
	g1 a
%45
	c1. h2 |
	a2 g a a
	h\breve |
	}

        
bassus  =  \relative c
	{
	R\breve	
	R\breve
	R\breve
	R\breve
%5
	R\breve |
	R\breve
	R\breve
	d1 e
	d1 c
%10
	d1 e |
	d1 g
	a1. a2
	g\breve
	r1 f
%15
	c1 e |
	d1 c
	r1 f
	c1 e
	d1 c
%20
	g'1 a2. g8 a |
	\ficta b1 a2. a4
	d,\breve
	r1 f~
	f1 g
%25
	a1 f |
	d1 c
	f2. g4 a h c2~
	c2 h a1
	g2. f4 e2 c
%30
	g'1. g2 |
	c,\breve
	r2 c' c h
	a2. g4 f2 a
	g2 g c,1
%35
	r1 c |
	c1 d
	e1 d
	a'1. g2
	f2 e d1
%40
	r2 g g f |
	e1 c
	r1 c
	c1 d
	e1 d
%45
	a'1. g2 |
	f2 e d1
	g\breve |
	}


lyricsaltus = \lyricmode {
	Ho -- stem re -- _ pel -- _ las lon -- gi -- us, __ _
        ho -- stem re -- pel -- las lon -- _ _ gi -- us,
        pa -- cem -- que do -- _ _ _ _ nes pro -- ti -- nus,
        pa -- cem -- que do -- _ _ _ _ nes pro -- ti -- nus,
        pro -- ti -- nus,
        du -- cto -- _ re __ _ _ _ sic __ _ _ _ te prae -- _ _ _ _ _ _ vi -- o
        vi -- te -- mus om -- ne no -- xi -- um,
        vi -- te -- mus om -- _ _ ne no -- xi -- um, __ _ _ 
        om -- _ _ _ _ ne no -- xi -- um, __ _ _ _
        vi -- te -- mus om -- _ _ ne no -- xi -- um, __ _ _
        om -- _ _ _ _ ne no -- xi -- um.
	}


lyricstenor = \lyricmode {
	Ho -- stem re -- _ pel -- _ las lon -- gi -- us, __ _
        ho -- stem re -- pel -- las lon -- _ _ _ gi -- us, __ _ _
        ho -- stem re -- pel -- las lon -- gi -- us, __ _
        pa -- cem -- que do -- _ _ _ _ nes,
        pa -- cem -- que do -- _ nes pro -- _ ti -- nus, __ _ _ _ _
        du -- cto -- _ re sic __ _ te prae -- _ _ _ _ vi -- o
        vi -- te -- mus,
        vi -- _ te -- mus om -- ne __ _ no -- _ _ xi -- um,
        vi -- te -- _ _ _ mus om -- _ _ ne no -- _ _ _ _ _ _ xi -- um,
        vi -- te -- mus om -- _ _ ne no -- _ _ _ _ xi -- um.
	}

        
lyricsquintus = \lyricmode {
	Ho -- stem re -- _ pel -- _ _ _ las __ _ _ _ _ lon -- gi -- us,
        ho -- _ _ _ stem re -- pel -- las lon -- gi -- us,
        ho -- stem re -- pel -- las lon -- _ _ _ _ _ _ _ _ _ _ gi -- us,
        pa -- cem -- que do -- _ nes pro -- _ _ _ ti -- nus,
        pa -- cem -- que do -- nes pro -- ti -- nus,
        du -- cto -- re sic __ _ _ _ _ te prae -- vi -- o,
        du -- cto -- re sic __ _ _ _ _ _ _ _ te prae -- _ _ _ _ _ _ vi -- o
        vi -- _ te -- mus om -- _ ne no -- _ _ _ _ _ _ xi -- um,
        vi -- te -- mus om -- _ _ ne no -- xi -- um, __ _
        vi -- _ te -- mus om -- ne __ _ no -- _ _ _ _ xi -- um.
	}

        
lyricsbassus = \lyricmode {
        Ho -- stem re -- _ pel -- _ las lon -- _ gi -- us,
        pa -- cem -- que do -- nes,
        pa -- cem -- que do -- nes pro -- _ _ _ _ _ ti -- nus,
        du -- cto -- _ re sic __ _ te __ _ _ _ _ _ _ prae -- _ _ _ _ vi -- o
        vi -- te -- mus om -- _ _ ne no -- xi -- um,
        vi -- te -- mus om -- ne no -- _ _ xi -- um,
        vi -- te -- mus om -- ne,
        vi -- te -- mus om -- ne no -- _ _ xi -- um. __ _
	}



\score
	{  
	% \transpose { 
	\new ChoirStaff \with { \override StaffGrouper.staff-staff-spacing.basic-distance = #12 }
	<<
        
	\new Staff << \global
	\new Voice="v2" {
		\set Staff.instrumentName="Altus"
		\set Staff.midiInstrument = "choir aahs"
		\clef violin % "G_8"
		\altus}
	\new Lyrics \lyricsto "v2" {\lyricsaltus }
	>>


	\new Staff << \global
	\new Voice="v3" {
		\set Staff.instrumentName="Tenor I"
		\set Staff.midiInstrument = "choir aahs"
		\clef "G_8"
		\tenor }
	\new Lyrics \lyricsto "v3" {\lyricstenor }
	>>
  
        
	\new Staff << \global
	\new Voice="v5" {
		\set Staff.instrumentName="Tenor II"
		\set Staff.midiInstrument = "choir aahs"
		\clef "G_8"
		\quintus }
	\new Lyrics \lyricsto "v5" {\lyricsquintus }
	>>  
        
        
	\new Staff << \global
	\new Voice="v4" {
		\set Staff.instrumentName="Bassus"
		\set Staff.midiInstrument = "choir aahs"
		\clef bass
		\bassus }
	\new Lyrics \lyricsto "v4" {\lyricsbassus }
	>>
	>>
	% } % transpose

	\layout
	{
	%indent = 1.6 \cm
%	\context { \Lyrics \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #2 }
%	\context { \Lyrics \override LyricText.font-size = #1 }
	\context { \Staff \override TimeSignature.break-visibility = #end-of-line-invisible }
%	\context { \Staff \override InstrumentName.X-offset = #'-25 }
%	\context { \Voice \override Slur.transparent = ##t }
%	\context { \Voice \override AccidentalSuggestion.avoid-slur = #'ignore }
%	\context { \Voice \override AccidentalSuggestion.outside-staff-priority = ##f }
	\context { \Score \override BarNumber.padding = #2 }
	\context { \Voice \override NoteHead.style = #'baroque }
	}

	
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   PER TE SCIAMUS DA PATRE - PLAINCHANT

\pageBreak
\markup {
\epsfile #Y #24 "EPSs/5.eps"
}


%%%%%%%%%%%%%%%%%%%%  GLORIA PATRI DOMINO


global = {
	\key c \major
        \time 2/2 \set Score.measureLength = #(ly:make-moment 2/1)
	}

        
cantus  =  \relative c''
	{
	R\breve
	g\breve
	a1. g2
	f1 g
%5
	a1 g |
	c1 d~
	d2 d c1
	r2 c d d
	e1. d4 c
%10
	e2 d1 c2~ |
	c2 h4 a h2 h
	c\breve
	r1 c
	g1 a
%15
	c1 d |
	c2. d4 e2 e
	d1 e2. d4
	c2 f2. e4 d2~
	d2 cis4 h cis2 cis
%20
	d\breve |
	R\breve
	R\breve
	r1 c
	d1 e
%25
	c2. h4 a1 |
	g1 c~
	c2 e2. d4 d2~
	d2 c1 h2
	e1 d
%30
	R\breve |
	R\breve
	r1 h
	c1 a
	g\breve
%35
	f1 g2. a4 |
	h2 c1 h2
	a1 g
	d'1. a2
	h\breve  \bar "|."
	}
        

altus =  \relative c'
        { 
	d\breve
	e1. d2
	c\breve
	d1 e
%5
	c2 f1 e4 d |
	e2 c g'1~
	g1 r2 e
	f2 g a g4 f
	e4 f g2. \ficta fis8 e \ficta fis!2
%10
	g1 a~ |
	a1 g
	g1 g
	a1. g2
	r2 g c, f~
%15
	f2 e d1 |
	a'2 a g c~
	c2 h c1~
	c2 a1 a2
	a2. g8 f e2 a
%20
	a2 f f4 g a h |
	c2 g g1
	r2 c, c4 d e f
	g4 a h g a h c2~
	c2 h c g
%25
	a4 g g1 \ficta fis2 |
	g1 r2 a~
	a2 g1 d2
	e2 g g2. g4
	g1 h
%30
	c1 a |
	g\breve
	fis1 g2 g
	e2. d4 e2 f
	d2 e d c4 h
%35
	c2 d h1 |
	r2 a1 h2
	c2 d g, g'~
	g2 fis4 e fis2 fis
	g\breve |
	}


tenor =  \relative c'
	{
	R\breve
	R\breve
	R\breve
	R\breve
%5
	R\breve |
	r1 g~
	g1 a~
	a2 g f1
	g1 a
%10
	g1 c |
	d1. d2
	c\breve~
	c1 r
	R\breve
%15
	c1 g |
	a1 c
	d1 c~
	c1 d
	e1. e2
%20
	d\breve |
	c1 d
	e1 c~
	c2 h a1
	g1 c~
%25
	c1 d2. c4 |
	h1 a~
	a2 c2. h4 h a8 h
	c1 d2. d4
	c4 d e f g1
%30
	c,1 r |
	R\breve
	r1 r2 g
	a2. h4 c2 d
	h2 c h a4 g
%35
	a2 a g g' |
	g2 e f d
	f2 f g g,4 a
	h4 c d1 d2
	d\breve |
	}


quintus  =  \relative c'
	{
	g\breve
	c1. h2
	a\breve~
	a1 c
%5
	a2. h4 c2 g'~ |
	g2 e d1~
	d2 g4 f e d c2
	d4 c c1 h2
	c\breve
%10
	r2 d e e |
	f2 f d g
	e\breve
	f1 c
	d1 f
%15
	g\breve |
	e1. g2
	g\breve
	a1 f
	e2 a2. g8 f e2
%20
	f2 a2. g4 f2 |
	e1 d2 g,
	r2 a a4 h c d
	e4 f g2. f4 f e
	g1 g
%25
	R\breve |
	r2 g, a4 h c d
	e2 e g1~
	g2 e d g
	e1 r2 g
%30
	e2. d4 e2 f |
	d2 e d c4 h
	c2 d d1
	R\breve
	R\breve
%35
	r1 r2 e |
	d2 c d1
	a2 d1 c2
	h2 a4 g a2 a
	g\breve |
	}


bassus  =  \relative c
	{
	R\breve
	c\breve
	f1. e2
	d1 c
%5
	f1 c~ |
	c2 c'1 h4 a
	h2 h c4 h a g
	f2 e d1
	c1 r2 c'
%10
	c2 h a1 |
	f1 g2 g
	c,1 c'
	f,1 a2 c~
	c2 h a f
%15
	c2 c'2. h8 a h2 |
	c1 r
	g1 c,2 e
	f1 d
	a'1. a2
%20
	d,2 d d4 e f g |
	a4 h c1 h2
	c2 c a a
	e1 r
	R\breve
%25
	r1 r2 d |
	e4 f g e f g a h
	c2 c, g'1
	c,1 g'2 g
	c,1 r2 g'
%30
	a2. h4 c2 d |
	h2 c h a4 g
	a2 d, g1
	R\breve
	R\breve
%35
	r2 d e2. f4 |
	g2 a f g
	f2 e4 d e2 e
	d\breve
	g\breve |
	}

lyricscantus = \lyricmode {
	Glo -- _ ri -- a Pa -- _ tri Do -- _ mi -- no,
        glo -- ri -- a Pa -- _ _ _ tri Do -- _ _ _ mi -- no,
        na -- to -- que qui a mor -- _ _ tu -- is,
        a __ _ _ mor -- _ _ _ _ _ tu -- is
        sur -- re -- _ xit, __ _ _ ac Pa -- _ _ _ ra -- cli -- to __ _
        in __ _ sae -- cu -- lo -- rum __ _ _ sae -- cu -- la, __ _
        sae -- cu -- la.
	}
            

lyricsaltus = \lyricmode {
	Glo -- _ ri -- a Pa -- _ tri Do -- _ _ _ mi -- no,
        glo -- ri -- a Pa -- _ _ _ _ _ _ _ _ tri Do -- mi -- no,
        na -- to -- que,
        na -- to -- que qui a mor -- tu -- is,
        na -- to -- que qui a mor -- _ _ _ tu -- is,
        a mor -- _ _ _ _ tu -- is
        sur -- re -- _ _ _ _ _ _ _ _ _ _ xit, ac Pa -- ra -- _ _ cli -- to,
        sur -- re -- xit, ac Pa -- ra -- cli -- to
        in __ _ sae -- cu -- lo -- rum,
        in sae -- _ _ cu -- lo -- rum sae -- _ _ _ cu -- la,
        in sae -- cu -- lo -- rum sae -- _ _ _ cu -- la.
	}


lyricstenor = \lyricmode {
	Glo -- _ ri -- a Pa -- _ tri Do -- _ mi -- no,
        na -- to -- que qui __ _ a mor -- _ tu -- is
        sur -- re -- _ xit, __ _ _ _ ac Pa -- _ _ _ ra -- _ _ _ _ _ _ cli -- to __ _ _ _ _ _
        in sae -- _ _ cu -- lo -- rum sae -- _ _ _ cu -- la,
        in sae -- cu -- lo -- rum sae -- cu -- la,
        sae -- _ _ _ _ cu -- la.
	}


lyricsquintus = \lyricmode {
	Glo -- _ ri -- a Pa -- tri __ _ _ Do -- mi -- no,
        Do -- _ _ _ _ _ _ _ mi -- no,
        glo -- ri -- a Pa -- tri Do -- mi -- no,
        na -- to -- que qui a mor -- tu -- is,
        na -- to -- que qui __ _ _ _ a mor -- _ _ _ tu -- is
        sur -- re -- _ _ _ _ _ _ _ _ _ _ xit, 
        sur -- re -- _ _ _ _ xit, 
        ac Pa -- ra -- cli -- to
        in sae -- _ _ cu -- lo -- rum sae -- _ _ _ cu -- la,
        in sae -- cu -- lo -- rum sae -- _ _ _ _ _ cu -- la.
	}


lyricsbassus = \lyricmode {
	Glo -- _ ri -- a __ _ Pa -- tri Do -- _ _ _ mi -- no, __ _ _ _ _ _ _ _
        glo -- ri -- a Pa -- tri Do -- mi -- no,
        na -- to -- que qui a mor -- tu -- is, __ _ _ _ _ _
        na -- to -- que qui a mor -- tu -- is
        sur -- re -- _ _ _ _ _ _ xit, ac Pa -- ra -- cli -- to,
        sur -- re -- _ _ _ _ _ _ _ _ xit, ac Pa -- ra -- cli -- to,
        in sae -- _ _ cu -- lo -- rum sae -- _ _ _ cu -- la,
        in sae -- _ _ cu -- lo -- rum sae -- _ _ _ cu -- la. __ _
	}


\score
{  
	% \transpose {
	\new ChoirStaff \with { \override StaffGrouper.staff-staff-spacing.basic-distance = #12 }
	<<

	\new Staff << \global
	\new Voice="v1" {
	  \set Staff.instrumentName= "Cantus"
		\set Staff.midiInstrument = "choir aahs"
		\clef violin 
		\cantus}
	\new Lyrics \lyricsto "v1" {\lyricscantus }
	>>
     

	\new Staff << \global
	\new Voice="v2" {
	  \set Staff.instrumentName= "Altus"
		\set Staff.midiInstrument = "choir aahs"
		\clef violin % "G_8"
		\altus}
	\new Lyrics \lyricsto "v2" {\lyricsaltus }
	>>


	\new Staff <<\global
	\new Voice="v3" {
	  \set Staff.instrumentName= "Tenor I"
		\set Staff.midiInstrument = "choir aahs"
		\clef "G_8"
		\tenor }
	\new Lyrics \lyricsto "v3" {\lyricstenor }
	>>


	\new Staff << \global
	\new Voice="v5" {
	  \set Staff.instrumentName= "Tenor II"
		\set Staff.midiInstrument = "choir aahs"
		\clef "G_8"
		\quintus}
	\new Lyrics \lyricsto "v5" {\lyricsquintus }
	>>


	\new Staff <<\global
	\new Voice="v4" {
	  \set Staff.instrumentName= "Bassus"
		\set Staff.midiInstrument = "choir aahs"
		\clef bass
		\bassus }
	\new Lyrics \lyricsto "v4" {\lyricsbassus}
	>>
	
	>>
	% } % transpose

	\layout
	{
	%indent = 1.8 \cm
%	\context { \Lyrics \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #2 }
%	\context { \Lyrics \override LyricText.font-size = #1 }
	\context { \Staff \override TimeSignature.break-visibility = #end-of-line-invisible }
%	\context { \Staff \override InstrumentName.X-offset = #'-25 }
%	\context { \Voice \override Slur.transparent = ##t }
%	\context { \Voice \override AccidentalSuggestion.avoid-slur = #'ignore }
%	\context { \Voice \override AccidentalSuggestion.outside-staff-priority = ##f }
	\context { \Score \override BarNumber.padding = #2 }
	\context { \Voice \override NoteHead.style = #'baroque }
	}

}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   AMEN

\noPageBreak
\markup {
\epsfile #Y #12 "EPSs/Amen.eps"
}

% EOF

%{
convert-ly (GNU LilyPond) 2.23.1  convert-ly: Elaborazione di «»...
Conversione in corso: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.39, 2.19.40, 2.19.46,
2.19.49, 2.20.0, 2.21.0, 2.21.2, 2.23.1
%}
