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
			$md5=md5_hex($md5);
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

