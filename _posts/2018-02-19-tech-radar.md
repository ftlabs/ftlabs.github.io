---
layout: post
title:  "Tech Radar"
date:   2018-02-19 09:30:30 +0100
categories:
teaser: Experiment
excerpt: >
  A highly configurable system for auto-generating ‘radar’-style displays of project and team datasets such as backlogs.
---
 | FT Labs' Tech Radar is a highly configurable system for auto-generating ‘radar’-style displays of project and team datasets such as backlogs.  <BR>  <BR> The code sits [in this repo](https://github.com/ftlabs/tech-radar), and includes [an example dataset](https://raw.githubusercontent.com/ftlabs/tech-radar/master/client/demo.json) which is the source of data for [this fruit and veg example](https://labs.ft.com/tech-radar/?json=https%3A%2F%2Flabs.ft.com%2Ftech-radar%2Fdemo.json&sortcol=tastiness&segment=colour&sorttype=alphabetical&title=FTLabs+Potential+Projects+State&ringcolor=rainbow&proportionalrings=true&noderepulsion=1&nodeattraction=9&quadrant=bottom+left").| [![Example Tech Radar](/assets/uploads/2018/02/example_radar.png)](/assets/uploads/2018/02/example_radar.png) |
 | | *fruit and veg demo* |



## Why a radar, and why ~~now~~ then?

It seemed every internal team wanted their own radar-themed view of their projects, and were grumbling about the effort needed to maintain them manually. Greatly inspired by the [Thoughtworks Radar](https://www.thoughtworks.com/radar), we saw an opportunity to build a tool to automate the generation of radar displays, not using Ruby, taking advantage of an in-house service which exports data from Google Spreadsheets as a JSON feed. Each team could maintain (and share) their projects’ details in a spreadsheet, and launch the radar display via a link within the spreadsheet.

## How?

The FT Labs Tech radar tool is built using Javascript using the [D3 library](https://d3js.org/)’s force diagram, served as a static page from [Github Pages](http://labs.ft.com/tech-radar/). The radar is configurable via a display dashboard, via url parameters (including one to hide the dashboard...), and via parameters embedded in the JSON data.

| |![partial dashboard](/assets/uploads/2018/02/partial_dashboard.png)|
| | *part of the dashboard, for the display tab* |

Nodes in the display are (initially) placed using a combination of attraction (to the section they should be in) and repulsion (from each other). Labels attempt to avoid all other labels and nodes, whilst still keeping close to their own node, in order to remain visible and relevant.

## Usage

Configure the radar url with a source of JSON data, e.g. the [handy demo file](https://labs.ft.com/tech-radar/?json=https://labs.ft.com/tech-radar/demo.json)

_(Within the FT, create (or update) a simple dataset with named columns in a google spreadsheet, export it as a JSON feed using the in-house service, and configure the radar url with the name and id of that entry. See [the Bertha repo](https://github.com/ft-interactive/bertha).)_

When viewing the radar display, all the parameters are adjustable directly in the dashboard, in turn updating the url of the radar page. The url can be shared and the recipient will get the same display.

After the display has rendered, with the nodes and labels positioned automatically, they can be repositioned individually. The user will need to take a screenshot to accurately preserve such a manually adjusted layout, since those manual adjustments are not persisted in the url.

| | ![default positions](/assets/uploads/2018/02/positioning_default.png) | ![manual positions](/assets/uploads/2018/02/positioning_manual.png) |
| | *default positioning* | *manual positioning* |


More details are available (click to expand) in the table, and both the dashboard and the table can be removed from the display completely.

## Features and requirements

We had some noble users who suffered through the early versions and helped us shape the final version.

Their main requirements were:

* Every node should be in the correct sector
* Choosing their own colour scheme
* Being able to manually adjust the nodes and labels
* And, somewhat unexpectedly, being able to vary the origin of the quadrant

The default settings should just work (™), but it is possible to override almost all aspects of the display, including:

* The balance of repulsion vs attraction
* Colour(s), colour gradient, and crystallisation row (where the colour brightness peaks at one of the middle rows, rather than an end row)
* Which datasource(s). It is possible to combine multiple data sources into one display.
* Which non-default columns to use as the display dimensions, and their sort order
* Filtering the data
* Which corner is the origin of the radar quadrant
* Any of the CSS
* And lots more. [See the repo README for details](https://github.com/ftlabs/tech-radar/blob/master/README.md).

And, when all is said and done, every node, node label, and name can be individually repositioned and locked into place, if their default placements are not satisfactory.

| | ![Example Tech Radar](/assets/uploads/2018/02/quadrant_lower_right.png) | | ![Example Tech Radar](/assets/uploads/2018/02/quadrant_lower_left.png) |
| | *ringcolor: rainbow* | | *ringcolor: green* |
| | | |
| | ![Example Tech Radar](/assets/uploads/2018/02/quadrant_upper_right.png) | | ![Example Tech Radar](/assets/uploads/2018/02/quadrant_upper_left.png) |
| | *ringcolor: yellow, crystallisation: 0* | | *ringcolor: red, crystallisation: 3* |

## Difficulties

### Physics

* Trying to stay within bounded regions using attraction+repulsion. We had to resort to a bit of maths at the boundaries and forcibly repatriate run-away nodes into the quadrant. This can easily happen even when the region is not particularly crowded.
* Fitting lots of nodes into tight corners. As has no doubt been a problem for everyone who tries to build radar-themed displays, space gets tight near the origin.
* Keeping the labels from overlapping. We used invisible nodes in D3 to repel labels from all other labels and nodes (except their own node).

### UX

* Juggling a large set of parameters to find a combination that worked well in most circumstances.
* Not succumbing to feature creep _(... we succumbed)_.
* Handling the explosion in config parameters, many of which were purely experimental, and trying to avoid the configuration becoming a UX disaster. Designing a useful, usable dashboard was a significant challenge.

## What's Next?

Despite there already being far too many configurable features, the urge is obviously to continue to add more. We won't be doing so, unless internal users clamour for it. Meanwhile, this code is open source, so...
