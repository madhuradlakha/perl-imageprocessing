#!/usr/bin/perl
use Text::Iconv;
 my $converter = Text::Iconv -> new ("utf-8", "windows-1251");

use strict;
use warnings;

use Spreadsheet::XLSX;
use Excel::Writer::XLSX;

my $parser   = Spreadsheet::XLSX->new();
my $template = $parser->parse('perl.xlsx', $converter);
my $worksheet1 = $template->worksheet(0);

my $book = Excel::Writer::XLSX->new( 'perl1.xlsx' );    # Step 1
my $sheet = $book->add_worksheet();
for (my $s=0; $s<512; $s++) {
	for(my $t=0; $t<512; $t++){
		if(($worksheet1->get_cell($s, $t)==1) && (($worksheet1->get_cell($s-1, $t)==0) || ($worksheet1->get_cell($s+1, $t)==0) || ($worksheet1->get_cell($s, $t-1)==0) || ($worksheet1->get_cell($s, $t+1)==0))){
			$sheet ->write($s, $t, 0);
		}
	}
}