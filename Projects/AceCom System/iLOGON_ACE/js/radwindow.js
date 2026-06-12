
function CloseAndRebind(args) {
    GetRadWindow().BrowserWindow.refreshGrid(args);
    GetRadWindow().close();
}

function GetRadWindow() {
    var oWindow = null;
    if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
    else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz as well)
    return oWindow;
}

function CancelEdit(url) {
    GetRadWindow().close();
    //GetRadWindow().BrowserWindow.location.reload(); //javascript problem occurs
    GetRadWindow().BrowserWindow.location.href = GetRadWindow().BrowserWindow.location.href;
}