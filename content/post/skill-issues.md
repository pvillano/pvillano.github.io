---
title: "Skill Issues"
date: 2023-10-13T18:25:21-05:00
draft: true
Description: ""
Tags: []
Categories: []
---

https://twitter.com/GraphCrimes/status/1712719735668830325


How would you actually quantify skill floor/ceiling gap in competitive games?

Firstly, I'm going to restrict myself to games I can easily get data.
Second, I'll define "skill floor" as "the base skill required to be effective" and
"skill ceiling" as "the tier of skill players reach when they have maximized efficacy"

# nitty gritty definitions
#### Skill floor call it something else
* the minimum skill level for which practice significantly improves win rate
* "the base skill required to be effective"

#### Skill Ceiling
* the maximum skill level for which practice significantly improves win rate
* "the tier of skill players reach when they have maximized efficacy"

I would first create a graph that showed win chance as a function of player A and player B skill.
Play time and rank are both candidates for metrics of skill development.

For a game of pure chance, you would expect the table to look like this:

#### P1 win chance: War, Coin toss

|        | new P1 | avg P1 | pro P1 |
|-------:|-------:|-------:|-------:|
| new P2 |    .50 |    .50 |    .50 |
| avg P2 |    .50 |    .50 |    .50 |
| pro P2 |    .50 |    .50 |    .50 |

These games have high skill floors and low skill ceilings.
No player can improve their win rate by practicing.

For a game of pure skill, you would expect the table to look like this:

#### P1 win chance: Beard length, 

|        | new P1 | avg P1 | pro P1 |
|-------:|-------:|-------:|-------:|
| new P2 |   0.50 |   1.00 |   1.00 |
| avg P2 |   0.00 |   0.50 |   1.00 |
| pro P2 |   0.00 |   0.00 |   0.50 |


These games have low skill floors and high skill ceilings.
Every player can improve their win rate by practicing.


#### P1 win chance: High D2, with beard length tiebreaker

|        | new P1 | avg P1 | pro P1 |
|-------:|-------:|-------:|-------:|
| new P2 |   0.50 |   0.75 |   0.75 |
| avg P2 |   0.25 |   0.50 |   0.75 |
| pro P2 |   0.25 |   0.25 |   0.50 |

This game also has a low skill floor and high skill ceiling.
Every player can improve their win rate by practicing.

#### P1 win chance: Can wavedash

|        | new P1 | avg P1 | pro P1 |
|-------:|-------:|-------:|-------:|
| new P2 |   0.50 |   0.50 |   1.00 |
| avg P2 |   0.50 |   0.50 |   1.00 |
| pro P2 |   0.00 |   0.00 |   0.50 |

#### P1 win chance: Knows rules

|        | new P1 | avg P1 | pro P1 |
|-------:|-------:|-------:|-------:|
| new P2 |   0.50 |   1.00 |   1.00 |
| avg P2 |   0.00 |   0.50 |   0.50 |
| pro P2 |   0.00 |   0.50 |   0.50 |

for 0 vs .5


# A measure of skillfullness

The skillfulness of a game is the average value of the top triangle minus the average value of the bottom triangle.
(equivalently, the average of the top triangle times two minus one)
A luck based game has a skillfulness of 0, and a perfectly skillful games has a skillfulness of 1 (a game where practicing makes you worse has a skillfulness of -1)
It is possible to evaluate the skillfulness of a subgroup of players.
For example, one could determine the skillfulness of only bronze ranked players.

One measure of skill floor/ceiling could be measuring how win rate changes against ALL players as a function of skill.
Note that this data is absent for most ranked games, since matches are only made between players of similar skill.

Looking at the skillfulness in a sliding window of rank is another way of determining skill floor/ceiling
Skillfulness should go up and then down.
The size of the window is of importance, but the most appropriate size of the window is the actual matches that get made,
so simply using the available data is the most accurate way.

The skillfulness at an elo is the percentage of favorite wins minus underdog wins *for matchups overlapping this elo*