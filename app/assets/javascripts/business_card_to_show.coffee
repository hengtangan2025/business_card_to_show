class FormArticle
  constructor: (@$elm)->
    @bind_events()

  bind_events: ->
    # photo preview
    @$elm.on 'click', '.file-picture-article', =>
      jQuery(".upload-preview").on('change', (event) ->
        files = event.target.files
        image = files[0]
        reader = new FileReader()
        reader.onload = (file) ->
          img = new Image()
          img.src = file.target.result
          jQuery("#target").html(img)
        reader.readAsDataURL(image)
      )

class Article
  constructor: (@$elm)->
    @bind_events()

  bind_events:->

jQuery(document).on "ready page:load", ->
  if jQuery(".form-simple-article").length > 0
    new FormArticle jQuery('.form-simple-article')

jQuery(document).on "ready page:load", ->
  if jQuery(".article").length > 0
    new Article jQuery('.article')