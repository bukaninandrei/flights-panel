// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

  App.updateFlightRow = function(data) {
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
  };

  App.setBadgeState = function(value) {
    var badge_online = $('.js-badge-status.js-badge-online'),
        badge_offline = $('.js-badge-status.js-badge-offline');

    if(value === 'online')
    {
      badge_online.show();
      badge_offline.hide();
    }
    else
    {
      badge_online.hide();
      badge_offline.show();
    }
  };

}).call(this);
