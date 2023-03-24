#!/usr/bin/perl
use strict;
my @modrinthMods = ('exordium', 'fabric-api','c2me-fabric','debugify','ebe','fastload','ferritecore-fabric','carpet','ImmediatelyFast','krypton','lazydfu','lithium','starlight','smoothboot-fabric','vmp-fabric', 'modmenu', 'sodium-extra','reeses-sodium-options', 'mouse-wheelie','memoryleakfix','no-chat-reports', 'sodium','mixintrace', 'mixin-conflict-helper', 'notenoughcrashes', 'yosbr');
#multiconnect
for(@modrinthMods){
	system("packwiz mr install $_ -y");
}

for(@curseforgeMods){
	system("packwiz cf install $_ -y");
}


