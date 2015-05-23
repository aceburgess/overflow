$(document).ready(function(){

  $('.add-comment-to-question').on('click', function(event){
    event.preventDefault();
    $.ajax({
      url: '/comments/new',
      method: 'GET',
      data: {question_id: $(event.target).data('question-id')},
      dataType: 'json'
    })
    .done(function ( response ) {
      console.log('hello')
      console.log( response )
    })
    .fail(function(jqXHR,textStatus){
      /* code ... */
    })
    .always(function(jqXHR,textStatus){
      /* code ... */
    });
  })






})