# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready page:load", ->
  $('form').on 'click', '.remove_field', (event) ->
    event.preventDefault()
    console.log('click remove')
    $(this).prev('input[type=hidden]').val('true')
    $(this).closest('fieldset').hide()
    $(this).closest('div.article_image_fields').hide()

  $('form').on 'click', '.Add_field', (event) ->
    event.preventDefault()
    article_image_count = $('div#image-for-article fieldset.article_image input:hidden[value=false]').length
    if article_image_count < 5
      console.log 'Se puede agregar más imagenes'
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      $(this).before($(this).data('fields').replace(regexp, time))
    else
      console.log 'No se puede agregar más imagenes'
      alert 'Imagenes cargadas: ' + article_image_count + '. Ha llegado al numero máximo de imagenes para publicar un producto'    