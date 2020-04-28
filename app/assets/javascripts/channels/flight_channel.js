App.messages = App.cable.subscriptions.create('FlightChannel', {
  received: function(data) {
    console.log('received', data);
  },
});