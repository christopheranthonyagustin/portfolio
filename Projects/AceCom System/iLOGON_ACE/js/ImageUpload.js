function disableBtn(id, check) {
    if (check) {
        if (Page_ClientValidate('')) {
            var btn = document.getElementById(id);
            btn.disabled = true;
            btn.value = "Processing..";
        }
        else {
            return false;
        }
    }
    else {
        var btn = document.getElementById(id);
        btn.disabled = true;
        btn.value = "Processing..";
    }
}

function disableButton(button) {
    button.disabled = true;
    button.innerText = "Processing.."; // You can change the text as needed
}

function ImagePopupClose() {
    $('#imageModal').modal('hide');
}