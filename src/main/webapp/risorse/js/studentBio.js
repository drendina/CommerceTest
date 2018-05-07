$(document).ready(function(){
    $('.buttonTest').on('click', validateBioForm())

})

function validateBioForm(){
   var x, text;
   $('')
   x = document.getElementById("voto").value();
   if ( isNaN(x) | x < 18 | x > 30){
       text = "Invalid input, try to insert a number between 18 and 30";
   } else {
       text ="input ok";
   }
   document.getElementById("response").innerHTML = text;
}

