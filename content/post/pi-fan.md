---
title: "Pi Fan Controller"
date: 2022-06-26T23:46:04-04:00
draft: true
Description: ""
Tags: []
Categories: []
---

I spent most of the day writing software to connect a single fan to a single temperature sensor and by God I am going to tell someone about it even if no one listens.

heat moves when there's a temperature difference. The greater the temperature difference, the faster heat transfers.

here's my basic algorithm. there are two regimes: The fan can be on or off. it's annoying to listen to a fan turn on and off all the time, so the algorithm tries to avoid switching regimes. initially the fan is off. enough heat can escape without the fan when the computer is on idle. if the computer gets to an unhappy temperature, the fan turns on.

there's a big difference in the cooling effectiveness of fans off and fans barely on. if we choose a single temperature threshold to turn the fans on and off, it's possible to end up in a scenario where the fans turn on and off constantly. in this situation passive cooling can't keep up, so the temperature rises past the threshold, but then the fans are strong enough to lower the temperature below the threshold and turn off, starting the cycle over.

the solution is for the fans to stay on until the temperature is low enough to imply The computer is producing so little heat that passive cooling will keep it below the danger point. in this situation, the fans turn off and the temperature rises slightly, but if the model is correct, it stays below the danger point. that is, until someone requests more power.

there's a range of fan speeds between barely on and full blast, and ideally we want the slowest one we can get away with white still staying under the danger temp.

a simple approach is to raise the fan speed depending how close we are to the danger temperature. this is how all PCs work today.

a more complex approach would be to use the temperature and fan speed to estimate the current power draw. once you have an estimate of the power draw, you can plug into a model the exact fan speed that would keep the PC below the danger temperature. I have to think about this one a little more though before I put my hardware on the line.

a fan that exactly matches the power draw, always having the lowest possible RPM would be annoying because the pitch of the hum would change all the time and your brain wouldn't be as easily able to ignore it. setting a limit to how fast your fan can speed up or slow down sounds better. I want my computer to be responsive to big jumps in temperature, so I only cap the rate of RPM drops. I actually measured the pitch of the fan at different speeds, and created a thing so that the fan can only slow down a half step a second or whatever

Todo: The fan should not slow down if the temperature is rising too quickly


