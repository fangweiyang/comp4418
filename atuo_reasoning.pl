#!/usr/bin/perl -w
use warnings;
use 5.0.1;
my $con=$res=$con1=$con2=$res1=$res2="";
my $input=shift @ARGV;
my $law=$input;
my @input_array=();
my @outline=@array=();
my $line_in="";
my @input_array_2a,my @input_array_2b,my @input_array_3a,my @input_array_3b=();
my @input_array_4a,my @input_array_4b,my @input_array_5a,my @input_array_5b=();
my @input_array_6a,my @input_array_6b,my @rule_1=();
push @input_array_5a,$input;

while(@input_array_5a) {
    $input=shift @input_array_5a;
    if($input=~ /seq.*imp/){
        @input=split/seq/,$input;
        $con=$input[0];
        $res=$input[1];
        (@array)=&remove_imp_a($con,$res);
        $con1=shift @array;
        $con1=remove_duplication($con1);
        $res1=shift @array;
        $res1=remove_duplication($res1);
        $line="$con1 seq $res1   Rule 5a";
        push @outline, $line;
        $line_in="$con1 seq $res1";
        push @input_array_5a,$line_in;
    } else {
        push  @input_array_5b,$input;
    }
}


while (@input_array_5b){
    $input=shift @input_array_5b;
    if ($input=~ /imp.*seq/){
        @input=split/seq/,$input;
        $con=$input[0];
        $res=$input[1];
        (@array)= &remove_imp_b($con,$res);
        $con1=shift @array;
        $con1=remove_duplication($con1);
        $res1=shift @array;
        $res1=remove_duplication($res1);
        $con2=shift @array;
        $con2=remove_duplication($con2);
        $res2=shift @array;
        $res2=remove_duplication($res2);
        $line="$con1 seq $res1 And $con2 $res2   Rule 5b";
        push @outline, $line;
        $line_in="$con1 seq $res1";
        push @input_array_5b,$line_in;
        $line_in="$con2 seq $res2";
        push @input_array_5b,$line_in;
    } else {
        push @input_array_6a,$input;
        
    }
}


while (@input_array_6a){
    $input=shift @input_array_6a;
    if ($input=~ /seq.*iff/){
        @input=split/seq/,$input;
        $con=$input[0];
        $res=$input[1];
        (@array)= &remove_iff_a($con,$res);
        $con1=shift @array;
        $con1=remove_duplication($con1);
        $res1=shift @array;
        $res1=remove_duplication($res1);
        $con2=shift @array;
        $con2=remove_duplication($con2);
        $res2=shift @array;
        $res2=remove_duplication($res2);
        $line="$con1 seq $res1 And $con2 $res2   Rule 6a";
        push @outline, $line;
        $line_in="$con1 seq $res1";
        push @input_array_6a,$line_in;
        $line_in="$con2 seq $res2";
        push @input_array_6a,$line_in;
    } else {
        push @input_array_6b,$input;
    }
}

while (@input_array_6b){
    $input=shift @input_array_6b;
    if ($input=~ /iff.*seq/){
        @input=split/seq/,$input;
        $con=$input[0];
        $res=$input[1];
        (@array)= &remove_iff_b($con,$res);
        $con1=shift @array;
        $con1=remove_duplication($con1);
        $res1=shift @array;
        $res1=remove_duplication($res1);
        $con2=shift @array;
        $con2=remove_duplication($con2);
        $res2=shift @array;
        $res2=remove_duplication($res2);
        $line="$con1 seq $res1 And $con2 $res2   Rule 6b";
        push @outline, $line;
        $line_in="$con1 seq $res1";
        push @input_array_6b,$line_in;
        $line_in="$con2 seq $res2";
        push @input_array_6b,$line_in;
    } else {
        push @input_array_2a,$input;
    }
}


while(@input_array_2a){
    $input=shift @input_array_2a;
    if($input=~ /seq.*neg/){
        @input=split/seq/,$input;
        $con=$input[0];
        $res=$input[1];
        (@array)=remove_neg_a($con,$res);
        $con1=shift @array;
        $con1=remove_duplication($con1);
        $res1=shift @array;
        $res1=remove_duplication($res1);
        $line="$con1 seq $res1   Rule 2a";
        push @outline, $line;
        $line_in="$con1 seq $res1";
        push @input_array_2a,$line_in;
    } else {
        push  @input_array_2b,$input;
    }
}
while(@input_array_2b){
    $input=~ s/\s+/ /g;
    $input=shift @input_array_2b;
    if($input=~ /neg.*seq/){
        @input=split/seq/,$input;
        $con=$input[0];
        $res=$input[1];
        (@array)=remove_neg_b($con,$res);
        $con1=shift @array;
        $con1=remove_duplication($con1);
        $res1=shift @array;
        $res1=remove_duplication($res1);
        $line="$con1 seq $res1   Rule 2b";
        push @outline, $line;
        $line_in="$con1 seq $res1";
        push @input_array_2b,$line_in;
    } else {
        push  @input_array_3a,$input;
    }
}

while (@input_array_3a){
    $input=shift @input_array_3a;
    if($input=~ /seq.* and/){
        @input=split/seq/,$input;
        $con=$input[0];
        $res=$input[1];
        (@array)= &remove_and_a($con,$res);
        $con1=shift @array;
        $con1=remove_duplication($con1);
        $res1=shift @array;
        $res1=remove_duplication($res1);
        $con2=shift @array;
        $con2=remove_duplication($con2);
        $res2=shift @array;
        $res2=remove_duplication($res2);
        $line="$con1 seq $res1 And $con2 $res2   Rule 3a";
        push @outline, $line;
        $line_in="$con1 seq $res1";
        push @input_array_3a,$line_in;
        $line_in="$con2 seq $res2";
        push @input_array_3a,$line_in;
    }else{
        push @input_array_3b,$input;
    }
}

while(@input_array_3b){
    $input=shift @input_array_3b;
    if($input=~ /and .*seq/){
        @input=split/seq/,$input;
        $con=$input[0];
        $res=$input[1];
        (@array)=&remove_and_b($con,$res);
        $con1=shift @array;
        $con1=remove_duplication($con1);
        $res1=shift @array;
        $res1=remove_duplication($res1);
        $line="$con1 seq $res1   Rule 3b";
        $line=~ s/\s+/ /g;
        push @outline, $line;
        $line_in="$con1 seq $res1";
        push @input_array_3b,$line_in;
    } else {
        push  @input_array_4a,$input;
    }
}


while(@input_array_4a){
    
    $input=shift @input_array_4a;
    if($input=~ /seq.*or/){
        @input=split/seq/,$input;
        $con=$input[0];
        $res=$input[1];
        (@array)=&remove_or_a($con,$res);
        $con1=shift @array;
        $con1=remove_duplication($con1);
        $res1=shift @array;
        $res1=remove_duplication($res1);
        $line="$con1 seq $res1   Rule 4a";
        push @outline, $line;
        $line_in="$con1 seq $res1";
        push @input_array_4a,$line_in;
    }else{
        push  @input_array_4b,$input;
    }
}

while (@input_array_4b){
    $input=shift @input_array_4b;
    if ($input=~ /or.*seq/){
        @input=split/seq/,$input;
        $con=$input[0];
        $res=$input[1];
        (@array)= &remove_or_b($con,$res);
        $con1=shift @array;
        $con1=remove_duplication($con1);
        $res1=shift @array;
        $res1=remove_duplication($res1);
        $con2=shift @array;
        $con2=remove_duplication($con2);
        $res2=shift @array;
        $res2=remove_duplication($res2);
        $line="$con1 seq $res1 And $con2 $res2   Rule 4b";
        push @outline, $line;
        $line_in="$con1 seq $res1";
        push @input_array_4b,$line_in;
        $line_in="$con2 seq $res2";
        push @input_array_4b,$line_in;
    } else {
        push @rule_1,$input;
    }
}






foreach $i (@rule_1){
    $i=~s/\s+]/]/g;
    $i=~s/\[\s+/\[/g;
}

foreach $i (@outline){
    $i=~s/\s+]/]/g;
    $i=~s/\[\s+/\[/g;
}



my $mark=0;
while(@rule_1){
    $input =shift @rule_1;
    @input=split/seq/,$input;
    $con1=$input[0];
    $res1=$input[1];
    
    $mark=rule_1($con1,$res1);
    if($mark==0){
        print "false\n";
        exit;
    }else{
        $line="$con1 seq $res1    Rule 1";
        push @outline, $line;
    }
}

my $line_num=@outline ;
my @final_out=();
my $Line="";
foreach $i (@outline){
    $Line="$line_num. $i";
    unshift @final_out,$Line;
    $line_num--;
}
@final_out=&format(@final_out);
$line_num=@final_out+1;
$law="$line_num $law";
push @final_out,$law;
push @final_out, "QED.";
foreach $i (@final_out){
    print "$i\n";
}

#Rule 2a
sub remove_neg_a {
    my($con,$res)=@_;
    my $var="";
    if($res=~ m/neg (\w|\([^,]+\))/){
        $var=$1;
        $res=~ s/neg (\w+|\([^,]+\))[,]*//;
    }
    if($con =~ /\[\s*\]/){
        $con=~ s/\] /$var\]/;
    }else{
        $con=~ s/\] /, $var\]/;
    }
    push @array,$con,$res;
    return @array;
}

#Rule 2b
sub remove_neg_b {
    my($con,$res)=@_;
    my $var="";
    if($con=~ m/neg[ ]*(\w|\([^,]*\))/){
        $var=$1;
        $con=~ s/[,]*neg (\w+|\([^,]+\))//;
    }
    if($res =~ /\[\s*\]/){
        $res=~ s/\]/$var\]/;
    }else{
        $res=~ s/\] /, $var\]/;
    }
    push @array,$con,$res;
    return @array;
}


#Rule 3a
sub remove_and_a {
    my($con,$res)=@_;
    my $con1=$con2=$res1=$res2="";
    if($res=~ m/(\w|\([^,]+\)) and/){
        $res1=$res;
        $res1=~ s/and (\w|\([^,]+\))//;
    }
    $res1=~ s/ ]/]/g;
    if($res=~ m/and (\w|\([^,]+\))/){
        $res2=$res;
        $res2=~ s/(\w|\([^,]+\)) and//;
    }
    $res2=~ s/,\s+/, /g;
    $res2=~ s/\[ /\[/;
    $con1=$con;
    $con2=$con;
    push @array,$con1,$res1,$con2,$res2;
    return @array;
}


#Rule 3b
sub remove_and_b {
    my($con,$res)=@_;
    $con=~ s/and/,/;
    push @array,$con,$res;
    return @array;
}


#Rule 4a
sub remove_or_a {
    my($con,$res)=@_;
    $res=~ s/or/,/;
    push @array,$con,$res;
    return @array;
}

sub remove_or_b {
    my($con,$res)=@_;
    my $con1=$con2=$res1=$res2="";
    if($con=~ m/(\w+|\([^,]+\)) or/){
        $con1=$con;
        $con1=~ s/or (\w+|\([^,]+\))//;
    }
    $con1=~ s/ ]/]/g;
    if($con=~ m/or (\w+|\([^,]+\))/){
        $con2=$con;
        $con2=~ s/(\w+|\([^,]+\)) or//;
    }
    $con2=~ s/, /,/g;
    $res1=$res;
    $res2=$res;
    push @array,$con1,$res1,$con2,$res2;
    return @array;
}


#Rule 5a
sub remove_imp_a {
    my($con,$res)=@_;
    my $var="";
    if($res=~ m/(\w+|\([^,]+\)) imp/){
        $var=$1;
    }
    $res=~ s/(\w+|\([^,]+\)) imp//;
    $con=~ s/\] /, $var\]/;
    $res=~ s/\[\s*/[/;
    my @array=();
    push @array,$con,$res;
    return @array;
}


#Rule 5b
sub remove_imp_b {
    my($con,$res)=@_;
    my $var="";
    if($con=~ m/(\w+|\([^,]+\)) imp /){
        $var=$1;
    }
    my $res1=$res2=$con1=$con2="";
    $res1=$res;
    $res2=$res;
    $res2=~ s/\]/, $var\]/;
    $con1=$con;
    $con2=$con;
    $con1=~ s/[^,\[\]]+ imp //;
    $con2=~ s/[^,\[\]]+ imp [^,\[\]]+//;
    $con2=~ s/\[, /[/;
    my @array=();
    push @array,$con1,$res1,$con2,$res2;
    return @array;
}


#Rule 6a
sub remove_iff_a {
    my($con,$res)=@_;
    my $var1=$var2="";
    my $con1=$con2=$res1=$res2="";
    if($res=~ m/(\w+|\([^,]+\)) iff (\w+|\([^,]+\))/){
        $var1=$1;
        $var2=$2;
        $res1=$res2=$res;
        $res1=~ s/(\w+|\([^,]+\)) iff //;
        $res2=~ s/ iff (\w+|\([^,]+\))//;
        
    }
    $con1=$con2=$con;
    if($con =~ /\[\s*\]/){
        $con1=~ s/\] /$var1\]/;
        $con2=~ s/\] /$var2\]/;
    }else{
        $con1=~ s/\] /, $var1\]/;
        $con2=~ s/\] /, $var2\]/;
    }
    my @array=();
    push @array,$con1,$res1,$con2,$res2;
    return @array;
}


#Rule 6b
sub remove_iff_b {
    my($con,$res)=@_;
    my $var1,my$var2="";
    my $con1,my $con2,my $res1,my $res2="";
    if($con=~ m/(\w+|\([^,]+\)) iff (\w+|\([^,]+\))/){
        $var1=$1;
        $var2=$2;
        $con2=$con;
        $con2=~ s/\s*iff\s*/, /;
        $con1=$con;
        $con1=~ s/,*(\w+|\([^,]+\)) iff (\w+|\([^,]+\))//;
        $con1=~ s/\[,/\[/;
        $con1=~ s/\[ (\w+)/\[$1/;
    }
    $res1=$res2=$res;
    if($res =~ /\[\s*\]/){
        $res1=~ s/\] /$var1, $var2\]/;
    }else{
        $res1=~ s/\] /, $var1, $var2\]/;
    }
    my @array=();
    push @array,$con1,$res1,$con2,$res2;
    return @array;
}

sub format {
    my(@a)=@_;
    my $num=0;
    my $i,my $temp="";
    my @out=();
    foreach $i (@a) {
        $i =~ m/(.*)(Rule.*)/;
        $temp = $1;
        $end = $2;
        $temp =~ s/[ ]+$//;
        $temp =~ s/[ ]$//;
        $num = 100 - length($temp);
        $spaces = " " x $num;
        $total = $temp.$spaces.$end;
        push @out,$total;
    }
    return @out;
}


sub remove_duplication{
    my($input)=@_;
    $input=~ s/[\]\[]//g;
    $input=~ s/\(\)//g;
    if($input=~ m/\((\s*[a-z]\s*)\)/){
        $input=~ s/\(\s*([a-z])\s*\)/$1/g;
    }
    my $i="";
    if($input=~ m/(\w|\))\s+,/){
        $input=~ s/(\w|\))\s+,/$1,/g;
    }
    if($input=~ m/(\w|\))\s+]/){
        $input=~ s/(\w|\))\s+]/$1]/g;
    }
    my @input = split /,/ ,$input;
    my @unique = do { my %seen; grep { !$seen{$_}++ } @input };
    my $word="";
    $word=join",",@unique;
    $word= "[$word]";
    $word=~ s/,,/,/g;
    $word=~ s/\[\s*,/[/g;
    $word=~ s/,\s*]/]/g;
    return  $word;
}

sub rule_1{
    my ($fst, $snd)=@_;
    $fst=~ s/[\(\)]//g;
    $snd=~ s/[\(\)]//g;
    $fst =~ s/[\[\]]//g;
    $snd =~ s/[\[\]]//g;
    $fst =~ s/\s*//g;
    $snd =~ s/\s*//g;
    my @fst,my @sed=();
    @fst = split ",", $fst;
    @snd = split ",",$snd;
    my %dup;
    my $i,my $j="";
    foreach $i (@fst) {
        $dup{$i} = 1;
    }
    my $mark=0;
    foreach $j (@snd) {
        if (exists $dup{$j} ) {
            $mark=1;
            last;
        }
    }
    return  $mark;
}

