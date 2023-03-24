#!/usr/bin/perl
use strict;

sub getMCVersion(){
    open FILE, '<', ".minecraft/pack.toml" || die $!;
    my $file=join('',<FILE>);
    close FILE;

    if ($file=~/minecraft = "([^"]+)"/) {
        return $1; 
    }
}
sub getModPackVersion(){
    my $previousversion = $ARGV[1];

    if($previousversion =~s/\.(\d+)$//){
        return $previousversion.'.'.($1+1);
    }
}


sub isItNew(){

    my $file1;
    if (-e '.minecraft/Cobblemon-Optimized-1.0.0.mrpack') {
        open FILE, '<', ".minecraft/Cobblemon-Optimized-1.0.0.mrpack" || die $!;
            $file1=join('',<FILE>);
        close FILE;
    } else {
        print ".minecraft/Cobblemon-Optimized-1.0.0.mrpack does not exist!\n";
    }

    my $file2;
    if (-e 'Cobblemon-Optimized-1.0.0.mrpackCobblemon-Optimized-1.0.0.mrpack') {
        open FILE, '<', "Cobblemon-Optimized-1.0.0.mrpackCobblemon-Optimized-1.0.0.mrpack" || die $!;
            $file2=join('',<FILE>);
        close FILE;
    } else {
        print "Cobblemon-Optimized-1.0.0.mrpack does not exist!\n";
    }
# && -e '.minecraft/Cobblemon-Optimized-1.0.0.mrpack' && -e 'Cobblemon-Optimized-1.0.0.mrpackCobblemon-Optimized-1.0.0.mrpack'
    if($file1 eq $file2){
        return 'false';
    }else {
        return 'true';
    };
}

if($ARGV[0] eq 'isitnew'){
    print "::set-output name=$ARGV[0]::".isItNew();
}

if($ARGV[0] eq 'modpackversion'){
    print "::set-output name=$ARGV[0]::".getModPackVersion();
}

if($ARGV[0] eq 'mcversion'){
    print "::set-output name=$ARGV[0]::".getMCVersion();
}


