#!/usr/bin/perl
use HTML::Entities;

my $capn_mode = $ARGV[0] eq '--capn-crunch';

my $doc;

if ($capn_mode) {
    $doc = `curl -L -s "https://news.google.com/search?q=cap'n+crunch&hl=en-US&gl=US&ceid=US:en"`;
} else {
    $doc = `curl -L -s "https://news.google.com/search?q=harrison+ford&hl=en-US&gl=US&ceid=US:en"`;
}

my @titles = $doc =~ m| class="DY5T1d" >(.*?)</a>|g;
shift @titles;  shift @titles;

my $index = int(rand($#titles + 1));
my $title = decode_entities($titles[$index]);
$title =~ s/- .+?$//;

my $prefix;

if ($capn_mode) {
    my @prefixes = ( 'Fascinating',
                     'Unthinkable Tragedy',
                     'TIL',
                     'Where Would We Be Without Him',
                     'Outstanding',
                     'Who Knew?',
                     'A Happy Ending',
                     'He\'s No Harrison Ford',
                     'This Is Everything That\'s Wrong With America',
                     'Lucky Charms Take Note',
                     'The Left Has A New Scapegoat'
                   );
    $prefix = $prefixes[rand @prefixes];
} else {
    $prefix = "Lucky To Be Alive";
}

print "$prefix: $title\n";
