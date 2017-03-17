bodyParser = Npm.require( 'body-parser' )

Picker.middleware( bodyParser.json() )
Picker.middleware( bodyParser.urlencoded( { extended: false } ) )

Picker.route '/notes/inbox', ( params, request, response, next ) ->
  Meteor.call 'notes.inbox',
    inboxCode: request.body.inboxCode
    title: request.body.title
    body: request.body.body
  response.setHeader( 'Content-Type', 'application/json' );
  response.statusCode = 200;
  response.end( "OK" );