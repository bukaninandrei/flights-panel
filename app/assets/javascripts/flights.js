// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//= require pagy

window.addEventListener('load', initDispatcherUI);

function initDispatcherUI()
{
  Pagy.init();

  $('.js-action').on('click', function(e){
    console.log('clicked');

    e.preventDefault();
    var ids = [],
        inputs = $('input.js-flight-id:checked:visible');

    inputs.each(function() {
      var input = $(this);
      ids.push(input.val());

      input.hide();
    });

    $.ajax({
      method: 'patch',
      url: '/flights',
      data: {
        ids: ids,
        authenticity_token: $('meta[name="csrf-token"]').attr("content")
      },
      success: function() {
        console.log('ok');
      }
    })
  });
}