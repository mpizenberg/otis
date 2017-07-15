const express = require( 'express' )
const app = express()
const path = require('path')
const cors = require('cors')


// Config based on .env file (transferred to process.env)
require('dotenv').config( { path: path.join( __dirname, '.env' ) } )
const port = parseInt( process.env.SERVER_PORT, 10 )


// API and webserver
app.use( '/api', cors(), require( path.join( __dirname, './api' ) ) )
app.use( '/', require( path.join( __dirname, 'webclient' ) ) )


// Start server
app.listen( port, () => {
	console.log( 'Server listening on port %s', port )
})
