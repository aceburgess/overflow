$(document).ready(function(){

  $('.add-comment-to-question').on('click', function(event){
    event.preventDefault();
    $(event.target).hide();
    $.ajax({
      url: '/comments/new',
      method: 'GET',
      data: {question_id: $(event.target).data('question-id')},
      dataType: 'html'
    })
    .done(function (response) {
      $('.question-comments').append(response);
    })
    .fail(function(jqXHR, error){
      console.log(error);
    })
    .always(function(jqXHR, answer){
      console.log(answer);
    });
  });

  $('.question-comments').on('submit', '.new_comment', function(event){
    event.preventDefault();
    $(event.target).hide();
    $.ajax({
      url: event.target.action,
      method: event.target.method,
      data: $(event.target).serialize(),
      dataType: 'json'
    })
    .done(function(response){
      console.log(response);
    })
    .fail(function(jqXHR, error){
      console.log(error);
    })
    .always(function(jqXHR, answer){
      console.log(answer);
    });
  });






});