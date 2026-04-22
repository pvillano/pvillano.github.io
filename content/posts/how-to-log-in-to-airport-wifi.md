---
title: "How to Log In to Airport Wifi"
date: 2022-04-12T10:32:51-05:00
draft: false
---

Have you ever tried to connect to a public Wi-Fi network, but can't get the Terms of Service page to show up?

Here's how to fix that!

1. Connect to the Wi-Fi network.
2. open [http://neverssl.com](http://neverssl.com). Your browser will redirect you to a captive portal.
3. Accept terms of service and continue to the internet.

# Why this works

At home, when you try to load a web page, your device sends a request over Wi-Fi to your *router* which *routes* the request to another router and so on, until it gets to the *server* which *hosts* the webpage. The *server* then *serves* the webpage over the same chain of routers back to you.

When you first try to open a webpage at an airport, the airport's router checks to see if it has seen your computer before. If it hasn't, instead of sending your request to the right server, and sending back the server's response, the airport's router sends its own webpage.

This is where things get interesting.
You may be thinking to yourself, "Wait, so any time I visit a webpage, any router along the chain could just replace the page with anything they want without me knowing?".
The answer to that used to be yes.
Fortunately, most sites these days use HTTPS. Encryption is complicated, but it gives a few guarantees that are important with respect to captive portals.
Your computer can verify if a website has been tampered with. Most web browsers now refuse to load a page which does not have the correct cryptographic signature.

So what if I want an airport router to be able to send me a different page than the one I requested?
Go to a website that doesn't have the protections HTTPS offers, such as [http://neverssl.com](http://neverssl.com).
Otherwise, be cautious when using a site without HTTPS - someone could be eavesdropping or modifying what you see!

Sources: this is all from memory and published on a personal blog. Some things are simplified, other things are wrong.