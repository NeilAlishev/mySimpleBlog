class FeedbackForm

  constructor: ->
    @_bindUi()
    @_bindEvents()

  _bindUi: ->
    @ui =
      feedbackForm: $(".feedbackForm")

  _bindEvents: ->
    $(document).on("ready", @ui.feedbackForm, @_insertData)

  _insertData: =>
    @ui.feedbackForm.find("#feedback_name").val(App.currentUserData.full_name)
    @ui.feedbackForm.find("#feedback_email").val(App.currentUserData.email)


if $(".feedbackForm").length && App.currentUserData
  new FeedbackForm
