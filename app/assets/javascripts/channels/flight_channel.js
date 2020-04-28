App.messages = App.cable.subscriptions.create('FlightChannel', {
  received: App.updateFlightRow,
  connected: function(){ App.setBadgeState('online') },
  disconnected: function(){ App.setBadgeState('offline') }
});