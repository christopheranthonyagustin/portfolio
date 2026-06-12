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

function Validate(id) {
    var btn = document.getElementById(id);
    if (Page_ClientValidate("Success")) {
        var btn = document.getElementById(id);
        var DisableBtn = btn.classList.contains('aspNetDisabled')
        if (!DisableBtn) {
            btn.className = 'aspNetDisabled btn';
            btn.innerHTML = "Processing...";
        }
    }
    else
    {
        alert("Please make sure all fields are not blank.");
    }
}

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