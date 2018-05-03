
$(document).ready(
    $('.show-button').on('click', function() {
        $('.login-form').slideToggle();
    }),

    $('.ajax-button').on('click', function(){
        $.ajax(
            {
                type: 'get',
                url: "/ajax/students/allJson",
                dataType: "json",
                success: function (risposta) {
                    var template = $('#template').html();
                    Mustache.parse(template);
                    $('#showData').empty();
                    risposta.forEach(function (item) {
                        var rendered = Mustache.render(template, item);
                        $('#showData').append(rendered);
                    });
                },
                error: function () {
                    alert("Chiamata fallita!");
                }
            }
        )
        })

);
