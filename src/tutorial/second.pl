use Wx;

# this is our own Frame class    
package MyFrame;
    
use strict;
use base 'Wx::Frame';

use Wx::Event qw(EVT_MENU EVT_CLOSE);

my( $ID_ABOUT, $ID_EXIT ) = ( 1, 2 );

# Parameters: title, position, size
sub new {
  my( $class ) = shift;
  # now we are calling the base class constructor
  my( $this ) = $class->SUPER::new( undef, -1, $_[0], $_[1], $_[2] );

  # now that we have an object we can store some data inside of it
  $this->{mydata} = 'This is some data';
  $this->{myotherdata} = 123;

  # create 2 menus
  my( $mfile ) = Wx::Menu->new();
  my( $mhelp ) = Wx::Menu->new();

  # add entries to menus
  $mhelp->Append( $ID_ABOUT, "&About...\tCtrl-A", "Show about dialog" );
  $mfile->Append( $ID_EXIT, "E&xit\tAlt-X", "Quit this program" );
    
  # create a menu bar
  my( $mbar ) = Wx::MenuBar->new();
    
  # append the menus to the menu bar
  $mbar->Append( $mfile, "&File" );
  $mbar->Append( $mhelp, "&Help" );
    
  # and assign the menubar to the frame
  $this->SetMenuBar( $mbar );

  # create a status bar with two fields
  $this->CreateStatusBar( 2 );
  # and show a friendly message
  $this->SetStatusText( "Welcome to wxPerl!", 1 );

  # declare that events coming from menu items with the given
  # id will be handled by the frame ($this) using the listed methods

  # in wxWindows you will have used EVT_MENU( id, method )
  # with _two_ parameters, and EVT_CLOSE( method ), with _one_ parameter
  EVT_MENU( $this, $ID_EXIT, \&OnQuit );
  EVT_MENU( $this, $ID_ABOUT, \&OnAbout );
  EVT_CLOSE( $this, \&OnClose );

  return $this;
}

# these are some constants used by Wx::MessageBox
use Wx qw(wxOK wxICON_INFORMATION wxVERSION_STRING);

# called when the user selects the 'Exit' menu item
sub OnQuit {
  my( $this, $event ) = @_;

  Wx::MessageBox( 'OnQuit: Exiting', 'Message', wxOK, $this );

  # closes the frame
  $this->Close( 1 );
}

# called when the user selects the 'About' menu item
sub OnAbout {
  my( $this, $event ) = @_;

  # display a simple about box
  Wx::MessageBox( "This is the about dialog of minimal sample.\n" .
                  "Welcome to wxPerl " . $Wx::VERSION . "\n" .
                  wxVERSION_STRING,
                  "About minimal", wxOK | wxICON_INFORMATION,
                  $this );
}

sub OnClose {
  my( $this, $event ) = @_;

  Wx::MessageBox( 'OnClose: Closing', 'OnClose', wxOK, $this );

  $event->Skip();
}

package MyApp;
    
use strict;
use base 'Wx::App';
    
use Wx qw(wxDefaultPosition);

sub OnInit {
  my( $this ) = shift;
    
  my( $frame ) = MyFrame->new( "Minimal wxPerl app",
                               wxDefaultPosition,
                               [450, 350]
                             );
    
  $this->SetTopWindow( $frame );

  $frame->Show( 1 );
}
    
package main;
    
# create an instance of the Wx::App-derived class
my( $app ) = MyApp->new();
# start processing events
$app->MainLoop();
