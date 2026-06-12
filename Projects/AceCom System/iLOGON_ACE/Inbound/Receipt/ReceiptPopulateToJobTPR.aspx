<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<%@ Page Language="c#" CodeBehind="ReceiptPopulateToJobTPR.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Inbound.Receipt.ReceiptPopulateToJobTPR" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Populate GR to Job Register</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
   <base target="_self">
    <script language="javascript">
		    function SelectAllCheckboxesSpecific(spanChk) {
		        var IsChecked = spanChk.checked;
		        var Chk = spanChk;
		        Parent = document.getElementById('ResultDG');
		        var items = Parent.getElementsByTagName('input');
		        for (i = 0; i < items.length; i++) {
		            if (items[i].id != Chk && items[i].type == "checkbox") {
		                if (items[i].checked != IsChecked) {
		                    items[i].click();
		                }
		            }
		        }
		    }
 
    </script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <table style="z-index: 0" id="Table1" border="0" cellspacing="3" cellpadding="3"
        width="100%">
          
        <tr>
            <td valign="top" width="30%">
                <table id="Table2">
                    <tr>
                        <td>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>           
               &nbsp;<asp:Button ID="PopulateBtn" runat="server" CssClass="detailbutton" Text="Populate"
                        OnClick="PopulateBtn_Click"></asp:Button>&nbsp;<br>
                &nbsp;<br />
                <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                    Visible="False"></asp:Label>
                     <asp:LinkButton Style="z-index: 0" ID="LinkLbl" runat="server" CssClass="linkLabelBig"
        OnClick="LinkLbl_Click"></asp:LinkButton>   
           <asp:LinkButton Style="z-index: 0" ID="LinkLbl1" runat="server" CssClass="linkLabelBig"  Visible="False"></asp:LinkButton>   
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
