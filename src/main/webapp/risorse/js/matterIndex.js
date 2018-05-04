$(document).ready(function(){
    loadPage();
// TODO fix
    $('#buttonSub').on('click', checkForm);

});

function loadPage(){
    $.ajax({
        type: 'GET',
        url: "/ajax/matters/allMatterJson",
        dataType: "json",
        success: function(response){
            alert("Chiamata effettuata!")
            var template = $('#templateMatter').html();
            Mustache.parse(template);
            $('#showMatterData').empty();
            response.forEach( function (item) {
                var rendered = Mustache.render(template, item);
                $('#showMatterData').append(rendered);
            });
        },
        error: function() {alert("Chiamata fallita!");}

    })

}

function checkForm(){
    var x = $('#myForm [name=matterName]').val();
    if(x == ""){
        alert("Inserire nome valido");
        return false;
    }
}