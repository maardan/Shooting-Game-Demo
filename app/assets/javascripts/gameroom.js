// src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"
// src="http://js.pusher.com/2.0/pusher.min.js"
// type="text/javascript" charset="utf-8"

//       $(function() {
//         // If your Heroku application is within the EU region,
//         // uncomment the following lines
//         // Pusher.host = 'ws-eu.pusher.com';
//         // Pusher.sockjs_host = 'sockjs-eu.pusher.com';

//         var pusher = new Pusher('1b17fcfc917f88821b2d'); // Replace with your app key
//         var channel = pusher.subscribe('test_channel');

//         channel.bind('new_gameroom', function(data) {
//         msg = data.from;
//         dom_gameroom(msg);
//         });

//         function dom_gameroom(msg) {
//           $('tr#<%= dom_id(@gameroom) %>').fadeIn();
//           setTimeout(function() {
//             $('tr#<%= dom_id(@gameroom) %>').fadeOut
//             ();
//           }, 2000);
//         }

//         // Some useful debug msgs
//         // pusher.connection.bind('connecting', function() {
//         //   $('div#response_data').text('Connecting to Pusher...');
//         // });
//         // pusher.connection.bind('connected', function() {
//         //   $('div#response_data').text('Connected to Pusher!');
//         // });
//         // pusher.connection.bind('failed', function() {
//         //   $('div#response_data').text('Connection to Pusher failed :(');
//         // });
//         // channel.bind('subscription_error', function(status) {
//         //   $('div#response_data').text('Pusher subscription_error');
//         // });
//       });
  