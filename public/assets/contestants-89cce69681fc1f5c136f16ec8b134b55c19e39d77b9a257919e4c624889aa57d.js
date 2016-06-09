//
//  Jury
//  
//  Copyright::   (c) 2016 Innotronic Ingenieurbüro GmbH
//  URL::         www.inno.ch
//  Author::      Markus Meier


$( function()
{
  $( "tr[data-link]" ).click( function()
  {
    window.location = $( this ).data( "link" );
  }).style( );
})
