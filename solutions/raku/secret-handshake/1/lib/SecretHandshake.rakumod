unit module SecretHandshake;

my %actions = 
    0b00001 => "wink",
    0b00010 => "double blink",
    0b00100 => "close your eyes",
    0b01000 => "jump";

my $reverse = 0b10000;

sub handshake ( $number ) is export {
    my @actions;

    for %actions.keys.sort -> $code {
        if $number +& $code {
            @actions.push(%actions{$code});
        }
    }

    if $number +& $reverse {
        @actions = @actions.reverse;
    }

    return @actions;
}
