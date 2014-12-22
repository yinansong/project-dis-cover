$(document).ready(function() {

  $(".item").draggable(
    {cursor: "move",
    cursorAt: { top: 100, left: 100},
    containment: "body"
    }
  );

  $('.item').draggable().on('mousedown', function() {
    $('.item').not(this).css('z-index', '100');
    $(this).css('z-index', '998');
  });

  $('button').click(function() {
    $(this).closest('div.item').hide(0);
    });

});
