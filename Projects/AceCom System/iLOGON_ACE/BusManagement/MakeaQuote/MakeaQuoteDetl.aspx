<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MakeaQuoteDetl.aspx.cs" Inherits="iWMS.Web.BusManagement.MakeaQuote.MakeaQuoteDetl" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>QuotationDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function ResultDG_RowDblClick(sender, args) {
	            var index = args.get_itemIndexHierarchical(); 
	            var tableView = args.get_tableView(); 
	            var rows = tableView.get_dataItems(); 
	            var selectedrow = rows[index];
	            var acid = selectedrow.getDataKeyValue('acid');
	            window.location = '../Account/AccountDetl.aspx?acId=' + acid + '&tab=Control';
	        }  
   </script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <table id="table1" border="0" cellspacing="12" cellpadding="0" runat="server">
            <tr>
                <td align="left">
                      <asp:Button ID="SaveNextBtn" runat="server" Text="Save+Next" ToolTip="SaveAndNext" OnClick="SaveNextBtn_Click"
                                 OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" Visible="false"/>
                </td>
                <td align="left">
                    <asp:Button ID="SaveBtn" runat="server" Text="Save" ToolTip="Save" OnClick="SaveBtn_Click"
                                  OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" Visible="false" />
                </td>
                <td align="left">
                     <asp:Button ID="UpdateBtn" runat="server" Text="Update"  OnClick="UpdateBtn_Click"
                                  OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" CssClass="white" Visible="false"  ToolTip="Update Records" />
                </td>
                <td align="left">
                     <asp:Button ID="BackButton" runat="server" Text="Hide" ToolTip="Hide" OnClick="BackButton_Click"
                                       OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" CssClass="white" CausesValidation="False" />
                </td>
            </tr>
        </table>
        <br />
        <div runat="server" style="overflow: auto">
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        </div>
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    </form>
</body>
</html>
