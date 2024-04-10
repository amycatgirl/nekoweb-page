---
title: "Website Redesign"
description: "An in-depth explanation of how I went from a figma mock-up to a fully functional website"
date: 2024-03-01
tags:
  - redesign
  - blog update
  - graphics design
  - figma
  - bite-sized bytes
  - 11ty
  - nekoweb
  - markdown
  - accessibility
  - a11y
---
<!-- shamelessly ripped without markdown file from my own site, i did not back it up -->
<!-- Things to talk about -->
<!-- Process of making the design/website, what happened with the bi-weekly uploads of byte-sized bytes and what's next -->
<p>Hello again. As you can probably see, my site needed a fresh coat of paint, so I did a makeover of the entire blog, down to the internal templates and domain.</p>
<p>This is the third time I've redesigned this particular site and my 6th iteration of my blog, which I've named after the noble gas: <em>Xenon</em> (because it sounded really cool)</p>
<p>As a treat, I will explain how I redesigned this site from the ground up. I will also talk about what happened to those &quot;bi-weekly uploads&quot; of Bite-sized Bytes, because I didn't forget about it, I just...</p>
<p>Couldn't allocate time to write them.</p>
<p>I'll eventually make a follow-up though. But instead, I am going to talk about how the website was designed, my thought process and the software used to make it.</p>
<h2 id="inspiration" tabindex="-1">Inspiration <a class="header-anchor" href="#inspiration"><span class='material-symbols-outlined center'>tag</span></a></h2>
<p>I would like to shout out two of my main inspirations for this design, because I sure as hell didn't make the concept of minimalist sites.</p>
<p>My main inspiration was <a href="https://bearblog.dev">bear by Herman Martinus</a>. Bear is, in Herman's own words:</p>
<blockquote>
<p>...a blogging platform where words matter most.</p>
</blockquote>
<p>The service is simple to use. Like, <em>really</em> simple to use. Not only that, but bear allows it's users to customize their own blog using themes. There was almost no css, no javascript, <u>no bullshit</u>. Those last two points made me rethink my site as a whole.</p>
<p>I was going for a <em>minimalistic website</em>, not some Maniaplanet rip-off?!</p>
<p>So there I was, thinking. Thinking on <em>how</em> I wanted my blog to be.</p>
<p>Eventually, I came with 3 main goals that I wanted to achieve:</p>
<ol>
<li>
<p>The website needed to be minimal, preferably using some really light or really dark theme and not some shade of pink that was bordering the actual colour.</p>
</li>
<li>
<p>Everything should be perfectly legible and needed to abide to accessibility guidelines</p>
</li>
<li>
<p>The site needed to fit in small devices. Unlike the old design, where... um... It didn't fit on my phone. And a friend of mine actually pointed that out when I first announced the redesign. So... <em>yeah...</em></p>
</li>
</ol>
<h2 id="designing" tabindex="-1">Designing <a class="header-anchor" href="#designing"><span class='material-symbols-outlined center'>tag</span></a></h2>
<p>Designing is one of my favourite pass times, along side coding and drawing the gremlin that is my character. So this wasn't much of a chore.</p>
<p>I started by opening a new Figma project and placing a 1920x1080 frame. I started by replicating the old layout my website still had, which was inspired by Ubisoft Nadeo's Maniaplanet client, which used a headerbar that had a centred title with a glowing bar at the top (my design had it at the bottom though).</p>
<div class="image">
    <img alt="Screenshot of a maniaplanet modal for its editor. The modal's title says 'Editor Type' and it has a few options, those being, 'Editor Editor', 'Map editor', 'Mesh modeler', 'Module Studio' and 'Pixelart Editor'" src="https://blog.maniaplanet.com//uploads/2016/11/EditorEditor_NewFile.png">
    <p>Screenshot of a maniaplanet modal for its editor. The modal's title says "Editor Type" and it has a few options, those being, "Editor Editor", "Map editor", "Mesh modeler", "Module Studio" and "Pixelart Editor"</p>
</div>
<p>Then, I started playing with different layouts, spacing of elements and typography.</p>
<p>First, I wanted to use <span class="serif">a serif font</span>. A day later I told myself</p>
<blockquote>
<p>nah, it won't fit</p>
</blockquote>
<p>So I switched to a font pair consisting of IBM Plex Sans and Inter.</p>
<p>Then I tried aligning all elements to the centre, which turned out to be great choice.</p>
<p>Then, I had to design components from the ground up, since I am not working with any UI frameworks for simplicity's sake. All of the components used on my site are available on my figma project, which you can view on the embed below:</p>
<iframe style="border: 1px solid rgba(0, 0, 0, 0.1);" width="560" height="450" src="https://www.figma.com/embed?embed_host=share&url=https%3A%2F%2Fwww.figma.com%2Ffile%2FpAp2AFzovBJIVzMTMZDJDC%2FBlog---Design-Draft%3Ftype%3Ddesign%26node-id%3D39%253A127%26mode%3Ddesign%26t%3DzmBu47phPmYV2FpS-1" allowfullscreen></iframe>
<p>Prototyping the layout was really easy, thanks to Figma's Auto Layout feature, which are literally CSS flexboxes. I finished the layouts in about a day and a half, which in my terms is pretty impressive, since I tend to take less than 2 hours in projects as small like this.</p>
<h2 id="implementing-the-design" tabindex="-1">Implementing the design <a class="header-anchor" href="#implementing-the-design"><span class='material-symbols-outlined center'>tag</span></a></h2>
<p>Doing the layout in HTML and CSS was as easy as I could possibly think, since it's literally a bunch of flex columns and rows.</p>
<p>What was not easy was making everything consistent in smaller screens, something that I haven't quite thought of testing on figma, so I had to either do trial and error to see how I can adapt my design to smaller screens or attempt to design something in figma, which was going to take even more time.</p>
<p>Of course I did the former, because I love trying new stuff randomly and see what sticks :3c</p>
<h3 id="tags-they-look-so-pretty" tabindex="-1">Tags: They look so pretty! <a class="header-anchor" href="#tags-they-look-so-pretty"><span class='material-symbols-outlined center'>tag</span></a></h3>
<p>One thing I definitely liked about this design was the fact that the tags now look like candy. Like, they look like those multicoloured candy rolls called Smarties.</p>
<p>Like, just look at them!</p>
<div class="image">
    <img alt="Screenshot of Figma showing the new tag/chip designs. There are white, blue, red, green, purple and orange chips, which kinda look like the smarties candy roll. I added a small image of the candy below." src="/assets/figmaballs.png">
    <p>Screenshot of Figma showing the new tag/chip designs. There are white, blue, red, green, purple and orange chips, which kinda look like the smarties candy roll. I added a small image of the candy below.</p>
</div>
<h3 id="purrfectly-not-found" tabindex="-1">Purrfectly not found <a class="header-anchor" href="#purrfectly-not-found"><span class='material-symbols-outlined center'>tag</span></a></h3>
<p>The 404 page didn't receive much attention in prior designs. It consisted of a simple message telling you that the page you were looking for was not there and a link to go back.</p>
<p>This time, I decided that it needed a little makeover too, because it was too boring and serious looking (which isn't what I want this blog to look like!)</p>
<p>So I added a cat.</p>
<p>Yeah. Just a cat.</p>
<div class="image">
    <img class="outlined" alt="Image of this site's 404 page. It consists of a image, a header and a description. You can go to any invalid url within this site and it should appear." src="/assets/catfound.png">
    <p>Image of this site's 404 page. It consists of a image, a header and a description. You can go to any invalid url within this site and it should appear.</p>
</div>
<p>Oh, almost forgot. I also expanded the description a bit.</p>
<h3 id="a-proper-display-for-social-media" tabindex="-1">A proper display for social media <a class="header-anchor" href="#a-proper-display-for-social-media"><span class='material-symbols-outlined center'>tag</span></a></h3>
<p>Another thing that didn't receive much love in older iterations was the page where I displayed my social media profiles.</p>
<p>So I decided to rework it a little bit by adding some nice looking cards and small descriptions about those sites. I also added a &quot;Buttons&quot; section where <strong>you</strong> (yes, you) could add your own 88x11 button! You need to ask me though, so <a href="/about#qna">contact me</a> and I'll add you with pleasure!</p>
<h2 id="switching-providers" tabindex="-1">Switching providers <a class="header-anchor" href="#switching-providers"><span class='material-symbols-outlined center'>tag</span></a></h2>
<p>Another thing that was overdue was to switch website providers. Before, I was using <a href="https://codeberg.page">Codeberg Pages</a>. Which, don't get me wrong, is a great service (After all, revoltMini is hosted there).</p>
<p>But Codeberg was being really unreliable, mainly due to the service going down via DDOS attacks or server maintenance, which is really annoying when the site goes down and I want to push a commit (This has happened 3 times in total).</p>
<p>So I decided to further decentralize my workflow. Firstly, I am switching to <a href="https://git.gay">git.gay</a>, which is a really solid git provider that my friends use for their projects/websites and they've had no issues so far. And lastly, my page is now hosted in <a href="https://nekoweb.org"><em>nekoweb</em></a>, which is a neocities alternative that was recommended to me in a <a href="https://tech.lgbt/@timayo/112011624624512657">mastodon post</a>.</p>
<h3 id="what-about-your-codeberg-account" tabindex="-1">What about your Codeberg account? <a class="header-anchor" href="#what-about-your-codeberg-account"><span class='material-symbols-outlined center'>tag</span></a></h3>
<p>Don't worry, it won't go away. Well, actually, do worry a little bit.</p>
<p>Some repos will be moved to their git.gay counterpart, but a bidirectional mirror will be set up for them, so you can still contribute to my projects from Codeberg</p>
<p><em>When are we getting federated git instances though?</em></p>
<h2 id="final-thoughts" tabindex="-1">Final thoughts <a class="header-anchor" href="#final-thoughts"><span class='material-symbols-outlined center'>tag</span></a></h2>
<p>Redesigning my website was the right call. But, even though it was a fun experience and I had no trouble adapting my existing codebase, I don't want to do it again.</p>
<p>It's really tiring and time consuming. I spent 4 days designing, prototyping and reworking each and every single part of my blog.</p>
<p>You can see the full design documents <a href="https://www.figma.com/file/pAp2AFzovBJIVzMTMZDJDC/Blog---Design-Draft?type=design&amp;node-id=39%3A127&amp;mode=design&amp;t=zmBu47phPmYV2FpS-1">here</a> and the code will be made available once I start migrating from Codeberg.</p>
<h2 id="what-about-bite-sized-bytes-though" tabindex="-1">What about Bite-sized Bytes though? <a class="header-anchor" href="#what-about-bite-sized-bytes-though"><span class='material-symbols-outlined center'>tag</span></a></h2>
<p>Yeah... About that...</p>
<p>See, I don't have a lot of time at my disposal. Most of the time I spend juggling between my responsibilities, social media, friends, code and reading. So adding writing to the unorganized conglomerate that is my calendar/task list would be brutal.</p>
<div class="image">
    <img alt="Screenshot of a task that reads 'Write overdue Bite-sized Bytes article'" src="/assets/ohno.png">
    <p>Screenshot of a task that reads "Write overdue Bite-sized Bytes article", the task was added 4 months ago. Oops! O-O</p>
</div>
<p>So I am switching from a bi-weekly format to a monthly format to make it easier to organize for me.</p>
<p>The format will be pretty much still the same as last time; I talk about live developments, my opinions over certain topics and even showcasing cool websites I find.</p>
<hr>
<p>On that note, I would like to thank everyone who supported me these 3 months, and some special thanks to <strong>Sneexy</strong>, <strong>Loki</strong>, <strong>Max</strong> and <strong>Rexogamer</strong>.</p>

