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

function DisableBtn(id, check) {
    if (check) {
        if (Page_ClientValidate('')) {
            var btn = document.getElementById(id);
            btn.disabled = true;
            btn.innerHTML = "Processing...";
        }
        else {
            return false;
        }
    }
    else {
        var btn = document.getElementById(id);
        btn.disabled = true;
        btn.innerHTML = "Processing...";
    }
}