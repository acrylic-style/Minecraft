# MagmaCube

## What's this

A Minecraft that you can patch your own patches into the Minecraft.

Based on MC 1.16.4 currently.

## Goal
- Make it editable easily by everyone who wants to code Minecraft

## Note
- You should not use this project for any bad usages
- Do not redistribute the jar file, without any exception. It is against the Mojang's ToS.

## Bugs
- No issues so far :)

## Things I noticed
- Comment out (or modify the condition on Line 453) Line 454 on `net.minecraft.client.renderer.GameRenderer` to completely disable nausea effect
- Write Line 258 at `net.minecraft.client.gui.screens.TitleScreen` to display custom title text
- Modify player name tag with `PlayerRenderer#renderNameTag`
- enable debug renders at DebugRenderer
- PlayerTabOverlay to modify how tab renders on multiplayer
- what are private final fields on net.minecraft.server.network.TextFilterClient?

----

See [here](https://github.com/acrylic-style/MagmaCube/blob/master/CONTRIBUTING.md) for more information about building the project.
