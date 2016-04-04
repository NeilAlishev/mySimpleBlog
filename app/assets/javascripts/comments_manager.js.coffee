# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class CommentsManager

  constructor: ->
    $(document).on "submit", ".comment-form", @createComment
    $(document).on "click", ".delete-comment-button", @deleteComment


  createComment:(e) =>
    e.preventDefault()
    $.ajax
      url:'/comments'
      method: 'POST'
      data:
        comment:
          content: $("#comment-field").val()
          article_id: $('.article').data('article-id')
      success: (data) =>
        $(".comments").append(data)
        $("#comment-field").val("")
        @refreshCounter()

  deleteComment:(e) =>
    e.preventDefault()
    comment_id = $(e.currentTarget).parent().data('comment-id')
    $.ajax
      url:"/comments/#{comment_id}"
      method: 'DELETE'
      success: =>
        $(".comment[data-comment-id=\"#{comment_id}\"]").remove()
        @refreshCounter()

  refreshCounter: ->
    numOfComments = $(".comment").length
    $("#comment-counter").html(numOfComments)


if $('.comments').length
  window.App.CommentsManager = new CommentsManager
