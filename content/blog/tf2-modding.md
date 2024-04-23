---
title: Making custom weapon skins for Team Fortress 2
date: 2022-11-22
edited: 2024-04-10
tags:
  - legacy post
  - team fortress 2
  - valve
  - gaming
  - tutorial
  - modding
---
<p>Have you ever dreamed of customizing your weapons to look cool and unique? or maybe you wanted to have a certain warpaint but you don’t have the money to afford it?</p>
<p>Yeah, me neither, but if you really want to learn about modding TF2 and learn more about the source tool set, this is the right place to start!</p>
<h2 id="prerequisites" tabindex="-1">Prerequisites <a class="header-anchor" href="#prerequisites"><span class='material-symbols-outlined center'>tag</span></a></h2>
<p>You need the following programs installed on your PC:</p>
<ul>
<li>GCFScape (Used to open/extract files from .vpk packages)</li>
<li>.Net Framework 4</li>
<li>MS Visual Studio C++ 2010 Runtime</li>
<li>VTFEdit (Used to open .vtf files and convert images to .vtf textures)</li>
<li>.Net Framework 2</li>
<li>MS Visual C++ 2005 Runtime</li>
<li>Any photo editing software</li>
<li>A working installation of Team Fortress 2 and Steam</li>
</ul>
<h2 id="getting-the-textures" tabindex="-1">Getting the textures <a class="header-anchor" href="#getting-the-textures"><span class='material-symbols-outlined center'>tag</span></a></h2>
<p>Now we will get the textures from the TF2 Packages, but first we need to locate your tf/ folder. To get there, go to your steam library, right-click Team Fortress 2, hover your mouse under “Manage”, and click “Browse Local Files”.</p>
<p>Right Click Team Fortress 2, Manage, Browse Local Files</p>
<p>This should open the Team Fortress 2 folder on Explorer (Or if on Linux, your default file manager). Then navigate to the tf directory. You should see the folders:</p>
<pre><code>Team Fortress 2
  |  custom (We will use this folder later)
  |  cfg
  |  maps
  |  sound
  |  materials
  |  media
  |  resource
  |  scripts
</code></pre>
<p>On the tf directory, look for the <code>tf_textures_dir.vpk</code> file.</p>
<p>And Open it using GCFScape by right-clicking the file and clicking “Open With GCFScape” or open the “Open With…” dialog.</p>
<p>After opening the file, you should see a folder called materials, now navigate to the following directory: <code>materials/models/weapons/c_models</code></p>
<p>Now select the weapon of your choice. For this tutorial, I will use Scout’s Scattergun.</p>
<p>Navigate to the <code>c_scattergun</code> folder and select the <code>c_scattergun.vtf</code> file. This file contains the textures for the scattergun model, which we will edit in a bit. But first, we need to get the file out of the <code>tf2_textures_dir.vpk</code> file. To do so, right click the file then click “Extract”.</p>
<p>Select the folder you want the scattergun texture to be, let’s say “Documents”, and click “Ok”. And now you should have the texture file on your PC/Laptop!</p>
<h2 id="editing-the-textures" tabindex="-1">Editing the Textures <a class="header-anchor" href="#editing-the-textures"><span class='material-symbols-outlined center'>tag</span></a></h2>
<p>Now that we have the texture file that we need to edit, we need to convert it into a format that our image editing program can read!</p>
<p>And that’s where VTFEdit comes in. Now, navigate to the folder you extracted the file to and open the c_scattergun.vtf file with VTFEdit by double-clicking the file (or by using the right-click, “Open with…” method).</p>
<p>Then, click “File”, click “Export” and select “PNG Files (*.png)”, then click “Ok”</p>
<p>Now open the converted file on your image editor and change whatever you want. To not loose quality, save it as a .tga file, but you can save it as a <code>.png</code> or <code>.jpg</code> file as well.
Converting Images to Textures</p>
<p>We are almost there!</p>
<p>Now we need to convert the .tga/.png/.jpg file to a format that TF2 can read. We can do it using VTFEdit.</p>
<p>Open the file by clicking “Import” on the “File” Menu and select the file you just edited then click “Ok” on the next prompt. After it loads the file, click “File”, click “Save” and save it under the same filename (<code>c_scattergun.vtf</code>).</p>
<h2 id="loading-the-textures-in-game" tabindex="-1">Loading the textures In-game <a class="header-anchor" href="#loading-the-textures-in-game"><span class='material-symbols-outlined center'>tag</span></a></h2>
<p>To try out your newly created warpaint/texture, you need to import it into the game. Remember that custom folder from earlier?</p>
<p>You need to create a few folders now.</p>
<p>Here is the file structure you need to follow</p>
<pre><code>custom (/tf/custom)
| my_new_mod (Your mod folder)
    | materials
         | weapons
             | c_models
                 | c_&lt;weapon_name&gt; (replace &lt;weapon_name&gt; with the selected weapon)
                     | c_&lt;weapon_name&gt;.vtf
</code></pre>
<p>And done! You have successfully created a custom weapon texture/warpaint all by yourself! To try it yourself, open TF2, and open the developer console, then type the following command:</p>
<pre><code>map itemtest
</code></pre>
<p>And you should see the skin in action!</p>
<h2 id="limitations" tabindex="-1">Limitations <a class="header-anchor" href="#limitations"><span class='material-symbols-outlined center'>tag</span></a></h2>
<p>There is a few limitations that might prevent your skin from working properly, this limitations include:</p>
<ul>
<li>Not being able to load under <code>sv_pure 1</code> enabled servers</li>
<li>Other players can’t see it</li>
</ul>
<h2>Notes</h2>
<p>Some weapons aren’t included in the c_models folder, and have separate folders outside of the c_models folder. For those, you need to edit the v_ and w_ variants (v_ is the viewmodel, w_ is the weapon seen in third person). Some models include:</p>
<ul>
<li>The sandman’s baseball</li>
<li>Sniper’s SMG</li>
<li>Sniper’s AWP</li>
<li>Pyro’s Fire Axe</li>
<li>Spy’s Cigarette Case</li>
<li>Engineer’s PDA</li>
</ul>
<p>Warpaints are stored under <code>materials/models/workshop/weapons/c_models</code> and doesn’t require editing other files.</p>
