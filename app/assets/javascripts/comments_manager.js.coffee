# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class CommentsManager

  constructor: ->
    @_bindUi()
    @_bindEvents()

  _bindUi: ->
    @ui =
      commentForm: $(".comment-form")
      commentDeleteButton: $(".delete-comment-button")
      commentCounter: $("#comment-counter")
      commentField: $("#comment-field")
      article: $(".article")


  _bindEvents: ->
    $(document).on "submit", ".comment-form", @_createComment
    $(document).on "click", ".delete-comment-button", @_deleteComment


  _createComment:(e) =>
    e.preventDefault()
    $.ajax
      url: "/comments"
      method: "POST"
      data:
        comment:
          content: @ui.commentField.val()
          article_id: @ui.article.data("article-id")
      success: (data) =>
        $(".comments").append(data)
        @ui.commentField.val("")
        @_refreshCounter()

  _deleteComment:(e) =>
    e.preventDefault()
    comment_id = $(e.currentTarget).parent().data("comment-id")
    $.ajax
      url:"/comments/#{comment_id}"
      method: "DELETE"
      success: =>
        $(".comment[data-comment-id=\"#{comment_id}\"]").remove()
        @_refreshCounter()

  _refreshCounter: ->
    numOfComments = $(".comment").length
    @ui.commentCounter.html(numOfComments)


if $(".comments").length
  window.App.CommentsManager = new CommentsManager
