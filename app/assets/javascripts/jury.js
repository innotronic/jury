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
    tooltip: 'always',
    min: 1,
    max: 10
  });
  
  $( "input[name=contestant_number]" ).change( function()
  {
    queryContestant();
  });
  
  $( "input[name=contestant_name]" ).change( function()
  {
    saveContestant();
  });
  
  $( "form#score" ).submit( function( event )
  {
    saveScore();
    event.preventDefault();
  });
  
  $( ".scoreSave" ).prop( "disabled", true );
  
  loadContestants();
});



function loadContestants()
{
  $.getJSON( 
    "contestants.json" 
  ).done( function( contestants )
    {
      var contestant_list = $( ".contestant_list" );
      contestant_list.empty();
      
      $.each( contestants, function( id, data )
      {
        var li = $( "<li>" + data.number + "</li>" );
        
        li.addClass( "contestant" );
        li.attr( "id", "contestant_" + data.number );
        li.click( function()
        {
          loadContestant( data )
        });
        
        contestant_list.append( li );
      });
    }
  ).fail( function( jqxhr, textStatus, error )
    {
      contestant = null;
      $( "#contestant_name" ).val( "" );
      $( ".scoreSave" ).prop( "disabled", true );
      $( "#status" ).text( "" ).removeClass( "alert-danger" ).removeClass( "alert-success" );
      
      console.log( "Request Failed: " + textStatus + ", " + error );
    }
  );
}


function queryContestant()
{
  contestantNumber = $( "input[name=contestant_number]" ).val();
  
  $.getJSON( 
    "contestants/" + contestantNumber + ".json" 
  ).done( function( data )
    {
      loadContestant( data );
    }
  ).fail( function( jqxhr, textStatus, error )
    {
      loadContestant( null );
      console.log( "Request Failed: " + textStatus + ", " + error );
    }
  );
}

function loadContestant( data )
{
  $( ".contestant" ).removeClass( "active" );
  
  if( data )
  {
    contestant = data;
    
    var box = $( "#contestant_" + contestant.number );
    box.addClass( "active" );
    
    var list = $( ".contestant_list" );
    
    list.animate(
      {
        scrollTop : box.position().top - (( list.height() - box.height() ) / 2 )
      }, 200 );
    
    $( "#contestant_number" ).val( contestant.number );
    $( "#contestant_name" ).val( contestant.name );
    $( ".scoreSave" ).prop( "disabled", false );
    $( "#status" ).text( "" ).removeClass( "alert-danger" ).removeClass( "alert-success" );
  }
  else
  {
    contestant = null;
    $( "#contestant_name" ).val( "" );
    $( ".scoreSave" ).prop( "disabled", true );
    $( "#status" ).text( "" ).removeClass( "alert-danger" ).removeClass( "alert-success" );
  }
}


function saveContestant()
{
  if( contestant )
  {
    contestant.name = $( "#contestant_name" ).val();
    
    $.post( 
      "contestants/" + contestant.id + ".json", 
      { _method:'PUT', contestant: { name: contestant.name }}
    ).done( function( json )
      {
        $( "#status" ).text( "Teilnehmer aktualisiert!" ).removeClass( "alert-danger" ).addClass( "alert-success" );
      }
    ).fail( function( jqxhr, textStatus, error )
      {
        $( "#status" ).text( "Fehler beim Aktualisieren des Teilnehmers!" ).removeClass( "alert-success" ).addClass( "alert-danger" );
        console.log( "Request Failed: " + textStatus + ", " + error );
      }
    );
  }
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
        // $( "#value" ).prop( "disabled", true );
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