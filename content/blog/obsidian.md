---
title: Writing articles with Obsidian
date: 2022-11-20
edited: 2024-04-10
tags:
  - legacy post
  - comparison
  - neovim
  - obsidian
  - markdown
  - blog
---
Writing blogs using neovim is certainly cool and most importantly really efficient but one of my concerns with it is that I cannot really preview in real time what I am writing. For example, let’s say that I have a header, a codeblock and a link.

```
# Header
[amazing link](https://www.youtube.com/watch?v=dQw4w9WgXcQ)
`console.log("amogus")`
```

In Neovim, there is no preview window by default (or any live preview feature whatsoever), meaning that if I want to know how does my blog look, I need to switch to my browser and see if I used the right syntax for the text.

Neovim buffer with a header, a link pointing to a YouTube video and a inline codeblock that says console.log('amogus')

But on obsidian, I don’t have to worry about switching from window to window, since I can view my changes using it's "live preview" feature. So I don’t have that problem any more.

Obsidian on a file containing a header, a link and a inline codeblock that says 'console.log('amogus')

And you might think that “Well, It’s on a terminal. Some things can’t really render correctly on there since it’s all made of text.” and you would be right, terminals aren’t really made to be used as markdown renderers.

Another thing that I like about obsidian is that it has a built-in spellchecker, which I really welcome since my primary language is Spanish, not English (even though that sometimes the spellchecker can get things wrong).

But sadly Obsidian (As far as I am aware) doesn’t support .mdx files (Extended markdown with support for reactive content and other really cool stuff), which at some point, I will use on this blog to show live previews of front-end code without having to touch react/solid/svelte/vue/insert-framework-here
