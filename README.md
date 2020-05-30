# HCMCPVP Server Suite

## Introduction

The day has finally come where you are able to run your very own local version of the HCMCPVP server network. This suite is feature-complete and comes with all game modes of the re-launched HCMCPVP network, with everything ready to go after a very quick (I promise) installation procedure. You shouldn't need to configure anything (except making yourself admin) and everything should be ready to be played with from the start. There are some issues here and there however, which we will talk about in a bit.

# Installation

## Pre-Requisites

This suite includes a bungee server, a database server, and three separate Minecraft servers (lobby, dungeons, and survival), and thus requires quite a bit of power to run properly. If you don't have a super powerful computer/server, but really want to play some of the games, don't worry as we'll go over how to disable some of the features further down below.

To run this suite I'll personally recommend:

- Minimum 8 core processor @ 2.5Ghz
- Minimum 8GB RAM (ideally 16GB+)
- About 10GB of free storage space (40GB+ if you intend on downloading the data files as well)

## Download

Every great adventure begins with a single step. In this case, go ahead and either clone this repository or download it as a zip file into a folder of your choosing. Be sure to pick an **empty folder** or create a new one, since the server network will generate a bunch of files.

Next, download the images from the `images/` folder at https://cloud.polskalemon.com/s/bojFwmASeFdkSoZ and place them into the same directory.

If you also want all of the data files, such as HCMCPVP's own worlds, everyone's built dungeons, warp data, and so on, you can find that in the `data/` folder here: https://cloud.polskalemon.com/s/bojFwmASeFdkSoZ

## Docker

To run this ensemble of servers, you will need **Docker**. Go ahead and get the version for your operating system here: https://www.docker.com/

**Linux users beware** as you will also need the `docker-compose` package.

Once you have installed Docker, simply go ahead and install all of the provided images, by opening either a **Terminal** (Linux & Mac), or a **Command Line** (Windows) in the folder where you downloaded this repo.

Continue by installing the images that were provided. Be sure to install **all** images, even if you intend to not run some of the servers, as it'll make things a lot easier for you if you ever decide to change your mind.

To install the images, run the following commands one by one:
```bash
docker load -i hcmcpvp.bungee.legacy.tar.gz
docker load -i hcmcpvp.hub.legacy.tar.gz
docker load -i hcmcpvp.survival.legacy.tar.gz
docker load -i hcmcpvp.dungeons.legacy.tar.gz
```

Once you have done so, feel free to delete the `.tar.gz` files, you won't need them anymore.

## Initial Configuration

Within the folder you've downloaded are two files that will need to be changed: `.env` and `.env-mysql`.

The `.env` file contains some info that will be passed on to the Minecraft servers, including the infamous `EULA` setting. Read their EULA and if you agree with it, set `EULA=true` in the `.env` file, otherwise the servers won't start.

Also in the `.env` file is the variable `MYSQL_PASS`. This is the password the Minecraft servers will use to communicate with the included database server. Set this to whatever you wish, just make sure it's typed in one word. You won't need this password ever, and nothing *should* be at risk if you don't change it, but it's still a good idea to set it to something secure.

## Done!

With these simple steps completed, your HCMCPVP network is now ready to go. If this is all you want, you can go ahead and skip to the section "Starting/Stopping the Network", but if you want to use the original HCMCPVP data and/or run the servers a little differently than default, keep reading on.

# Further Configuration

## IMPORTANT

Do not make any changes to the network while it is running! Doing so may lead to unexpected consequences, many of which result in your network not being able to start. In such a case, the only solution is often a complete reset, so try and avoid that for your own sanity!

## Using HCMCPVP-Original Data

### What is included?

As an optional part of this server network, you can download HCMCPVP-original data for each server, which contains everything including worlds, player dungeons, as well as player data including warps, inventories, etc. This means that if you are playing on someone else's server using HCMCPVP-original data, it's probably a good idea to move your base, since everyone can in theory know everyone's warps they made before the publication :)

We have, however, removed some parts of the data set, that is information we consider to be personal, including but not limited to credit purchase history, owned credit store items, and premium membership history. This means that if you had a premium membership on HCMCPVP, or bought credit store items, you will not have any of these things on your local installation. However, it is not impossible to simply give those items to yourself later on.

### How to install it

Download the parts of the dataset that interest you from the `data/` folder at https://cloud.polskalemon.com/s/bojFwmASeFdkSoZ and put all `.tar.gz` files into the same folder containing `docker-compose.yml`. Extract those files using a decompression tool like `tar` or `WinRaR`. If your tool asks you where to extract it, select the current folder. Depending on your CPU and storage device, the extraction may take very long, but don't worry as this is normal.

If you've decided to download the `hcmc-db-full.sql` file, put that into the `db/` folder. Rename the `hcmc-db.sql` file into `hcmc-db-empty.sql`, and rename the newly downloaded `hcmc-db-full.sql` file into `hcmc-db.sql`. This will ensure the server builds the database with the full dataset.

### Done!

With the `.tar.gz` files extracted and the `hcmc-db-full.sql` file placed in `db/` and renamed properly, you can now safely delete the `.tar.gz` files you've just downloaded, or keep them if you want to be able to have a clean start every now and then.

### Troubleshooting: Empty Database

If you've already started the server once before downloading the database, and now wish to update it, you will need to delete the volume the `hcmc-dbhost` container has created, otherwise it will simply load the empty database again. You will need to consult Google on how to do that, since the location where Docker stores its volumes is different depending on how you installed it.

## Disabling Servers

If you don't want to run the full network, you can disable some of the servers. First, make a copy of the original `docker-compose.yml` and `bungee/config.yml` files so you can restore them if something goes wrong.

To disable a server, you will need to remove its references from both files. We'll do this based on the example of the **survival** server.

1. Open `docker-compose.yml`
2. Under `hcmc-bungee > depends_on`, remove the entry for `hcmc-survival`
3. Remove the `hcmc-survival` node and all of its child nodes
4. Save & close `docker-compose.yml`
5. Open `bungee/config.yml`
6. Under `servers`, remove the `survival` node and all of its child nodes
7. Save & close the `bungee/config.yml` file

## Changing the Default Server

By default, you will be placed in the lobby server whenever you connect to the network. If you don't want this, or if you want to disable the lobby server altogether, open the `bungee/config.yml` file and under the `priorities` node replace `lobby` with your desired default server name.

**NOTE:** This uses the identifiers within `bungee/config.yml`, meaning you can choose between `lobby`, `survival` and `dun0`.

## Disabling Auto-Start

By default, a server will automatically restart if it has been instructed to shut down or if it crashes. Furthermore, the entire network is configured to run whenever your system boots up, which makes it very intuitive to set up on a dedicated host machine without much configuration.

However, when running the network locally on your own computer, this behavior may be undesirable. Fortunately, you can easily change this by opening the `docker-compose.yml` file, and removing all occurrences of `restart: always`. This way, if a server is shut down it will stay down, and if you restart your PC the servers won't automatically come back up again.

## Plugin Configuration

The network will automatically copy all necessary plugins from the image into the designated subfolders. It is there where you will also find the individual plugin config files that you can edit to your heart's content. You can also put your own plugins in here, or even remove some that are included by default. You can upgrade/downgrade plugin versions in here as well, it's your own playground, so feel free to do as you please.

**DISCLAIMER:** The servers are configured with these plugins in mind, and the custom plugins developed for the network may even depend on some of those to be present and/or on a specific version, or even have some specific configuration. For example, the custom `HcSurvival` plugin expects `MythicMobs` to exist, and utilizes some custom-made monsters (which reside in config files), so removing `MythicMobs` or changing its config might break something.

## Changing the Default Dungeon

The default dungeon used in the *dungeons* game mode can be changed quite easily. You can simply create a singleplayer world, or a world on another server, and copy all of the world's files into the `dungeons/dunstub/` folder. Make sure that after you copy, the `level.dat` folder is present in the `dungeons/dunstub/` folder.

**IMPORTANT:** You need to **remove** the `uid.dat` file, else the server will not start properly!

If you make a mistake, simply delete the `dungeons/dunstub/` folder, and the server will copy the usual default dungeon back into it whenever you start it.

# Running the Network

## Starting it

To start the network on Windows, simply double click the `start-network.bat` file. On Mac & Linux, use the `start-network.sh` file instead. If this doesn't work for you, or if you want to start the network differently, for example if you want it to run in the background without any console output, you can also start it manually.

To do so, open up a **Terminal** (Mac & Linux) or a **Command Line** (Windows) in the same folder as the `docker-compose.yml` file, and type:

- `docker-compose up` to start it manually, combining the output of all servers into the console
- `docker-compose up -d` to start it manually, but instead have it run in the background and not give you any output

## Stopping it

Stopping the network works similar as starting it, except you use the `stop-network.bat` or `stop-network.sh` depending on your operating system. Again, if this doesn't work for you, you can also stop it manually by running the command `docker-compose down` in the same folder as the `docker-compose.yml`.


## Moving to another Machine

Moving the server to another machine is quite simple for the most part, but involves some messing around when it comes to the database. First, you'll want to copy all config files and folders, that is everything that's in the same folder as the `docker-compose.yml`.

Then you need to make sure to install the Docker images on the new machine, as outlined in the first section.

Lastly, you'll need to copy the database and all its files. This is where it gets tricky, because you will need to find out where it is stored yourself. First, open up a **Terminal** (Mac & Linux) or a **Command Line** (Windows) and run the command `docker ps --all`.

You're looking for a container that contains the words `hcmc-dbhost`. It will likely be named something like `[FOLDERNAME]_hcmc-dbhost_1` where `[FOLDERNAME]` is the name of the folder containing the `docker-compose.yml`.

In the left column it will output the container ID. Copy that ID and run the command `docker inspect -f '{{ .Mounts }}' [CONTAINERID]` where `[CONTAINERID]` is the container ID you just copied. The output should be something like this:

```
{volume [VOLUMEID] [VOLUMEPATH]_data /var/lib/mysql local true }]
```

Where `[VOLUMEID]` is the volume's ID (a long string of numbers and lowercase letters which means nothing to use), and [VOLUMEPATH] is the path to the database, which is what we're after.

Navigate to that path using your file explorer or terminal, and copy the `_data` folder that's inside it.

Now, on the new machine, with your folders already copied and your `docker-compose.yml` present on the new machine, and with the server images already installed, start the network once and immediately shut it down again once everything has loaded.

We now need to find the database's location on this new machine, so repeat the steps from before, starting by finding the container ID.

Once you have found the new volume path on the new machine, navigate to it and delete the `_data` folder that's just been generated. In its location, copy the `_data` folder you saved before to restore the database.

Now start the network again and everything should be up and running as it was before!

# Important Server Quirks

These servers were designed with custom plugin development in mind, and are specifically built around the fact that in a pinch I can simply dive into the code and change things myself. These plugins & servers were **never** intended for public distribution, so you may find a lot of things that you don't understand how they work, why they work the way they do, or even why they exist in the first place.

Here is a quick list of some of the things I think you may find odd, so you don't waste your time trying to figure them out by yourself:

- The portals on the lobby server are hardcoded according to their position, meaning you cannot change where they send you or move them to a different position. If you want different portals, you need another plugin.
- On the survival server, ANY nether portal within the spawn region will send you to a random place.
- Again on the survival server, the spawn region is protected in a circle shape (as outlined by the auto-generated bedrock), and it is protected by the `HcSurvival` plugin, and **NOT** `WorldEdit`, meaning you won't have a way to allow non-admins to edit spawn.
- The dungeons server generates at least two new worlds for every player that connects to it, and doesn't delete it automatically ever. This functionality was put in place with big server storage in mind, but locally you may want to check in and manually delete some old worlds every now and then. Well, **DON'T**. If you delete worlds without also deleting the corresponding player in `dungeons/dplayers/` you will very likely break something.
- A lot of the premium functionality is probably broken.
- Try not to touch the custom plugins' config files too much, they're very sensitive and some values interact weirdly with hardcoded ones. Seriously, they're a mess.

# A Final Note

I've said it before, but I'd like to take this opportunity again to thank all of you who participated within Hydra Minecraft, as well as both iterations of HCMCPVP. The golden age of HCMCPVP during Survival, Team Deathmatch & Epidemic times was truly something special, and I've tried to recapture it within the reboot to the best of my abilities, but haven't even gotten close to it sadly. The whole Bukkit fiasco back then, as well as private matters unfortunately led to the temporary shutdown of HCMCPVP, and by the time I was ready to come back, so much had already changed that I had to start from scratch.

That said however, as you may have noticed, this server network is only that of the latest iteration of HCMCPVP. That's because all the time that has passed and moving between servers have left some files scattered, so much of the original servers is lost. However, if I somehow do manage to get my hands on them again, I will post them in a similar manner as I've done with this network, so you can relive those good old times once more, albeit in a slightly different environment.

Thank you all for the time you've spent on my servers, and maybe we'll see each other again in a different game.

\- Naxdy