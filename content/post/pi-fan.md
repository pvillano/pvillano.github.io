---
title: "Pi Fan Controller"
date: 2022-06-26T23:46:04-04:00
draft: true
Description: ""
Tags: []
Categories: []
---

I spent most of the day writing software to connect a single fan to a single temperature sensor and by God I am going to tell someone about it even if no one listens.

# Background.
Heat moves when there is a temperature difference.
The greater the temperature difference, the faster heat transfers.
Most industrial process control algorithms try to keep a something at a single constant temperature.
Computer cooling algorithms are wierd.
The only computer cooling algorithm I've *ever* encountered is "spin the fans faster as the CPU gets hotter".
This is wierd for a number of reasons.
It is only capable of the following:


The simple cooling algorithm does not meet the following possible design goals:

* It does not run the fan as quietly as possible
* It does not keep the fan speed from frequently changing
* It does not run the cpu at a constant temperature

What design goals does the simple cooling algorithm meet?

* It keeps the CPU from overheating
* It puts equal wear on the CPU and ... fans.

Side note, one of the reasons we use such a wierd algorithm is because temperature is not the best indicator of fast fans should spin.
Temperature really only says if the fans are spinning too slow or too fast.
If we just knew the power the CPU was consuming, we could keep the CPU at a constant temperature.
It would literally just be rpm=cpu power.

Why? This leads well into a basic theory of heat removal.

#A basic theory of heat removal

When power flows from the wall outlet into your computer, where does it go?
It is all turned into heat.
Technically, even the power used by the fans and rgb lights eventually turns into heat, but we'll ignore that for now.

#derivative algorithm: a misstep
if the fan spun faster if the cpu was too hot and slower if the cpu was too cold, we'd have problems

#My algorithm
Here is my basic algorithm.
There are two regimes: The fan can be on or off.
It is annoying to listen to a fan turn on and off all the time, so the algorithm tries to avoid switching regimes.
Initially the fan is off.
Enough heat can escape without the fan when the computer is on idle.
If the computer gets to an unhappy temperature, the fan turns on.

There's a big difference in the cooling effectiveness of fans off and fans barely on.
It is tempting to set a single temperature that the fans turn on at, but this can create a scenario where the fans turn on and off constantly.
in this situation passive cooling can't keep up with the heat being generated by the computer, so the temperature rises past the threshold, and the fans turn on.
However, as soon as they turn on, the fans are strong enough to lower the temperature below the threshold and turn off, starting the cycle over.

The solution to keeping this cycle from happening is for the fans to stay on until the temperature is low enough to imply the computer is producing so little heat that passive cooling will keep it below the danger point.
in this situation, the fans turn off and the temperature rises slightly, but if the model is correct, it stays below the danger point.
that is, until someone requests more power.

there's a range of fan speeds between barely on and full blast, and ideally we want the slowest one we can get away with white still staying under the danger temp.

a simple approach is to raise the fan speed depending how close we are to the danger temperature.
this is how all PCs work today.

a more complex approach would be to use the temperature and fan speed to estimate the current power draw.
once you have an estimate of the power draw, you can plug into a model the exact fan speed that would keep the PC below the danger temperature.
I have to think about this one a little more though before I put my hardware on the line.

a fan that exactly matches the power draw, always having the lowest possible RPM would be annoying because the pitch of the hum would change all the time and your brain wouldn't be as easily able to ignore it.
setting a limit to how fast your fan can speed up or slow down sounds better.
I want my computer to be responsive to big jumps in temperature, so I only cap the rate of RPM drops.
I actually measured the pitch of the fan at different speeds, and created a thing so that the fan can only slow down a half step a second or whatever

Todo: The fan should not slow down if the temperature is rising too quickly