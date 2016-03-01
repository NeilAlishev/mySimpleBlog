# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class CommentsManager

  constructor: ->
    $(document).on "submit", ".comment-form", @createComment
    $(document).on "click", ".delete-comment-button", @deleteComment


  createComment:(e) ->
    e.preventDefault()
    $.ajax
      url:'/comments'
      method: 'POST'
      data:
        comment:
          content: $("#comment-field").val()
          article_id: $('#hidden-comment-field').val()
      success: (data) ->
        $(".comments").append(data)
        $("#comment-field").val("")
        current = parseInt $("#comment-counter").html()
        $("#comment-counter").html("#{current + 1}")

  deleteComment:(e) ->
    e.preventDefault()
    current_comment = $(this).parent()
    $.ajax
      url:"/comments/#{current_comment.data('id')}"
      method: 'DELETE'
      success: ->
        current_comment.remove()
        current = parseInt $("#comment-counter").html()
        $("#comment-counter").html("#{current - 1}")


new CommentsManager

