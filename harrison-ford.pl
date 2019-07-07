#!/usr/bin/perl
use HTML::Entities;

my $doc = `curl -L -s "https://news.google.com/search?q=harrison+ford&hl=en-US&gl=US&ceid=US:en"`;

my @titles = $doc =~ m| class="DY5T1d" >(.*?)</a>|g;
shift @titles;  shift @titles;

my $index = int(rand($#titles + 1));
my $title = decode_entities($titles[$index]);
$title =~ s/- .+?$//;
print "Lucky To Be Alive: $title\n";
