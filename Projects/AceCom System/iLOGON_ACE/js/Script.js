var popUp; 

function OpenCalendar(idname, postBack)
{
	popUp = window.open('../Control/Calendar.aspx?formname=' + document.forms[0].name + 
		'&id=' + idname + '&selected=' + document.forms[0].elements[idname].value + '&postBack=' + postBack, 
		'popupcal', 
		'width=165,height=250,left=200,top=250');
}
function OpenAccount(idname, postBack)
{
	popUp = window.open('../Control/AccountLookup.aspx?formname=' + document.forms[0].name + 
		'&id=' + idname + '&selected=' + document.forms[0].elements[idname].value + '&postBack=' + postBack, 
		'popupcal', 
		'width=900,height=550,left=50,top=80');
}
function OpenSku(idname, postBack)
{
	popUp = window.open('../Control/SkuLookup.aspx?formname=' + document.forms[0].name + 
		'&id=' + idname + '&selected=' + document.forms[0].elements[idname].value + '&postBack=' + postBack, 
		'popupcal', 
		'width=900,height=550,left=50,top=80');
}
function OpenSkuLocLotTu(idname, postBack)
{
	popUp = window.open('../Control/SkuLocLotTuLookup.aspx?formname=' + document.forms[0].name + 
		'&id=' + idname + '&selected=' + document.forms[0].elements[idname].value +
		'&postBack=' + postBack, 
		'popupcal', 
		'width=900,height=550,left=50,top=80');
}
function OpenSkuLocLotTuXSku(idname, postBack)
{
	popUp = window.open('../Control/SkuLocLotTuLookupXSku.aspx?formname=' + document.forms[0].name + 
		'&id=' + idname + '&selected=' + document.forms[0].elements[idname].value +
		'&postBack=' + postBack, 
		'popupcal', 
		'width=900,height=550,left=50,top=80');
}
function SetDate(formName, id, newDate, postBack)
{
	eval('var theform = document.' + formName + ';');
	popUp.close();
	theform.elements[id].value = newDate;
	if (postBack)
		__doPostBack(id,'');
}		
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
function disableCirBtn(id, check) {
    if (check) {
        if (Page_ClientValidate('')) {
            var btn = document.getElementById(id);
            btn.disabled = true;
            btn.value = "...";
        }
        else {
            return false;
        }
    }
    else {
        var btn = document.getElementById(id);
        btn.disabled = true;
        btn.value = "...";
    }
}

function ContainerNoCheckDigit(containterno)
{
    if (containterno != "")
    {
        // remove spaces from containterno
        containterno = containterno.replace(/\s/g, '').toUpperCase();

        // declare AlphabetNumerical value 
        this.alphabetNumerical = {
            '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
            'A': 10, 'B': 12, 'C': 13, 'D': 14, 'E': 15, 'F': 16, 'G': 17, 'H': 18, 'I': 19,
            'J': 20, 'K': 21, 'L': 23, 'M': 24, 'N': 25, 'O': 26, 'P': 27, 'Q': 28, 'R': 29,
            'S': 30, 'T': 31, 'U': 32, 'V': 34, 'W': 35, 'X': 36, 'Y': 37, 'Z': 38
        };

        var ownercode = containterno.substring(0, 3);
        var productgrpcode = containterno.substring(3, 4);
        var registrationnum = containterno.substring(4, 10);
        var checkdigit = containterno.substring(10, 11);

        if (containterno.length == 11) {
            var regexchar = /^[a-zA-Z]+$/;
            if (!ownercode.match(regexchar)) {
                return "Invalid ContainerNo";
            }

            if (!productgrpcode.match(regexchar)) {
                return "Invalid ContainerNo";
            }

            if (isNaN(registrationnum)) {
                return "Invalid ContainerNo";
            }

            if (isNaN(checkdigit)) {
                return "Invalid ContainerNo";
            }
        }
        else
        {
            return "Invalid ContainerNo";
        }

        sumDigit = 0;
        var ctnrno_array = containterno.split('');

        // convert owner code + product group code to its numerical value
        for (var i = 0; i < 10 ; i++) {
            sumDigit += this.alphabetNumerical[ctnrno_array[i]] * Math.pow(2, i);
        }

        sumDigitDiff = Math.floor(sumDigit / 11) * 11;
        CtnrDigit = sumDigit - sumDigitDiff;
        if (CtnrDigit == 10)
            CtnrDigit = 0;

        if (CtnrDigit != checkdigit)
            return "Invalid ContainerNo";
        else
            return "Valid";
    }
}

function callRadConfirm(Message, HiddenButton, MainButton) {
    function callbackFn(args) {
        if (args) {
            __doPostBack(HiddenButton, ""); //Call Postback when Click the RadWindow's OK button
            var Button = document.getElementById(MainButton);
            Button.disabled = true;
            Button.value = "Processing...";
        }
    }
    radconfirm(Message, callbackFn, 400, 150, null, "Confirm");
}


function SetDynamicPageTitle(TitleName, HiddenButton) {
    parent.parent.document.title = TitleName;
}

function ModalPopupClose() {
    parent.document.location.href = parent.document.location.href;
}

function DownloadExcelFile(Base64Data, FileName) {
    // Convert base64 string back to a byte array
    var ByteArray = new Uint8Array(atob(Base64Data).split('').map(function (c) { return c.charCodeAt(0); }));

    // Create a Blob object with the byte array data
    var blob = new Blob([ByteArray], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });

    // Create a download link element
    var DownLoadLink = document.createElement('a');
    DownLoadLink.href = URL.createObjectURL(blob);
    DownLoadLink.download = FileName;

    // Trigger the download by simulating a click on the link
    document.body.appendChild(DownLoadLink);
    DownLoadLink.click();
    document.body.removeChild(DownLoadLink);
}

 // Remove Tailing space when copy
document.addEventListener('copy', function (e) {
    var selectedText = window.getSelection().toString();
    selectedText = selectedText.trim();
    // Check if there are whitespace or blank characters at the end
    if (/[\s\uFEFF\xA0]+$/.test(selectedText)) {
        console.log("Selected text has whitespace at the end.");
    } else {
        console.log("Selected text does not have whitespace at the end.");
    }
    var tempDiv = document.createElement('div');
    tempDiv.innerHTML = selectedText;
    var strippedText = tempDiv.textContent || tempDiv.innerText;
    e.clipboardData.setData('text/plain', strippedText);
    e.preventDefault(); // Prevent the default copy behavior
});