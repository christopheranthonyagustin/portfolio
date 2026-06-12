
//Prevent resubmission when page is refresh
if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.href);
}

// We will refresh location after showing Alertbox 
function close() {
    window.location.reload(true);
}

//For Master Checkbox and Record Level Checkbox
function selectAll(invoker) {
    var inputElements = document.getElementsByTagName('input');
    for (var i = 0; i < inputElements.length; i++) {
        var myElement = inputElements[i];
        if (myElement.type === "checkbox") {
            myElement.checked = invoker.checked;
        }
        else {
            myElement.checked = invoker.UnChecked
        }
    }
}