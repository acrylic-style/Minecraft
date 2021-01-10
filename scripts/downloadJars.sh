#!/usr/bin/env bash
source ./scripts/functions.sh
clientJarUrl="https://launcher.mojang.com/v1/objects/1952d94a0784e7abda230aae6a1e8fc0522dba99/client.jar"
clientJarPath="$basedir"/work/Minecraft/$version/client.jar
clientMappingUrl="https://launcher.mojang.com/v1/objects/0837de813d1a6b67e23da3c520a84e872c8d2f0e/client.txt"
clientMappingPath="$basedir"/work/Minecraft/$version/mapping.txt
clientRemappedJarPath="$basedir"/work/Minecraft/$version/client-remapped.jar
decompilerBin="$basedir"/work/ForgeFlower/forgeflower-1.5.478.18.jar
decompOutput="$basedir/work/Minecraft/$version/source"
decompBin2="$basedir/work/procyon/procyon"
rm -rf "$basedir/Minecraft/src/main"
rm -rf "$basedir/work/Minecraft/$version/source"
mkdir -p "$basedir/work/decompiler"
mkdir -p "$basedir/Minecraft/src/main/java"
mkdir -p "$decompOutput"
echo "Downloading client jar..."
curl $clientJarUrl --output "$clientJarPath"
if [ $? != 0 ]; then
  echo "Could not download client jar, please check for errors above, fix it, then run again."
  exit 1
fi
echo "Downloading client mapping..."
curl $clientMappingUrl --output "$clientMappingPath"
if [ $? != 0 ]; then
  echo "Could not download client mapping, please check for errors above, fix it, then run again."
  exit 1
fi
echo "Applying mapping"
"$basedir"/work/MC-Remapper/bin/MC-Remapper --fixlocalvar=rename --output-name="$clientRemappedJarPath" "$clientJarPath" "$clientMappingPath"
echo "Unpacking jar..."
rm -rf "$basedir/work/Minecraft/$version/unpacked"
mkdir -p "$basedir/work/Minecraft/$version/unpacked"
cd "$basedir/work/Minecraft/$version/unpacked" || exit 1
unzip "$clientRemappedJarPath"
echo "Manifest-Version: 1.0" > "$basedir/work/Minecraft/$version/unpacked/META-INF/MANIFEST.MF"
echo "Main-Class: net.minecraft.client.Main" >> "$basedir/work/Minecraft/$version/unpacked/META-INF/MANIFEST.MF"
echo "" >> "$basedir/work/Minecraft/$version/unpacked/META-INF/MANIFEST.MF"
rm "$basedir/work/Minecraft/$version/unpacked/META-INF/MOJANGCS.RSA"
rm "$basedir/work/Minecraft/$version/unpacked/META-INF/MOJANGCS.SF"
cd "$basedir" || exit 1
echo "Decompiling the remapped jar..."
rm -rf "$decompOutput"
mkdir -p "$decompOutput"
java -Xmx4G -jar "$decompilerBin" -dgs=1 -rsy=1 "$basedir/work/Minecraft/$version/unpacked" "$decompOutput" &
wait
$basedir/scripts/postDownload.sh
echo "  Downloaded the client jar successfully"
