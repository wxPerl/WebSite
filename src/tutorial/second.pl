#!/usr/bin/perl -w

use strict;
use Wx;

#<!-- replace #1 -->
package MyFrame;
    
use base 'Wx::Frame';
#<!-- end -->

#<!-- replace #2 -->
sub new {
    my $ref = shift;
    my $self = $ref->SUPER::new( undef,           # parent window
                                 -1,              # ID -1 means any
                                 'wxPerl rules',  # title
                                 [-1, -1],        # default position
                                 [150, 100],      # size
                                 );
#<!-- end -->

#<!-- replace #3 -->
    # controls should not be placed directly inside
    # a frame, use a Wx::Panel instead
    my $panel = Wx::Panel->new( $self,            # parent window
                                -1,               # ID
                                );
    # create a button
    my $button = Wx::Button->new( $panel,         # parent window
                                  -1,             # ID
                                  'Click me!',    # label
                                  [30, 20],       # position
                                  [-1, -1],       # default size
                                  );
#<!-- end -->

    return $self;
}

#<!-- replace #4 -->
package MyApp;
    
use base 'Wx::App';
    
sub OnInit {
    my $frame = MyFrame->new;

  $frame->Show( 1 );
}
    
package main;
    
my $app = MyApp->new;
$app->MainLoop;
#<!-- end -->
