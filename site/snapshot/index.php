<!doctype html public "-//W3C//DTD HTML 4.0 Frameset//EN">
<html lang="en">

<head>

<h1>WARNING! Unstable code</h1>

<p>
The files you can download from this directory are CVS snapshots.
They are built automatically every night from the developement sources,
so they are not even guaranteed to compile ( let alone work reliably ).
They are there only to allow people to access latest developement
sources vithout using CVS.
</p>

<table>
  <tr>
    <th>File</th>
    <th>Size</th>
  </tr>
<?php
  $dir = dir( "." );

  while( $file = $dir->read() ) {
    if( ereg( "wxPerl.*", $file ) ) {
      $size = filesize( $file );

      if( $size > 8 * 1024 ) {
        $size = intval( $size / 1024 );
        $suffix = "k";
      }

      if( $size > 8 * 1024 ) {
        $size = intval( $size / 1024 );
        $suffix = "M";
      }
?>
  <tr>
    <td><a href="$file"><?php echo $file?></a>
    <td align="right"><?php echo "$size $suffix"?></td>
  </tr>
<?php }
  }
?>

</table>

</body>

</html>
