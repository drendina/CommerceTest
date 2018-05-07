$(document).ready( function() {

    $('.show-button').on('click', function () {
        $('.login-form').slideToggle();
    });

    $('.ajax-button').on('click', refresh());

});



function validateForm(){
    //recuperare valore con selettore jQuery
    var x = document.forms["myForm"]["firstname"].value;
    if (x == "") {
        alert("Name must be filled out");
        return false;
    }
    var y = document.forms["myForm"]["lastname"].value;
    if (y == ""){
        alert("Surname must be filled out");
        return false;
    }
    refresh()
}

function refresh(){
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

}