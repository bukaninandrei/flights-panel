// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//= require pagy

window.addEventListener("turbolinks:load", Pagy.init);

window.addEventListener('load', initDispatcherUI);

function initDispatcherUI()
{
  $('#flights-table .js-action').on('click', function(e){
    console.log('clicked');

    e.preventDefault();
    var row = e.target.closest('tr'),
        flight_id = $(row).data('flight');

    $.ajax({
      method: 'patch',
      url: '/flights',
      data: {
        id: flight_id,
        authenticity_token: $('meta[name="csrf-token"]').attr("content")
      },
      success: function(result) {
        console.log('result is', result);
      }
    })
  });
}