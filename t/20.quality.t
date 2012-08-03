#!/usr/bin/perl
use strict;
use warnings;

use Test::More;
use Parse::MIME qw( quality );
use File::Basename qw( fileparse );
use JSON::XS;

use lib 't';
use TestParseMIME;
my $testcase = TestParseMIME::load_data $0;

use List::Util 'sum';
plan tests => 0 + sum map { 0 + keys %{ $_->{testcases} } } @$testcase;

for my $group ( @$testcase ) {
my $accept = $group->{ accept };
	while ( my ( $type, $quality ) = each %{ $group->{testcases} } ) {
		is quality( $type, $accept ), $quality, $type;
	}
}
