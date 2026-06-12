function disableBtn(id, check) {
    if (check) {
        if (Page_ClientValidate('')) {
            var btn = document.getElementById(id);
            btn.disabled = true;
            btn.value = "Processing...";
        }
        else {
            return false;
        }
    }
    else {
        var btn = document.getElementById(id);
        btn.disabled = true;
        btn.value = "Processing...";
    }
}
