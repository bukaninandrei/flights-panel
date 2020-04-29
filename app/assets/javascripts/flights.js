// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//= require pagy

window.addEventListener('load', initDispatcherUI);
$("#viewModal").modal();

function initDispatcherUI()
{
  Pagy.init();

  var errorFallback = function(){
    alert('Что-то пошло не так. См. консоль (F12)');
  };

  $('.js-action').on('click', function(e){
    e.preventDefault();
    var ids = [],
        inputs = $('input.js-flight-id:checked:visible');

    if(inputs.length === 0)
    {
      alert('Необходимо выбрать хотя бы один рейс');
      return;
    }

    inputs.each(function() {
      var input = $(this);
      ids.push(input.val());

      input.hide();
    });

    $.ajax({
      method: 'patch',
      url: '/flights/perform_event',
      data: {
        ids: ids,
        authenticity_token: $('meta[name="csrf-token"]').attr("content")
      },
      success: function() {
        console.log('ok');
      },
      error: errorFallback
    })
  });

  $('.js-open-view').on('click', function(e){
    $.get({
      url: '/flights/' + $(e.target).data('id'),
      dataType: 'html',
      success: function(html) {
        $('#viewModal .modal-content').html(html);
        $("#viewModal").modal({ show: true });
      },
      error: errorFallback
    })
  });
}