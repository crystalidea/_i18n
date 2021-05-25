use YAML::XS 'LoadFile';
use Data::Dumper;
use Hash::Path; # you can simply copy Path.pm to /lib/Hash located at https://metacpan.org/pod/Hash::Path

binmode(STDOUT, ":utf8");

foreach (glob("*.yml"))
{
    if ($_ =~ /(.{2})\./ && $_ ne "en.yml" ) # && $_ eq "ru.yml")
    {
        $to_update_yml = $_;

        print "Processing $to_update_yml...\n";

        my ($lng_code) = ($to_update_yml =~ /^(.{2})\./);

        $translated = LoadFile($to_update_yml);
        @comments_header = read_yml_header($to_update_yml);

        @new_lines = update_yml("en.yml", $translated, $lng_code, \@comments_header);   

        open F_OUT, ">$to_update_yml" or die "Cannot open $to_update_yml";

        binmode(F_OUT, ":utf8");     

        foreach (@new_lines)
        {
            print F_OUT "$_\n";
        }

        close F_OUT;
    }
}

sub read_yml_header
{
    my @comments_header;

    open F, $_[0] or die "Cannot open $_[0]";
    binmode(F, ":utf8");

    while (<F>)
    {
        chop $_;

        if ($_ =~ /^#\s/) {
            push @comments_header, $_;
            #print "$_\n";
        }
        else {
            last;
        }
    }

    close F;

    return @comments_header;
}

sub update_yml
{
    my @new_lines = @{$_[3]}; # init with localized header

    my $translated = $_[1];
    my $lng_code = $_[2];

    open F, $_[0] or die "Cannot open $_[0]";
    
    my @current_path;

    while (<F>) {
        
        $line = $_;
        chop $line;

        if ($line =~ /^#\s/) { # skip English header
            next;
        }

        $line =~ s/crystalidea\.com\//crystalidea\.com\/$lng_code\//;

        $line_without_comments = $line;
        $line_without_comments =~ s/#\s(.+)$//;
        
        if (length($line_without_comments)) {

            ($current_depth) = ($line_without_comments =~ /^(\s*).+$/);
            $current_depth = length($current_depth);

            if ($current_depth % 2) {
                #die "Invalid number of spaces $current_depth, '$line_without_comments'!\n";

                $current_depth = 0;

            } else
            {
                $current_depth /= 2;
            }

            if ($line_without_comments =~ /\s*(.+?):\s(.+)/)
            {
                my @full_path = @current_path;
                my $full_path_depth = (scalar @current_path);
                my $full_path_depth_dbg = join( '/', @full_path );

                if ($current_depth == $full_path_depth)
                {
                    
                }
                else
                {
                    # редкая ситуация, когда после подкатегории сразу без новой категории идёт новый элемент

                    #print "--> Path one level up ($full_path_depth_dbg)\n";

                    pop @full_path;

                    #die "Not matching depth: $current_depth, $full_path_depth ($full_path_depth_dbg)\n";
                }

                $k = $1;
                $v = $2;

                push @full_path, $k; # push key
                $full_path_depth_dbg = join( '/', @full_path );

                $tr = Hash::Path->get($translated, @full_path );

                if ($tr)
                {
                    $tr = str_for_yml($tr);

                    $line = str_replace($v, $tr, $line);
                }
                else
                {
                    print "--> Using English for $full_path_depth_dbg\n";
                    # not translated yet, should be English

                    #die "Invalid path $dbg_path\n";
                }
            }
            elsif ($line_without_comments =~ /(\s{0,})(.+?):\s{0,}/) # no value
            {
                my $depth1 = (scalar @current_path);

                if ($current_depth == 0) # root element
                {
                    @current_path = ($2);
                }
                elsif ($current_depth == $depth1)
                {
                    push @current_path, $2;
                }
                elsif ($current_depth < $depth1)
                {
                    pop @current_path;

                    push @current_path, $2;
                }
                else
                {
                    die "Unhandled!";
                }
            }
        }

        push @new_lines, $line;
    }

    close F;

    return @new_lines;
}

sub str_replace {
    my $replace_this = shift;
    my $with_this  = shift; 
    my $string   = shift;
    
    my $length = length($string);
    my $target = length($replace_this);
    
    for(my $i=0; $i<$length - $target + 1; $i++) {
        if(substr($string,$i,$target) eq $replace_this) {
            $string = substr($string,0,$i) . $with_this . substr($string,$i+$target);
            return $string; #Comment this if you what a global replace
        }
    }
    return $string;
}

sub str_for_yml {

    my $tr = shift;

    if ( ($tr =~ /:/ && $tr !~ /mailto:|https:|http:/)
         || $tr =~ /^\*\*/ || $tr =~ /^\[/ ) {

        $tr = "\"$tr\"";
    }

    $tr =~ s/\\/\\\\/g; # escape '\'

    return $tr;
}