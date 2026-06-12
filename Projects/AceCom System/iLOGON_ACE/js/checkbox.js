 function checkBoxes (form, check) {
 for (var c = 0; c < form.elements.length; c++)
   if (form.elements[c].type == 'checkbox')
     form.elements[c].checked = check;
}
function CheckAllC(form, check)
{
var flag="";
var ln=form.elements.length;
alert(ln);
for (var c = 0; c < form.elements.length; c++)
{
    if (form.elements[c].type == 'checkbox')
{
if(form.elements[c].checkbox.check==true)
{

flag=1;
continue;
}
}
}
if(flag==1)
{checkBoxes(form, check);}
}

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
