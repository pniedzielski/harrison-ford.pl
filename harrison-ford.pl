#!/usr/bin/perl
use HTML::Entities;

my $doc = `curl -s "https://news.google.com/news/rss/search/section/q/harrison%20ford?ned=us&gl=US&hl=en"`;

my @titles = $doc =~ m|<title>(.*?)</title>|g;
shift @titles;  shift @titles;

my $index = int(rand($#titles + 1));
my $title = decode_entities($titles[$index]);
$title =~ s/- .+?$//;
print "Lucky To Be Alive: $title\n";
