---
title: The cozy void on my laptop
date: 2022-12-03
edited: 2024-04-10
tags:
  - legacy post
  - linux
  - personal
  - void linux
  - distrohopping
---
	<h2 id="helo-i-am-in-a-black-hole-rn-send-help-please" tabindex="-1">Helo i am in a black hole rn send help please :( <a class="header-anchor" href="#helo-i-am-in-a-black-hole-rn-send-help-please"><span class='material-symbols-outlined center'>tag</span></a></h2>
<p>Jokes aside, I have switched from the glorious Arch Linux to the menacing Void Linux because of a stupid decision of mine of running a roulette with the distros that Revolt Lounge Regulars want me to use for an entire month. (Chat logs at the end of the blog article)</p>
<p>Yes, an entire fucking month. But I have used Void for like a week so it must be an easy challenge right?</p>
<p>R-Right?</p>
<p>Well, time will tell. But first I need to tell my first impressions of the distro, installer and everything.</p>
<h1 id="first-impressions" tabindex="-1">First Impressions <a class="header-anchor" href="#first-impressions"><span class='material-symbols-outlined center'>tag</span></a></h1>
<h2 id="the-installer" tabindex="-1">The installer <a class="header-anchor" href="#the-installer"><span class='material-symbols-outlined center'>tag</span></a></h2>
<p>This is the thing that I always love of void, it is a bit confusing at first glance, mainly the filesystem part which always throws me up, but aside from that, it’s a pretty good installer! It’s simple enough to make anyone use the distro with almost minimal effort. You can also install it manually, similar to arch these days where you have the option to use archinstall.</p>
<p>The installer looks like this:</p>
<p>An image of the Void Linux Installer</p>
<p>It’s a simple ncurses installer which has nothing really going on.</p>
<h2 id="first-boot" tabindex="-1">First Boot <a class="header-anchor" href="#first-boot"><span class='material-symbols-outlined center'>tag</span></a></h2>
<p>After doing the initial setup on the installer and you boot into your pc/laptop, you go into a familiar place. This place being <code>tty</code>, this is where you decide what to do after installing.</p>
<p>But we can’t do much on a black screen with just white text right?</p>
<p>True, true.</p>
<p>But remember that minimal distros doesn’t have desktop environments by default because that removes the cool part about minimalism.</p>
<p>We need to install the repos, the drivers, the networking and most importantly, learn how <code>runit</code> works.
Wacky Services</p>
<p>So, yeah. Say goodbye to <code>systemd</code> because <code>runit</code> is going to be your friend on this amazing journey.</p>
<p>RunIt is an lightweight alternative to SystemD that just manages your system/user services.</p>
<p>RunIt works a little bit different. Unlike SystemD, RunIt works using folders and not .service files. Meaning that they are not cross-compatible.</p>
<p>To enable a service, you need to make a symbolic link from <code>/etc/sv/&lt;service&gt;</code> to the <code>/var/service/ folder</code>.</p>
<p>And to run it once, you use <code>sv up &lt;service&gt;</code>.</p>
<p>Pretty easy right?</p>
<h2 id="conclusion" tabindex="-1">Conclusion <a class="header-anchor" href="#conclusion"><span class='material-symbols-outlined center'>tag</span></a></h2>
<p>I like how Void Linux works and how it is blazingly fast. In fact, the package manager is the best thing about it. But to make a full review about the distro, I first need to use it for this entire month.</p>
<p>So do I like the experience so far?</p>
<blockquote>
<p>Yes! I do like the experience so far! But I miss OpenTabletDriver, which uses a SystemD Service by default, but maybe someday I will find a way to make RunIt services myself.</p>
</blockquote>
<h2 id="average-rolt-conversation" tabindex="-1">Average Rolt Conversation <a class="header-anchor" href="#average-rolt-conversation"><span class='material-symbols-outlined center'>tag</span></a></h2>
<p>Amy: also you guys decide what os i will use this month. I will spin a roulette with the distros you want me to use and the one that gets chosen is the one that i am going to use for this entire month</p>
<p>Lokicalmito: void
actually
kiss :trol:</p>
<p>Inderix: linux from scratch
you'll spend the whole month installing a system you can actually use :trol:</p>
<p>Error: Might I recommend Gentoo?</p>
<p>Lokicalmito: alpine linux
unironically amongOS</p>
<p>Amy: My brother added uwuntu and i added fedora</p>
