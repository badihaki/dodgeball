# Dodgeball
A 2D dodgeball game made in Godot

## Overview
In this game, players will take the role of a 3-man dodgeball team, attempting to knock the characters on the other team out.

## Controls
- Inputs:
	- Move
	- Throw / Catch the ball
	- Special Throw / Advance Guard
	- Dodge
	- Pass ball / Change character

## Characters
Characters refer to the characters competing in the dodgeball match, controlled by either a player or AI. Each team is made up is made up of 3 characters, and the characters' abilities are represented by different attributes and a health value. When a character's health value is dropped to 0, that character is knocked out of the game by literally having the ball blow them off the field, into the stratosphere, only to appear a while later in the Losers' Stand. While character attributes will vary, they can be categorized into 1 of 4 classes: Heroes, Biggies, Speedsters, and Jokers

### Attributes
- Health (HP)
- Move Speed (Speed)
- Dodge Speed (Speed)
	- Also determines how far a character can dodge
- Dodge Recovery (Recovery)
- Catching Skill (Skill)

### Classes
- Heroes
	- These guys are pretty basic, but have devastating special throws
	- 3 - 5 Health
	- Medium Speed, Recovery, and Skill
- Biggies
	- These guys are slow and resilient, but are pretty mediocre at everything else
	- 6 - 9 Health
	- High Skill
	- Low Speed and Recovery
- Speedsters
	- These guys are super quick and can dodge the best, but can't take a beating
	- 2 - 4 Health
	- Fast Speed, High Recovery
	- Medium Skill
- Jokers
	- While heroes are basic, Jokers are completely random, and generally really powerful in specific situations
	- 1 - 10 Health
	- Random everything else

## Game Mechanics
- Characters will compete on a field. The field has a line of scrimmage that separates each side of the field that characters cannot cross, and there are 3 characters on each side.

### Player Actions
- Movement
	- Characters can move in all directions on their side of the field. Moving backwards is slower than moving forwards.
- Dodging
	- Dodging allows for a short burst of strength, as well as a small window of invincibility.
- Throw
	- When holding the ball, the action button will cause the character start the throwing action
	- Pressing the throw button charges the throw. Releasing the button will cause the character to release the throw.
	- Charging a throw involves the player shooting out a group of raycasts in a cone towards where they are moving. If the player is not moving the character, then all raycasts will aim directly forward.
	- Releasing the throw causes the character to aim at any character detected by the raycasts. If multiple characters are detected, the throw is aimed at the closest character. Failing that, the throw will aim at the first character in the array.
	- All characters have a special throw whose properties vary per character.
- Catching the Ball
	- When not holding the ball, the action button will cause the character to attempt to catch the ball. The character will assume a catching stance for a short time, dictated by the Skill stat. If they are to be hit by the ball, they will catch the ball and nullify damage instead.