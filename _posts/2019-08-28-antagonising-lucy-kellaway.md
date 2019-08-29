---
layout: post
title:  "Antagonising Lucy Kellaway with Experimental Amy"
date:   2019-08-28 15:55:30 +0100
categories: Experiment
teaser: Experiment
excerpt: >
  With that, it looked like our foray into artificial voices, might be over. Weeks of work. First day live.
---

At 3.51pm on 2017/05/17, a Slack message popped up: …
> "What’s the best way for us to prevent this happening? <article link>\\
We have the article plastered with your audio thing\\
but she always does her own podcast version.\\
\\
… *and she does not like this one bit*.

With that, it looked like our foray into artificial voices, might be over. Weeks of work. First day live.

Lucy Kellaway, [scourge of corporate bullshit](https://ig.ft.com/sites/guffipedia/), [doyen of the well placed barb](https://twitter.com/lucykellaway/status/696392193884475392?lang=en), [opinionated Columnist](https://www.ft.com/comment/lucy-kellaway), and writer that day of new column piece, had just noticed our audio experiment muscling in on brand Kellaway.

By chance, the FT Labs Team's new audio prototype had selected the latest LK article as one of the first assortment to be converted to audio using an artificial voice, Experimental Amy. The new audio player component sat prominently near the top of each article, giving the unforewarned ft.com readers a chance to listen to it.

Only Lucy Kellaway narrates Lucy Kellaway's articles ([Listen to Lucy](https://www.ft.com/listen-to-lucy)), so almost immediately we had fallen foul of the second of our two primary project don’t-do-thats:

1. Do not besmirch the FT brand
1. Do not antagonise journalists (for they are quick to anger and then express that anger in beautiful, cutting prose)

(Only then could we safely continue to explore the question: Is this good enough and useful enough for our subscribers?)

As we mobilised to limit the damage, and drop that one article from the experiment (which *should* have been an easy thing to do, you might have thought), an email arrived. It provided more context for the explosion behind the scenes (in part, years of frustration with the labor-intensive, error-prone podcast process), but with a new directive: Don't take it down - leave the Amy audio in place. Lucy was now ‘intrigued’.

> "I would like to make it the subject of next week's column. Do you have time for a chat?"

The very next day, fully prepped, with assorted sales pitches and justifications at the ready, we went downstairs to do chat.

Lucy Kellaway was ... lovely - interested in, and even supportive of, the Labs experiment. But also a journalist. The interrogation began.
(Some dramatic license may have been taken with the following transcription)

## "What's Experimental Amy all about?"

Originally, we had a request from our Business Development team to help them gather enough supporting evidence to establish a business case for paying for human narration of FT articles. The Labs team built a framework to import narrations from a partner 3rd party audio provider, with a stable of mellifluous voice actors, and expose them via an audio player on the relevant articles on ft.com. The delays between article publishing and the arrival of a new audio file were of the order of 12 hrs. The audio was of high quality, and whereas the experiment involved just 3 articles per day, it would obviously incur a non-trivial cost if rolled out across the entirety of each day’s publications.

A year or two before that, there had been a brief foray into the use of automated voices in cars, but the voice quality at the time was awful, so that idea was parked.

With the human voiced articles experiment underway, we had another quick look at the state of artificial voices and were pleasantly surprised at how much better they now were. It was relatively easy to build a new 'provider of audio articles' using artificial voices, a pretend 3rd party, and plug it into the existing framework.

The audio experiment had pivoted.

## "How did you choose the Amy voice?"

We compared the voice offerings of the main providers at the time, Google, IBM, Amazon. Largely due to convenience and a wide choice of nice, interesting voices, we settled on Amazon Polly, which had recently been [plugged by Jeff Bezos](https://www.recode.net/2017/4/12/15274220/jeff-bezos-amazon-shareholders-letter-day-2-disagree-and-commit).

Of the AMZ voices, Geraint was the clear team favourite. Experimental Geraint had the soul of a poet. He elevated mere reading of text into a lyrical performance, especially once we got him to read the lyrics of Bohemian Rhapsody. That audio file was all it took to convince any doubter that the quality of automated voices had now achieved a threshold of "wow, rather good".

Since this was a public-facing experiment going to actual, subscription-paying consumers, we needed to be sure we had buy-in from the rest of the company, especially Editorial, Brand, Marketing, Product. Until that point, no-one had asked (or answered) the question, "What does the FT sound like?"

We conducted numerous auditions, narrating FT articles with a variety of automated accents and variants: english, welsh, US, indian english, australian, male, female, and french and german (because, why not?), all offered by the Polly API. The unanimous choice was Amy, a clear, boring, english, female voice.

[This in turn highlighted an issue with the human-narrated articles, where the voice actors were emoting that bit too much. More like reading a story than a news item. Amy did not emote. News was news, not Jackanory.]

## "Why my article?"

Our initial approach was to use, somewhat arbitrarily, the articles cited in the daily [firstFT newsletter](https://www.ft.com/firstft), for narrating by Experimental Amy. On the first day of the experiment, firstFT just so happened to include one of your articles.

The first few weeks of the experiment are intended to consist of a few new articles each day with audio available to all readers.

[Later this changed to all articles for some readers, as we ran an A/B test.]

## "How long does it take to create audio for an article?"

We used the Amazon Polly API, which was very quick. That API had a rather frustrating limit of 1500 characters per request, which was fewer than in most FT articles, even the short ones. As part of the hackery to get the experiment running, we had to break up articles into shorter segments, finding the last convenient paragraph break just before the 1500 char limit, generating audio for each segment via the API, then stitching the audio segments back together into a single file. That whole process takes about 1.5secs per Lucy Kellaway article, and 3-4 seconds for a [Big Read](https://www.ft.com/the-big-read).

This is easily fast enough for our needs, since the FT publishes or updates articles at most every few minutes, and we cache the generated audio for each article.

## "But it takes me an hour to read my own article, and then editing takes a few more hours!"

Yes, well, welcome to the future. [We didn’t say this]

## "How much does it cost?"

The cost was initially nothing, for the Labs team anyway, because it disappeared into other teams' AWS budgets, and that is how we roll in Labs. But even when there was proper attribution of costs, eventually, it still turned out to be just pennies per article.

The costs are so low, there are no worries about re-rendering older articles with later versions of the voice as its quality improves incrementally.

## "It is not very good. It gets lots of things wrong"

Well, there are at least two angles for this.

No-one can dispute that the new automated voices are amazing, as evidenced by Experimental Geraint doing Bohemian Rhapsody. [Whoops, we did not have *that* audio to hand.]

The question is then whether they are adequate for long news articles, and there it is a definite maybe. Sometimes definitely no, other times ok.

The artificial voices are particularly bad with whimsy and nuance, and therefore any [Robert Shrimsley article](https://www.ft.com/robert-shrimsley), and often gets the cadence of idioms wrong. The longer the text, the more chances of a blooper bad enough to jolt you out of comfortably listening to the article. Ironically, the better the voices get, the more you relax whilst listening, the worse the jolt when a blooper does happen.

That said, the artificial voices are good enough for isolated paragraphs and sentences.

## "Will the voice quality improve?"

This is one of the inevitabilities. There is a race to the top among the main providers, competing with each other on voice quality. Experimental Amy had already improved during the course of the project even before we went live. The AWS Polly team (and all the other providers) are actively working on their voice tech.

[Subsequently we've had some nice interactions with the AWS team, where they were keen to hear about our hopes and dreams for artificial voices. They were also very polite in asking us why we were spamming their systems with 1000s of spurious requests due to a programming mistake on our part.]

Specific errors are fixed at source by the AWS Polly team, e.g. when we pointed out that the name Trump was being pronounced with the same cadence as the noun trump. Lots of other FT-specific issues are fixed in our own code. Smaller examples include: FT which is pronounced as "ffft" unless we split it into "F.T.", likewise firstFT, and N.Korea needs to be rewritten as "North Korea" to be read out correctly. Bigger verbal errors arise when site navigation is included in the text, such as when Experimental Amy reads out "click here to see more of firstFT" at the end of an article, or "aitch tee tee pee colon forward slash forward slash" when a url is mentioned verbatim in the text.

We are always finding new gotchas where Experimental Amy just gets things horribly wrong. It is like playing Whack-a-Mole. That said, it’s like operating a ratchet. Each crank of the handle makes the whole thing that bit tighter, and we are finding fewer and fewer gotchas.

It has become very clear that we need to automatically and speedily regenerate the Amy audio after every republish of the article, since people *do* read along with the voice and it is jarring when they differ.

We tried many variations of the headers and footers of the audio, including the title at the beginning, end, both, or neither. We found that the smaller the intro the better, so we make it clear that this is not the official FT audio, with "This article is narrated by Experimental Amy" at the start, and append the article details such as title and author after the main article content.

## "What do our readers think of Amy?"

Our primary initial concern is to not antagonise our readers (or Editorial, Lucy) [we looked earnest at this point] and secondly, hopefully, to get some feedback sufficient to justify continuing with this new audio tech. It is not clear if the readers are interested, or have a need for it. Perhaps our subscribers can find a use for it after becoming acclimatised to it. Is the voice good enough for it, or something like it, to become part of the official FT offering?

[It was too soon to tell at the time.
Since then, some strong emotional responses such as
>"i use experimental amy frequently. she is becoming my best friend sadly"

and some significant evidence of (minority) but persistent and frequent usage.

We have received lots of suggestions pointing out the many details in which it can be improved, often by stripping out spurious text that would not have been narrated if a human had been doing it.

Some new use cases have emerged, beyond basic listening:
* listening to and reading the same article. This is a thing. Some people like doing both together.
* off-tab listening, where the listener can click through to another tab, and the article continues to be narrated out loud
* lecture fillers during transitions
* the obvious use of this automated audio in podcasts, https://labs.ft.com/2017/02/listen-to-the-ft
]

## "Thank you"

We had survived!

After followup emails to check details, there was radio silence for a few days.

Then, on 21/07/2015,
> [Amy the robot is no match for me](https://www.ft.com/content/fb705712-3be7-11e7-821a-6027b8a20f23)\\
> My AI rival may be cheap and fast but she is dreary\\
> LUCY KELLAWAY

## ... Peak Surreality

Naturally enough, we triggered Experimental Amy to emotionlessly, relentlessly, albeit with jolts, narrate Lucy Kellaway's article which was (politely) dissing Experimental Amy:

<iframe width="100%" height="100" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/672209747&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe>

And (24 hours later ;-), [Lucy reading Lucy](https://www.ft.com/content/a0f18048-50b0-4bba-9d59-f4c240dcedf2).

Soon after the chat, we forwarded to Lucy Kellaway a snippet of Experimental Geraint performing Bohemian Rhapsody:

<iframe width="100%" height="100" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/672208889&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe>


> From: Lucy Kellaway <...>\\
Date: Thu, 18 May 2017 12:26:30 +0100\\
Subject: Re: Audio articles\\
To: Chris Gathercole <...>\\
\\
I ADORE GERAINT
