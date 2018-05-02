
$(document).ready(
    $('.show-button').on('click', function() {
        $('.login-form').slideToggle();
    })

    $('.ajax-button').on('click', function() {
        $.ajax({
            type: get,
            // url: "${ajax_students_basepath}/allJson",
            url: "/ajax/students/allJson",
            dataType: "json",
            success: function(risposta) {
                alert("Chiamata effettuata!")
                // $('.risposta').html(risposta);
            },
            error: function () {
                alert("Chiamata fallita!");
            }

        })//close $.ajax
    })

);
