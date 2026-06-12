function DisableSubmitBtn(sender, args) {
       if(! Page_ClientValidate('')) return;
       sender.set_enabled(false);
       sender.set_text("Processing...");    
}

function rebind_Combobox_SelectedIndexChanged(sender, args, controlIdToUpdate) {
    var newValue = sender.get_value().split("|")[1];

    //$find(clientIdControlToUpdate).set_value(newValue);

    var currentTable = $telerik.$(sender.get_element()).closest("tbody")[0];
    $telerik.findControl(currentTable, controlIdToUpdate).set_value(newValue);
}