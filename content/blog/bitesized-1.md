---
title: "Bite-sized bytes: Clouds of a blue sky"

description: "An introduction to Bite-sized bytes, articles that are too small but not that big."

date: 2023-12-26
tags: ["bitesizedbytes", "bsky", "nix", "pixel", "google", "biweekly", "needs-proofreading"]
---

## Introduction

I would like to introduce "Bite-sized bytes", which is my approach to me procrastinating multiple articles at once, whilst also providing
a somewhat steady stream of content. Think `microblogging` but a tad-bit bigger, but not as big as regular blogging.

Bite-sized bytes are going to be *bi-weekly*, which means, every other week. I truly hope I can keep that promise, since I am usually very
bad at fullfilling promises (my ass would **not** be a async block)

Today's issue will be about:

- My first time experience with Bluesky, a successor to twitter that uses their own protocol, ATProto.
- The `nix` package manager and first impressions of Home Manager.
- And, finally, first impressions of the Google Pixel 7a (As a low-end phone user)

## A cloudy blue sky in the middle of the summer...

...Is my description of the bluesky logo. To be completely honest, it's beautiful, reminds me of the times where skeumorphic icons were
on it's peak. Can't say the same of the web interface, though. (Before this post was released, they've changed the logo to a butterfly,
furries are happy with this one ;3)

At first glance, BlueSky looks like Twitter, from it's layout to it's colourscheme, it's almost a 1:1 replica of what Twitter is right now.

Some differences are really apparent, for example, the accent is *slightly* darker than the iconic light blue we knew and loved about that
pesky little bird, or the icons, which are somewhat material-like, but are really just [font-awesome icons](https://github.com/bluesky-social/social-app/blob/7e3e6caa1020c6894008dd14ef6ce0e2555920c0/package.json#L48C5-L51C55).

The app, for a newcommer, is confusing. After signing up, if you don't know which people to follow, you are going to have a rather bad time
trying to find an account that you would like to see on your feed. If you don't follow anyone, it will display content from the discover list,
which is, well, disorrienting to say the least.

It's like the "Federated" timeline in fediverse software, where *all* posts from *all* people come through, it's chaos most of the time.

Since I've just created this account, my feed will be "empty" (with empty, I mean that the feed is filled with people/topics that I am not
interested in.) for a while, unless I am willing to put time and effort trying to curate my feed; to be fair, the same happened with mastodon,
but I at least had a friend that already knew of some awesome people who regularly posted there, so like, it didn't feel empty at all. (Thanks
Sneexy!)

There are some stuff that I would like to say that I didn't like, for example, the font. It uses the system's font stack, which kinda makes
it feel like a native app. Except it's not optimized for linux devices, so it uses your browser's "sans-serif" font, which, in my case, it was
Arial, which made the UI look un-professional.

Another gripe that I have with BlueSky, is the lack of discovery options. For instance, there are no such thing as a "hashtag", so curating
feeds before following users is *extremely* dependent in other's feeds.

I've made a small thread with other issues I've found on my first day of using bluesky [here](https://wetdry.world/@amycatgirl/111644066176663279).

Finally, I would like to say that bluesky definitely has it's audience, but perhaps it's not for me. I will give it a proper try in the next
5 months, so make sure to be on the lookout for an article about bluesky!

## Nix, a gateway drug to declaratively managing packages

People have recommended the `nix` package manager over, and over, and over again. I wasn't really sure why, though.

Usually, the main argument is "Having a configuration file declare the packages you need with the configuration you want, all in one place is
really nice", other times it's "reproducible developer enviourments are cool". [^1]

After going back and forth, having an internal dillema (like always), and even considering switching to NixOS just for the funny bit, I *finally*
installed `nix` and gave it a proper try.

To be fair, I've tried it before by trying to go blind in NixOS (Really bad idea) and I initially did not like it, at all. Mainly because I couldn't
find the documentation at that time, and also because NVIDIA drivers, because of course, why wouldn't it be NVIDIA drivers?!

This time arround, I started by learning how to use it with [Determinate Systems' Zero to Nix guide](https://zero-to-nix.com/) then installing
`home-manager`, a program that uses the power of Nix to manage your dotfiles, packages and specific program configuration. So far, I've only configured
starship, and a few XDG variables so that nix-installed apps appear on Pop's application launcher; the experience configuring starship (and bash) has been
pretty good, specially since I was scared of breaking everything and starting from scratch.

But nope! Everything went as planned!

I've also started to add `default.nix` files to some of my projects to give it the `nix-shell` treatment (For example, this site now contains a
`default.nix` file at the root of the repository, so a simple `nix-shell` command gives you `nodejs` and `pnpm` in seconds).

I am looking forward to learning more about configuring more things about my environment, such as Helix, Flatpak and `direnv`.

## The pixel experience as a shitbox user (by shitbox i mean a lowend phone lmao)

I am finally part of #teampixel. This is not a drill. It's real.

Since this year, I've wanted a pixel phone. Why? Because it means having a complete, close to AOSP experience, without compromising performance.

Oddly enough, I don't have much to say about having a pixel, other than "damm, this brick is smooth as butter".

I mean, I am very happy to have one; My old phone (An obscure Altice S32+ that was given for free to my father by our ISP) was really slow and sometimes
it froze to the point of having a completely unusable experience, usually accompanied by crashes and "System UI is not responding" dialogs.

But right now I don't have anything to say. Maybe that's a good thing, or perhaps a bad thing, eh, I won't put too much mind onto it, otherwise I might
end up in a ramble about how attrocious my experience with my phone was.

## Conclusion

Well, to be honest, I don't really know how to conclude things up. I've always sucked at writting these, hence the lack of a proper conclussion on my previous
article. But eh, all things considered, I think that this type of writting a conclusion will become a trend inside other issues of "Bite-sized Bytes".

I still need to pay attention to my english and spanish classes, but ADHD does not really help; that's a matter for another day, though.

Anyway, see you on the next issue! Stay safe out there!

\- Amy

[^1]: https://www.reddit.com/r/NixOS/comments/12o4d4b/have_you_convinced_anyone_to_use_nix_or_nixos/
