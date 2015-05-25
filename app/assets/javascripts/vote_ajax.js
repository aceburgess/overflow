$(document).on('ready page:load', function(){
  $('.vote > a').on('click', updateVote)
});

var updateVote = function(event){
  event.preventDefault();
  event.stopPropagation();
  $.ajax({
    url: $(event.target).parent().attr('href'),
    method: 'POST',
    data: $(event.target).parent().serialize(),
    dataType: 'json'
  }).done(function(response){
    $(event.target).parents('.vote').children('.vote_count').html(response);
  }).error(function(error){
    console.log(error)
  })
}
