//function to show hint message
function showMessage(message)
{
    document.getElementById('spanHint').innerHTML = message;
}
//function to hide hint
function removeMessage() {
    document.getElementById('spanHint').innerHTML = "";
}
//function to show after form submission
function alertSubmission(message) {
    alert(message);
    document.getElementById('spanHint').innerHTML = message;
}