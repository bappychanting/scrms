var modal = document.getElementById('warning');

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("message fa fa-remove")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
    modal.style.display = "none";
}	