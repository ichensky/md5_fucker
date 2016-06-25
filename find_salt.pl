# Copyright (c) 2016-.. #John
#
# Author: #John <pocolab.com@gmail.com>
# URL: http://www.pocolab.com
# Version: 1.0.0

# Commentary:

# Decode illuminati cipher

# License:

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Emacs; see the file COPYING.  If not, write to the
# Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
# Boston, MA 02110-1301, USA.
use strict;
use Digest::MD5 qw(md5_hex); 
sub valid_i{
	my$i=$_[0];
	return
		($i>47&&$i<58)||
		($i>96&&$i<123)
		?1:0;
}

sub func{
	my$s="$_[0]";
	if(length($s)>6){
		goto ex1;
	}
	my$i;
	my$c;
	my$h="ea41627d737f669529b47de106493c3b";
	my$p="test";
	my$str;
	my$md5;
	my$min=48;
	for($i=$p;$i<255;$i++){
		if(valid_i($i)){
			$c=chr($i);
			$str=$p.$s.$c;
			$md5=md5_hex($str);
			print("    s: $s; str: $str; md5: $md5\n");
			if($h eq $md5){
				goto ex;
			}
			func($s.$c);
		}
	}
	goto ex1;
ex:
	print("salt: $s$c\n");
	exit();
ex1:;
}

sub main(){
	func("");
}

main();

