!function() {
  'use strict';

  var endpoint = (location.protocol === 'http:' ? 'ws://' : 'wss://') +
    location.host + '/channel';

  window.connection = new ReconnectingWebSocket(endpoint);

  connection.onopen = function(message) {
    console.log('connected to channel');
    connection.send(JSON.stringify({event: 'ping', some: 'data'}));
  }

  connection.onmessage = function(message) {
    console.log('message', JSON.parse(message.data));
  }

  // TODO Implement on the backend
  connection.onerror = function(message) {
    console.error('channel', JSON.parse(message.data));
  }
}();
