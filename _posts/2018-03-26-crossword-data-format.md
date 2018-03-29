---
layout: post
title:  "Yet Another Crossword Data Format"
date:   2018-03-26 10:30:30 +0100
categories: Experiment
teaser: Experiment
excerpt: >
  Defining a new human-readable data format for simple crosswords
---
When starting our [interactive crossword project](/experiment/2018/03/23/crosswords.html){:target="_blank"}, we looked for an existing crossword data format, but not many were documented and widely used. Not wishing to create [Yet Another Standard](https://xkcd.com/927/){:target="_blank"} (thanks, xkcd), we went with [www.xwordinfo.com/JSON](https://www.xwordinfo.com/JSON/){:target="_blank"} but it proved too error-prone, and forced a clumsy parse+build structure on the code. After several acrimonious intra-team discussions, we looked for ‘a better way’, and a new format was born.

```yaml
version: standard v1
name: Crossword 15800
author: Julius
editor: Colin Inman
copyright: 2018, Financial Times
publisher: Financial Times
pubdate: 2018/03/07
size: 15x15
across:
- (1,1) 1. Reviewed bistrot/cafe <i>La Maison</i>: sandwiches "criminal" (10)
- (12,1) 6. ,10. Steer clear of wildcat general strike; it's a tragedy eerst (4)
- (1,3) 9. New salary caps not introduced at work; it gets up my nose (5,5)
- (12,3) 10. See 6 across (4)
- (4,5) 12. Live like a king with dad in castles in far-flung places (7,5)
- (1,7) 15. Got up and prepared the pizza base (6,3)
- (11,7) 17. She's an inspiration for occasionally weird author (5)
- (1,9) 18. Heads of Foreign Office committee unusually struggle to concentrate . . . . (5)
- (7,9) 19. . . . . as multiple channels stream Tory with excellent oratory skills (9)
- (1,11) 20. Design squalid sites as means to raise quick cash? (6,6)
- (1,13) 24. ,26. Suites arranged to suit Norwegian's booking? (4)
- (6,13) 25. Like the tale of bird fencing Romeo's mate's stolen car? (10)
- (1,15) 26. See 24 across (4)
- (6,15) 27. Fake uni degrees heavily attacked (5,5)
down:
- (1,1) 1. ,2. Somewhat hormonal, Isabella is an enigmatic figure (4)
- (3,1) 2. See 1 down (4)
- (5,1) 3. Didn't Trump go after journalist with court case? (8,4)
- (7,1) 4. Old Bill gathered wood (5)
- (9,1) 5. Hirsute character in Oxford University called Brown (9)
- (13,1) 7. In European empty bar I had dinner date resembling Edna (10)
- (15,1) 8. Rustic logs chopped for those making camp fire? (4,6)
- (11,4) 11. Names US mountains as stated by Yankee (12)
- (1,6) 13. Let rip guff; foul smell gets up one's nose! (7-3)
- (3,6) 14. Piece of ebony ruler? (5,5)
- (7,7) 16. Not for the first time, falls over, leaving artist to support old morthern church (4,5)
- (9,11) 21. Composer putting note in envelope (no stamp required) (5)
- (13,12) 22. ,23. Book a month to take over from glum donkey (4)
- (15,12) 23. See 22 down (4)
```
The above example of the new crossword data format describes [Crossword No.15,800 Set by Julius on 2018/03/07](https://labs.ft.com/crosswords/2018/03/07/Crossword-15800.html){:target="_blank"},

{% include figure-noimgservice.html src="https://www.ft.com/__origami/service/image/v2/images/raw/ftcms:bdb7ea5a-1875-11e8-9e9c-25c814761640?source=crosswordsftcom" alt="A example of the new crossword data format" width="100%" %}

and drives [an interactive version](https://labs.ft.com/crosswords/2018/03/07/Puzzle-15800-dynamic.html){:target="_blank"}.

## The new format

The crossword data format is a DSL, [a Domain Specific Language](https://en.wikipedia.org/wiki/Domain-specific_language){:target="_blank"}, being an concise, clear, human-readable piece of text that specifies how to construct a simple crossword.

It is written in [YAML](https://en.wikipedia.org/wiki/YAML){:target="_blank"}. Or rather, nearly YAML. The line items for each clue need to be wrapped in quotes in order to accommodate colons and speech marks in the clue. NB, currently our implementation fails to take this into account, parsing the text directly and not as YAML.

Blank lines and comments (starting with #) are ignored.

There are several mandatory fields such as ‘name’ (which should be unique across all the crosswords), ‘author’, and ‘size’.

### Clues

The clues are grouped as lists named ‘across’ and ‘down’.

Each clue has the form: - `(COORDINATES) IDs. Clue text (ANSWER)`

COORDINATES are (across, down), with (1,1) being the top left square.

The IDs identify each clue, and also tie together subsequent (comma-separated) clue IDs for answers which straddle multiple positions on the grid, e.g., the clue ‘6 across‘ in the example grid above. The subsequent IDs numbers might have an associated ‘down’ or ‘across’ if needed to disambiguate when a particular clue id has both aspects.

The ANSWER is a sequence of words or numbers separated by commas or hyphens. Very obscure crosswords might want to have full stops, colons, or semi-colons as separators in there too, and this format could handle them.

The Clue text can include basic html formatting such as italics.

### Weaknesses

The format seems flexible enough to cover all the basics for the standard crossword, but is likely to run into difficulties for non-standard variants.

If we stick with official YAML, then we need to take extra care about escaping certain characters used in the clues. There can be no bare square brackets, speech marks, colons, etc in the clue and answer texts, but the line (after the initial hyphen) can be wrapped in quotes to overcome that.

*Breaking News!* It turns out that some crossword authors have been known to split individual answer words across multiple lines in the grid! Yes. Shocking. This did not figure even as a possibility during the initial design of the format. I'm assured this only happens with words which break naturally into sub words, e.g. LIGHTHOUSE -> LIGHT HOUSE, when it might have been tiresome to have too many clues with short answers. Here is [a recent example](https://labs.ft.com/crosswords/2018/03/24/Crossword-15815.html) (look for clues '22 across' and '7 down').

The new format, as it stands, cannot quite handle that, and it had to be [fudged a bit](https://labs.ft.com/crosswords/2018/03/24/Puzzle-15815-dynamic.html). However, the format could be fairly easily and cleanly extended to accommodate that scenario, perhaps by using a different separator in the IDs, e.g. for 22 across, using a pipe character to indicate the answer which spans clues 22 and 27 is a single word of length 10 (4+6):

```
- (12,11) 22.|27. Acrobatics in toilets with Eliot's initials <i>[NB: one word, length 10]</i> (4)
...
- (1,15) 27. See 22 across (6)
```

## Using the format

The format is easy to read, debug, and edit manually. This is probably its main benefit when compared with the other formats out there.

It is easy to parse and validate, at a basic level, to check that all the mandatory details and structure are present and correct.

A little more effort (by unpacking the clues into a grid) is needed to ensure that

* the answers fit within the stated size of the grid,
* the clues are numbered appropriately,
* and the answer letters agree at every intersection .

We have several different incoming data formats for crosswords published by the FT, including some (undocumented) XML exported from a commercial crossword compiling tool, [CCW](https://www.crossword-compiler.com/){:target="_blank"}, and a bespoke (but consistently-formatted) Word document. It has proved relatively simple to transform them into the new YAML format, and import that into our new crossword implementation.

## Implementation / Infrastructure

A couple of bugs/oversights have become apparent in our definition and implementation of this format, but let's pretend they are not a big issue for now.

We have an in-browser [parser / validator / translator / editor / viewer](https://labs.ft.com/pages/crossword_dsl.html){:target="_blank"} which makes it easy to import and edit crosswords from a variety of sources. The code is ... horrible; a classic example of a hack which stayed around too long. The main fiddliness is in handling the multi-clue answers.

The same parser is baked into an [Origami](https://origami.ft.com/){:target="_blank"} web [component](https://registry.origami.ft.com/components/o-crossword@1.8.2){:target="_blank"} which is used to power the current online test. The crossword data can be supplied as a url to a file, or directly as an attribute value.

We use [Jekyll](https://jekyllrb.com/){:target="_blank"} to create the mini site for the crossword experiment, [labs.ft.com/crosswords](https://labs.ft.com/crosswords){:target="_blank"}.

## Next steps / Extensions

The next, obvious step is to fix the YAML-related format issues uncovered during the writing of this blog post.

The parser needs a rewrite, and some unit tests would be nice.

The format can be extended in a variety of straightforward ways but, since complexity was one of the negative aspects of the other formats, that is to be resisted.
