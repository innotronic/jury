//
//  Jury
//  
//  Copyright::   (c) 2016 Innotronic Ingenieurbüro GmbH
//  URL::         www.inno.ch
//  Author::      Markus Meier

var contestant;


function pad( str, length )
{
  str = str.toString();
  return ( str.length < length ) ? pad( "0" + str, length ) : str;
}


$( function()
{
  $( "#value" ).slider(
  {
    tooltip: 'always'
  });
  
  $( ".contestantNumber" ).change( function()
  {
    updateContestant();
  });
  
  $( "form#score" ).submit( function( event )
  {
    saveScore();
    event.preventDefault();
  });
  
  $( "#value" ).prop( "disabled", true );
  $( ".scoreSave" ).prop( "disabled", true );
});


function updateContestant()
{
  contestantNumber = $( "input[name=contestant_number0]:checked" ).val() + $( "select[name=contestant_number3]" ).val() + $( "select[name=contestant_number2]" ).val() + $( "select[name=contestant_number1]" ).val();
  
  $.getJSON( 
    "../contestants/" + contestantNumber + ".json" 
  ).done( function( json )
    {
      contestant = json;
      $( "#contestant_name" ).val( contestant.name );
      $( "#value" ).prop( "disabled", false );
      $( ".scoreSave" ).prop( "disabled", false );
      $( "#status" ).text( "" ).removeClass( "alert-danger" ).removeClass( "alert-success" );
    }
  ).fail( function( jqxhr, textStatus, error )
    {
      contestant = null;
      $( "#contestant_name" ).val( "" );
      $( "#value" ).prop( "disabled", true );
      $( ".scoreSave" ).prop( "disabled", true );
      $( "#status" ).text( "" ).removeClass( "alert-danger" ).removeClass( "alert-success" );
      
      console.log( "Request Failed: " + textStatus + ", " + error );
    }
  );
}


function saveScore()
{
  if( contestant )
  {
    var value = $( "#value" ).val();
    
    $.post( 
      "jury/score.json", 
      { contestant_id: contestant.id, value: value }
    ).done( function( json )
      {
        $( "#status" ).text( "Wertung registriert!" ).removeClass( "alert-danger" ).addClass( "alert-success" );
        contestant = null;
        $( "#value" ).prop( "disabled", true );
        $( ".scoreSave" ).prop( "disabled", true );
      }
    ).fail( function( jqxhr, textStatus, error )
      {
        $( "#status" ).text( "Fehler beim Registrieren der Wertung!" ).removeClass( "alert-success" ).addClass( "alert-danger" );
        console.log( "Request Failed: " + textStatus + ", " + error );
      }
    );
  }
}
