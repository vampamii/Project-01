/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR medicine = 0
VAR dinner = ""
VAR fear = ""
VAR reaction = ""
VAR paranormal = ""

Almost bedtime, but before that, you decide to complete the survey your therapist recommended. You sit in front of your computer.

“What is your greatest fear?”
*[ Loneliness ]
~ fear = "loneliness"
-> question_2
* [Death]
~ fear = "Microwave food"
-> question_2
*[ Clowns.]
~ fear = "Clowns"
-> question_2

== question_2 ==
“How do you react to tense situations?”
*[ Calm ]
~ reaction = "Calm"
-> question_3
* [Panic]
~ reaction = "Panic"
-> question_3


== question_3 ==
“Do you believe in paranormal events?”
*[ Yes ]
~ paranormal = "Yes"
-> wake_up
* [No]
~ paranormal = "No"
-> wake_up

== wake_up ==
You're drenched in sweat, restless, with the sheets clinging to your body. A faint blue light filters through the window, and a breeze stirs the curtain.
* [Close the window.] -> close_window
+ [Take your medicine.] -> take_medicine


== close_window ==
You get up, and the cold grips your naked body. You approach the window to look at the garden. It seems like you can make out someone in the neighbor's house.

* [Close window] -> room
* [Wave at them] -> figure_disappears

== take_medicine ==
The doctor recently prescribed you this medication. It helps with your headaches and makes you feel calmer overall. You take the pill, and a tremendous sense of relief washes over your body.
~ medicine = medicine +1
-> room

== figure_disappears
You look at the figure and start waving at them thinking it might be one of your neighbors. A loud noise from the kitchen interrupts you. When you look back at the window, the figure seems to have vanished. Would you like to check the noise?
* [Yes] -> check_noise
* [No] -> room

== check_noise ==
You walk toward the kitchen, fear taking hold of your body. You live alone—there’s no way a noise that loud could have come from nowhere. You slowly make your way to the light switch and turn it on, but you can’t see anything.
+ [Go back to your room.] -> room
+ [Get something to eat] -> eat

== room ==
You are now in your room. 

+ { run_from_monster } [Try to hide.] -> hide

* { take_medicine } [Take your medicine.] -> take_medicine

{not run_from_monster} Your room remains eerily silent. The desk is spotless, though the reports you filled out last night rest there.
* [Sit on desk.]-> desk
* [Try to sleep.]-> sleep_paralisis_ending
+ Take your medicine. -> take_medicine

== desk==
You sit at your desk and decide to check some pending emails since you can't sleep right now. As you scroll through, you find an email from a few days ago, one you hadn’t noticed before, but it chills you to the bone.

"I’m always watching you. It’s hard to believe you sleep so well at night after everything you’ve done. But that will be your punishment, I’ll always be with you. Always."

You decide to ignore it and stick to your original plan, but you’re starving. You head to the kitchen in search of something to eat.
-> eat

== sleep_paralisis_ending ==
After a while, you manage to fall asleep. A tingling sensation climbs up your spine. You can’t open your eyes, but you hear something gently tapping at the window. You try to move, but it’s impossible. You immediately recognize what’s happening: it’s sleep paralysis, which occurs frequently during periods of stress. After some effort, you manage to open your eyes and see a completely dark figure at the foot of your bed. Your heart races drastically; you know it’s not real, but it terrifies you as if it were. You close your eyes, trying to make it disappear, but a whisper makes you open them again. 

The face, which seems to belong to a woman, stares directly into your eyes. Her appearance is hard to describe, as she has no human features. She says:

"I've come for you. I came to find you because God does not love you."
-> END

== eat ==
You open the refrigerator and remember that you had planned to go grocery shopping last Tuesday, but it was impossible because your boss asked you to stay for extra hours. Inside, there's an old slice of pizza, some microwave meals, and a bit of Chinese takeout. What are you in the mood for?
*[ Pizza.]
~ dinner = "Pizza"
-> eat_dinner
* [Microwave food.]
~ dinner = "Microwave food"
-> eat_dinner
*[ Chinese leftovers.]
~ dinner = "Chinese leftovers"
-> eat_dinner

== eat_dinner ==
You warm up the {dinner} and sit on the dinning table to eat it. An overwhelming discomfort envelops you. You feel as if, somehow, someone is watching you. You decide to ignore it and finish your food since you were starving. Suddenly, you feel a presence very close to you. You could even swear you hear its breathing behind you. You're frozen, unsure of what to do. 

WHAT ARE YOU GOING TO DO?
* [Run to your room]-> run_from_monster
* [Turn around and face it]-> pill_ending

== run_from_monster ==
-> room

== pill_ending ==
+ {reaction == "Panic"} -> turn_around

==turn_around ==
You turn around to see nothing.
You've taken {medicine} pills.
You feel dizzy and paranoid. Voices echo in your head, and you see shadows where there are none. This can’t be happening—you’ve been taking your medication properly. Maybe the dosage wasn’t enough; maybe you need more. You rush to your room and grab the pills. The paranoia consumes you. Pouring all the pills into the palm of your hand, you swallow them all at once. 

Within minutes, your heart stops, and you collapse to the floor. At least the voices are gone now. At least now, you can finally sleep in peace.
-> END

== hide ==

You look around your room in search of a place to hide from whatever is chasing you.

* {reaction == "Panic"} [Hide in your closet] -> pill_ending

* {dinner == "Chinese leftovers"} [Hide under the bed] -> throw_up_ending

== throw_up_ending ==
Your stomach churns violently, and you cover your mouth with your hand, but you can’t stop yourself from throwing up the food you just ate. Why would you eat those Chinese leftovers? They’ve been in the fridge for over a week. You cover your carpet with vomit, but suddenly, you feel much better. Among the remnants of food, you notice a pile of pills that, for some reason, your body hasn’t fully digested. Breathing a sigh of relief, you decide it might be best to stop taking them altogether.
-> END