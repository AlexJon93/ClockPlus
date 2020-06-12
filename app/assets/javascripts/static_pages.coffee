# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener("turbolinks:load", ->
    storage = window.localStorage

    if storage.getItem('theme') == null
        storage.setItem('theme', 'dark-theme')

    $('html').attr('class', storage.getItem('theme'))
    $('#'+storage.getItem('theme')).toggleClass('active')

    $('#hour-box').click (e) ->
        $.ajax({
            type: "GET",
            url: "/toggle_hour",
            data: {
                setting: this.checked
            }
        })
    $('.cancel-btn').click (e) ->
        $('.search-field').val('')
    $('.theme-btn').click (e) ->
        $('.active').toggleClass('active')
        $(this).toggleClass('active')
        $('html').attr('class', $(this).val())
        storage.setItem('theme', $(this).val());
)