#!/usr/bin/perl -w

use strict;

#<!-- replace #1 -->
# load wxPerl main module
use Wx;
#<!-- end -->

#<!-- replace #2 -->
# every application must create an application object
package MyApp;

use base 'Wx::App';
#<!-- end -->

#<!-- replace #3 -->
# this method is called automatically when an application object is
# first constructed, all application-level initialization is done here
sub OnInit {
#<!-- end -->

#<!-- replace #4 -->
    # create a new frame (a frame is a top level window)
    my $frame = Wx::Frame->new( undef,           # parent window
                                -1,              # ID -1 means any
                                'wxPerl rules',  # title
                                [-1, -1],         # default position
                                [250, 150],       # size
                               );
#<!-- end -->

#<!-- replace #5 -->
    # show the frame
    $frame->Show( 1 );
}
#<!-- end -->

#<!-- replace #6 -->
package main;

# create the application object, this will call OnInit
my $app = MyApp->new;
# process GUI events from the application this function will not
# return until the last frame is closed
$app->MainLoop;
#<!-- end -->
