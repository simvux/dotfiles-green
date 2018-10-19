auto();

sub auto() {

    my $cont = slurp "/home/simon/.screentap";

    say $cont;
    if $cont ~~ / 1 / {
        SelectScreen(False)
    } 
    if $cont ~~ / 2 /  {
        SelectScreen(True)
    }
}

sub SelectScreen(Bool $primary) {
    if $primary {
        shell "xdotool mousemove 650 350";
        my $f = open "/home/simon/.screentap", :w;
        $f.print("1");
        $f.close;
    } else {
        shell "xdotool mousemove 2000 500";
        my $f = open "/home/simon/.screentap", :w;
        $f.print("2");
        $f.close;
    }
}
