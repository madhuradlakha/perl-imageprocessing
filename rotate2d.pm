use warnings;
use strict;

use GD;
use Excel::Writer::XLSX;
use Spreadsheet::ParseExcel;

my $image = GD::Image->newFromPng('/home/madhur/Documents/clear.png') or die;
my $book = Excel::Writer::XLSX->new( 'perl6.xlsx' );    # Step 1
my $sheet = $book->add_worksheet();
sub array {
    my ($x, $y) = @_;
    map {[ (0) x $x ]} 1 .. $y
}
sub i;
sub j;
my $k=0;
my $l=0;
my $m=0;
my @square = array 512, 512;
for (my $j=0; $j<512; $j++) {
	for(my $i=0; $i<512; $i++){
		my $index = $image->getPixel($i, $j);
		my ($r,$g,$b) = $image->rgb($index);
		$sheet ->write($k, $0, $r);
		#$sheet ->write($l, $1, $g);
		#$sheet ->write($m, $2, $b);
		$k=$k+1;
		#$m=$m+1;
		#$l=$l+1;
		
	}	
}