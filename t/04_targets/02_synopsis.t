use strict;
use warnings;
use File::Spec::Functions 'catfile';
use Test::More tests => 3;

$ENV{GROK_SHAREDIR} = 'share';
my $grok = catfile('script', 'grok');

my $s02        = qx/$grok s02/;
my $s26        = qx/$grok s26/;
my $s32_except = qx/$grok s32-except/;

like($s02, qr/Synopsis 2/, "Got S02");
like($s26, qr/Synopsis 26/, "Got S26");
like($s32_except, qr/Synopsis 32: Setting Library - Exception/, "Got S32-exception");