# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener("turbolinks:load", ->
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
    # $('remove-icon').click (e) ->
)