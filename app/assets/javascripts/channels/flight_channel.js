App.messages = App.cable.subscriptions.create('FlightChannel', {
  received: function(data) {
    var flight_row = $('[data-flight=' + data.flight_id + ']'),
        state_block = flight_row.find('.js-state'),
        action_button = flight_row.find('.js-action');

    console.log(data);
    state_block.html(data.state_human);
    if(data.actions_allowed)
    {
      action_button.removeAttr('disabled');
    }
    else
    {
      action_button.attr('disabled', 'disabled');
    }
  }
});