---
title: Set up Revolt for development
date: 2023-12-07
updated: 2023-12-11
tags: ["revolt", "backend", "rust", "docker"]
description: Extensive tutorial on how to set up Revolt, an open source, contributor-backed, discord/slack alternative for communities
---

## Table of contents
- [Introduction](#introduction)
- [Software Requirements](#software-requirements)
- [Hardware Requirements](#hardware-requirements)
- [Prerequisites](#prerequisites)
    - [Docker](#docker)
    - [Rust Toolchain](#rust-toolchain)
    - [VSCode + Rust Analyzer](#vscode-and-rust-analizer)
    - [NodeJS](#nodejs)
- Setup
    - [Autumn and January (through docker-compose)](#autumn-and-january-through-docker-compose)
    - [Bonfire](#bonfire)
    - [Delta](#delta)
    - [Client](#client)
        - [revoltchat/frontend](#revoltchatfrontend)
        - [revoltchat/revite](#revoltchatrevite)
- [Conclusion](#conclusion)
- [Sources and more information](#sources-and-more-information)

## Introduction

Heya! Amy here.

Today, I wanted to share a semi-complete walkthrough of how to configure revolt.chat's backend microservices for local development, just in case
you want to add a new feature, squash some bugs or even make your own third-party instance backend.

This guide will only cover development specific scenarios, such as setting up VSCode for Rust development, docker and more. If you want to host your
own instance, you might have better luck with [Revolt's official instructions](https://github.com/revoltchat/self-hosted).

That being said, let's quickly go over software and hardware requirements.

## Software Requirements

- Docker (Compose CLI/Standalone is completely optional, as Docker comes with `docker compose` in the form of a installable plugin [^1])
- Rust 1.70 or higher (Installing through `rustup` is recommended) [^2]
- NodeJS 16.x LTS or higher [^4]
- Git

### Optional Requirements
- Yarn or PNPM (Don't know which one to choose? Check the Client section of this article!)
- Mold (Highly recommended but optional. Used to speed up linking times, specially useful for developers) [^5]


## Hardware Requirements

- Any modern Multi-core CPU
- 30GB of storage at minimum
- At least 4GB of free memory, as stated by [Revolt's contributing guide](https://developers.revolt.chat/contributing)

Any computer that checks these three boxes should be enough. No need to be overkill.

## Prerequisites

Let's go through how to set up the project's prerequisites, starting with the Docker Engine.

### Docker

To install docker, you should follow [Docker's guide](https://docs.docker.com/get-docker/) on how to install it's engine for your operative system. On this tutorial,
we are going through how to install it on Ubuntu Linux, using `snap` as our package manager (I can already feel the linux peeps getting angry at me :3c).

To install docker, run the following command:

```bash
snap install docker
```

After it's successfully installed, you need to add yourself to the docker group. This is necesary to do if you want to run docker containers without having to use
the superuser account. To do that, use `usermod -aG docker $USER`, then apply the changes using `newgrp docker`.

To check if docker is working, run the following:

```bash
docker pull hello-world
docker run hello-world
```

If everything went correctly, you should see the following output:

```
amy@catcat:~$ docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
1. The Docker client contacted the Docker daemon.
2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
(amd64)
3. The Docker daemon created a new container from that image which runs the
executable that produces the output you are currently reading.
4. The Docker daemon streamed that output to the Docker client, which sent it
to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
$ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
https://hub.docker.com/

For more examples and ideas, visit:
https://docs.docker.com/get-started/

```

Snap's docker distribution already comes with the `compose` plugin, if you installed docker through other mediums, you should check out
this guide on how to install the compose plugin. Please note that the compose plugin is entirely optional if you are using the `docker-compose`
CLI, even though Docker against using the CLI. [^6]

### Rust Toolchain

Installing the Rust toolchain is very simple.

There is a installer/version manager available for Windows and UNIX systems (That is, MacOS/Linux/OpenBSD/etc) over at rustup.rs

Follow the instructions provided by the script/installer and you should be good to go.

### VSCode and Rust Analizer

For a better developer experience, Revolt recommends developers to use [Visual Studio Code](https://code.visualstudio.com/?utm_source=amycatgirl)
alongside the Rust Analizer extension [^4].

Note that this tutorial will only cover everything linux, not windows. Windows users can probably figure these steps out, as the installer is
*pretty* straight forward.

Of course, you can use whatever editor you'd like, but for the sake of this tutorial, I am going through the steps to install VSC and
rust-analizer.

Start by downloading the latest package from VSC's Website over at https://code.visualstudio.com

If you are running a debian-based linux distribution, grab the `.deb` package and install it using:

```bash
sudo dpkg -i /home/amy/path/pointing/to.deb
```

On the other hand, if you are running a RHEL-based distribution, you should follow the following steps.

```bash
# Import Microsoft Package Registry's GPG Key
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

# Add VSC's Repository
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
```

After adding Visual Studio Code's repository, you can install it by using

```bash
sudo dnf install code
```

If you are using `yum` instead run

```bash
sudo yum install code
```
[^7]

Now that you have VSC installed, let's also install the `rust-analizer` extension.

Open the extensions menu through the sidebar by clicking the puzzle piece icon, then search for `rust analizer`.

You should see an extension called "Rust Analizer" by The Rust Programming language (You can check that is theofficial one with the
verified checkmark on the author's name), click install and you should be ready to go!

### NodeJS

Installing Node is as easy as installing rust. This part is optional if you are willing to use third-party clients such as Retaped or RevoltMini (See Third-party clients)

I recommend using `nvm` to easily manage node versions, you can follow NVM's instructions on [GitHub](https://github.com/nvm-sh/nvm#installing-and-updating).

You can also use your system's package manager to install `node`, for example, you can install it using `dnf` [^9]

```bash
sudo dnf install nodejs
# On older fedora versions
# sudo dnf module install nodejs:18
```

After installing, check that you have `node` on your path by running the `node -v` command.

To install `yarn` or `pnpm`, you can either enable `corepack` by running `corepack enable` or by running the following commands

```bash
# Yarn
npm i -g yarn

# PNPM
npm i -g pnpm
```

## Setup

After installing all prerequisites, you can now start setting up revolt's `backend` and `frontend` for your development needs.

Start with cloning the monorepo with git

```bash
git clone https://github.com/revoltchat/backend
cd backend
```


### Autumn and January (Through Docker Compose)

Autumn and January are really easy to set up. Copy over the `.env.example` file and rename the copy to `.env`

Inside the file, you should see the following:

```env
# MongoDB URI
MONGODB=mongodb://localhost

# URL to where the Revolt app is publicly accessible
REVOLT_APP_URL=http://local.revolt.chat:5000

# URL to where the API is publicly accessible
REVOLT_PUBLIC_URL=http://local.revolt.chat:8000
VITE_API_URL=http://local.revolt.chat:8000

# URL to where the WebSocket server is publicly accessible
REVOLT_EXTERNAL_WS_URL=ws://local.revolt.chat:9000

# URL to where Autumn is publicly available
AUTUMN_PUBLIC_URL=http://local.revolt.chat:3000

# URL to where January is publicly available
JANUARY_PUBLIC_URL=http://local.revolt.chat:7000

# URL to where Vortex is publicly available
# VOSO_PUBLIC_URL=https://voso.revolt.chat


##
## hCaptcha Settings
##

# If you are sure that you don't want to use hCaptcha, set to 1.
REVOLT_UNSAFE_NO_CAPTCHA=1

# hCaptcha API key
# REVOLT_HCAPTCHA_KEY=0x0000000000000000000000000000000000000000

# hCaptcha site key
# REVOLT_HCAPTCHA_SITEKEY=10000000-ffff-ffff-ffff-000000000001


##
## Email Settings
##

# If you are sure that you don't want to use email verification, set to 1.
REVOLT_UNSAFE_NO_EMAIL=1

# SMTP host
# REVOLT_SMTP_HOST=smtp.example.com

# SMTP username
# REVOLT_SMTP_USERNAME=noreply@example.com

# SMTP password
# REVOLT_SMTP_PASSWORD=CHANGEME

# SMTP From header
# REVOLT_SMTP_FROM=Revolt <noreply@example.com>


##
## Application Settings
##

# Whether to enable staging only features
REVOLT_IS_STAGING=1

# Whether to only allow users to sign up if they have an invite code
REVOLT_INVITE_ONLY=0

# Maximum number of people that can be in a group chat
REVOLT_MAX_GROUP_SIZE=150

# VAPID keys for push notifications
# Generate using this guide: https://gitlab.insrt.uk/revolt/delta/-/wikis/vapid
# --> Please replace these keys before going into production! <--
REVOLT_VAPID_PRIVATE_KEY=LS0tLS1CRUdJTiBFQyBQUklWQVRFIEtFWS0tLS0tCk1IY0NBUUVFSUJSUWpyTWxLRnBiVWhsUHpUbERvcEliYk1yeVNrNXpKYzVYVzIxSjJDS3hvQW9HQ0NxR1NNNDkKQXdFSG9VUURRZ0FFWnkrQkg2TGJQZ2hEa3pEempXOG0rUXVPM3pCajRXT1phdkR6ZU00c0pqbmFwd1psTFE0WAp1ZDh2TzVodU94QWhMQlU3WWRldVovWHlBdFpWZmNyQi9BPT0KLS0tLS1FTkQgRUMgUFJJVkFURSBLRVktLS0tLQo=
REVOLT_VAPID_PUBLIC_KEY=BGcvgR-i2z4IQ5Mw841vJvkLjt8wY-FjmWrw83jOLCY52qcGZS0OF7nfLzuYbjsQISwVO2HXrmf18gLWVX3Kwfw=


##
## Vortex configuration
##

# VOSO_MANAGE_TOKEN=CHANGEME
```

If you aren't running a reverse-proxy (or don't want to), change all instances of `http://local.revolt.chat` to `http://localhost`

Then, run `docker compose up -d`

After pulling the images and starting the containers, you should be able to go to http://localhost:3000 and get a 200 response from Autumn.

### Bonfire

Bonfire is Revolt's websocket server, it handles incoming messages, updates, new data and more.

To run Bonfire, run the following command: [^4]

```bash
cargo run --bin revolt-bonfire
```

If you want to use `mold`, run this instead:

```bash
mold -run cargo run --bin revolt-bonfire
```

### Delta

Delta is Revolt's API server. It's a tad bit harder to set up as there isn't documentation on how to do so, other than run `x` command.

To configure, you need to first edit a separate configuration file located at `crates/core/src/config/Revolt.toml`, the file looks like this:

```toml
[database]
mongodb = "mongodb://database"
redis = "redis://redis/"

[hosts]
app = "http://local.revolt.chat"
api = "http://local.revolt.chat/api"
events = "ws://local.revolt.chat/ws"
autumn = "http://local.revolt.chat/autumn"
january = "http://local.revolt.chat/january"
voso_legacy = ""
voso_legacy_ws = ""

[api]
staging = false

[api.registration]
invite_only = false

[api.smtp]
host = ""
username = ""
password = ""
from_address = ""

[api.vapid]
private_key = "LS0tLS1CRUdJTiBFQyBQUklWQVRFIEtFWS0tLS0tCk1IY0NBUUVFSUJSUWpyTWxLRnBiVWhsUHpUbERvcEliYk1yeVNrNXpKYzVYVzIxSjJDS3hvQW9HQ0NxR1NNNDkKQXdFSG9VUURRZ0FFWnkrQkg2TGJQZ2hEa3pEempXOG0rUXVPM3pCajRXT1phdkR6ZU00c0pqbmFwd1psTFE0WAp1ZDh2TzVodU94QWhMQlU3WWRldVovWHlBdFpWZmNyQi9BPT0KLS0tLS1FTkQgRUMgUFJJVkFURSBLRVktLS0tLQo"
public_key = "BGcvgR-i2z4IQ5Mw841vJvkLjt8wY-FjmWrw83jOLCY52qcGZS0OF7nfLzuYbjsQISwVO2HXrmf18gLWVX3Kwfw="

[api.fcm]
api_key = ""

[api.security]
authifier_shield_key = ""
voso_legacy_token = ""

[api.security.captcha]
hcaptcha_key = ""
hcaptcha_sitekey = ""

[api.workers]
max_concurrent_connections = 50

[features]

[features.limits]

[features.limits.default]
group_size = 100
bots = 5
message_length = 2000
message_embeds = 5
message_replies = 5
message_attachments = 5
message_reactions = 20
servers = 100
server_emoji = 100
server_roles = 200
server_channels = 200

attachment_size = 20000000
avatar_size = 4000000
background_size = 6000000
icon_size = 2500000
banner_size = 6000000
emoji_size = 500000
```

Again, replace all instances of `http://local.revolt.chat` with `http://localhost` **but**, you need to also include the ports provided in the project's `.env` file.

For example:

```txt
# .env
REVOLT_PUBLIC_URL=http://localhost:8000

# Revolt.toml
api = "http://localhost:8000"
```

You should also change `mongodb = "mongodb://database"` to `mongodb = "mongodb://localhost"`

Then run: [^4]

```bash
cargo run --bin revolt-delta
```

Again, if using mold:

```bash
mold -run cargo run --bin revolt-delta
```

If you don't replace these variables, Vortex will fail to launch, as database migrations will result in a timeout.

### Client

Welcome to the final stretch! Don't worry, this is the last step of the setup phase, the backend *should* now work as expected.

There are a few things that need to be mentioned though.

Having a client is completely optional, you can make an account by using the API routes exposed by Delta, but it's more convenient to use a client.

There are 2 types of clients, First-Party and Third-Party.

First-Party clients are clients that are officially managed and maintained by the Revolt Team, these include:
- revoltchat/frontend
- revoltchat/revite
- revoltchat/android (Closed Beta)
- revoltchat/ios (Unreleased)

Third-Party clients, in the other hand, are completely community-led. There are multiple clients available, but I am going to mention a few:
- error-404-null-not-found/retaped [[Link]](https://meowcity.club/retaped/src/?utm_source=amycatgirl) [[GitHub]](https://github.com/error-404-null-not-found/retaped)
- itzthemeow/svolte [[Link]](https://revolt.itsmeow.cat/?utm_source=amycatgirl) [[GitHub]](https://github.com/itzthemeow/revolt-svolte)
- revoltchat/rvmob [[GitHub]](https://github.com/revoltchat/rvmob)
- revoltchat/mutiny [[GitHub]](https://github.com/revoltchat/mutiny)
- vloddot/jolt [[GitHub]](https://github.com/vloddot/jolt)
- amycatgirl/revoltmini [[Link]](https://amycatgirl.codeberg.page/revoltmini/?utm_source=amycatgirl) [[codeberg]](https://codeberg.org/amycatgirl/revoltmini)

Support for third-party clients can be found on the [Unofficial Clients Server](https://rvlt.gg/unofficialclients)

This part will help you set up first-party clients, other clients might have instructions on how to set them up.

### revoltchat/frontend

This is the new and improved client, built from the ground up using SolidJS. Although this client is **not** ready for production, you could host it in the mean
time, as others might prefer this client.

Note that, since writting this article, Frontend does not support signup yet, so you might need to manually create a user using the appropiate API route.

Also note that you need to have `pnpm` installed.

To host it, follow instructions on [frontend's GitHub](https://github.com/revoltchat/frontend/?utm_source=amycatgirl)

You need to change the `VITE_API_URL` variable so that it points to `localhost` before you can use it.

### revoltchat/revite

This is the current revolt client, available through https://app.revolt.chat

The client has near perfect feature parity with the backend. But it's deprecated by the upcoming [revoltchat/frontend](#revoltchatfrontend) repo. It's the recommended
client to host for daily users and development.

Note that you need to have `yarn` installed.

To host it, follow instructions on [revite's GitHub](https://github.com/revoltchat/revite/?utm_source=amycatgirl)

You need to change the `VITE_API_URL` variable in `.env` to `http://localhost:8000` before you can use it.

## Conclusion

Congratulations on setting up Revolt on your machine!

From here on out, you can do whatever you want with the codebase (well, as long as you stick by the AGPLv3 license of course), add new features,
fix bugs, contribute to revolt's projects, *et cetera*.

This is also my first, lenghty article on this blog! Feel free to point out typos, misunderstanding and erroneous information! After all, feedback is always welcome here.

If you want to learn more about a certain topic, you can use the sources provided below.


[^1]: Docker. (2020b, February 10). Overview of Docker Compose. Docker Documentation; Docker. https://docs.docker.com/compose/

[^2]: Github. (2023b, December 6). Revolt Backend. GitHub; Microsoft. https://github.com/revoltchat/backend

[^3]: Github. (2023a, December 5). Self-hosted. GitHub; Microsoft. https://github.com/revoltchat/self-hosted

[^4]: Makles, P. (2021, July 12). Contribution guide (S. L & Kuhnchris, Eds.). Developers.revolt.chat; Revolt Communications. https://developers.revolt.chat/contributing

[^5]: Ueyama, R. (2023, December 7). mold: A Modern Linker. GitHub. https://github.com/rui314/mold

[^6]: Docker. (2020a, February 10). Install Docker Compose. Docker Documentation; Docker. https://docs.docker.com/compose/install/

[^7]: Microsoft. (n.d.-a). Running Visual Studio Code on Linux. Code.visualstudio.com; Microsoft. Retrieved December 7, 2023, from https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions

[^8]: Microsoft. (n.d.-b). rust-analyzer - Visual Studio Marketplace. Marketplace.visualstudio.com; Microsoft. Retrieved December 7, 2023, from https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer

[^9]: The OpenJS Foundation. (n.d.). Installing Node.js via package manager | Node.js. Nodejs.org; The OpenJS Foundation. Retrieved December 8, 2023, from https://nodejs.org/en/download/package-manager#centos-fedora-and-red-hat-enterprise-linux
