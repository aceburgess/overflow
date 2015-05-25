$(document).on('ready page:load', function(){

  // Question Comment
  var addQuestionCommentLinkHTML = $('.add-comment-to-question')[0].outerHTML
  $('.question-container').on('click', '.add-comment-to-question', function(event){
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

  $('.question-comments').on('submit', '.new-comment', function(event){
    event.preventDefault();
    $(event.target).closest('.single-comment').hide();
    $.ajax({
      url: event.target.action,
      method: event.target.method,
      data: $(event.target).serialize(),
    })
    .done(function(response){
      $('.question-comments').append(response);
      $('.question-comments').append(addQuestionCommentLinkHTML);
    })
    .fail(function(jqXHR, error){
      console.log(error);
    })
    .always(function(jqXHR, answer){
      console.log(answer);
    });
  });

  // ANSWER COMMENT

  var addAnswerCommentLinkHTML = $('.add-comment-to-answer')[0].outerHTML
  $('.answer-container').on('click', '.add-comment-to-answer', function(event){
    event.preventDefault();
    $(event.target).hide();
    var $thisAnswerComments = $(event.target).closest('.answer-comments')
    $.ajax({
      url: '/comments/new',
      method: 'GET',
      data: {answer_id: $(event.target).data('answer-id')},
      dataType: 'html'
    })
    .done(function (response) {
      $thisAnswerComments.append(response);
    })
    .fail(function(jqXHR, error){
      console.log(error);
    })
    .always(function(jqXHR, answer){
      console.log(answer);
    });
  });

  $('.answer-comments').on('submit', '.new-comment', function(event){
    event.preventDefault();
    $(event.target).closest('.single-comment').hide();
    var $thisAnswerComments = $(event.target).closest('.answer-comments')
    $.ajax({
      url: event.target.action,
      method: event.target.method,
      data: $(event.target).serialize(),
    })
    .done(function(response){
      $thisAnswerComments.append(response);
      $thisAnswerComments.append(addAnswerCommentLinkHTML);
    })
    .fail(function(jqXHR, error){
      console.log(error);
    })
    .always(function(jqXHR, answer){
      console.log(answer);
    });
  });

});