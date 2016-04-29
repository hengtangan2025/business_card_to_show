class Article
  constructor: (@$elm)->
    @bind_events()

  bind_events: ->
    # photo preview
    @$elm.on 'click', '.field', =>
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

    @$elm.on 'click', '.menu-top', =>
      jQuery(".menu-last").on('click', ->
        jQuery(".menu-last").addClass("active")
      )
      jQuery(".menu-first").addClass("active")

jQuery(document).on "ready page:load", ->
  if jQuery(".article").length > 0
    new Article jQuery('.article')
  