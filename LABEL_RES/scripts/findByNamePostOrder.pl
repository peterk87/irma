#!/usr/bin/env perl
# findByNamePostOrder -  Version 1.0
# Directory post-order traversal: outputs matching exact files by default.
#
# Copyright (C) 2012, Centers for Disease Control & Prevention
# Author: Samuel S. Shepard (vfn4@cdc.gov)
#
# GPL version 3
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

####################
# PROCESS parameters
use File::Basename;
use Getopt::Long;
GetOptions( 'contains|C' => \$contains, 'directory-only|D' => \$dirOnly );

if ( scalar(@ARGV) != 2 && !defined($dirOnly) ) {
	$message = "Usage:\n\tperl $0 <base_directory> [<file/pattern> [-C]|-D]\n";
	$message .= "\t\t--contains|-C\t\tContains text in pattern.\n";
	$message .= "\t\t--directory-only|-D\tOnly process directories instead of file.\n";
	die($message);
}

#FNC - recursive post order traversal
sub postOrderByName($$$) {
	my $base = $_[0];
	my $name = $_[1];
	my $level = $_[2];

	my @contents = <$base/*>;
	my @files = grep(-f $_, @contents);
	my @dirs = grep(-d $_, @contents);
	my $file;
	my $dir;
	my $temp;

	# Traverse
	foreach $dir ( @dirs ) {
		&postOrderByName($dir, $name, ($level+1));
	}

	if ( $dirOnly ) {
		foreach $dir ( @dirs ) {
			print $dir,"\n";
		}
		return;
	}


	if ( $contains ) {
		# Process
		foreach $file ( @files ) {
			if ( basename($file) =~ /$name/ ) {
				if ( $level != 0 || $file ne $files[-1] ) {
					print $file,' ';
				} else {
					print $file;
				}
			}
		}
		
	} else {
		# Process
		foreach $file ( @files ) {
			if ( basename($file) eq $name ) {
				if ( $level != 0 || $file ne $files[-1] ) {
					print $file,' ';
				} else {
					print $file;
				}
			}
		}
	}
}


my $base=$ARGV[0];
my $name=$ARGV[1];

postOrderByName($base, $name, 0);
####################
