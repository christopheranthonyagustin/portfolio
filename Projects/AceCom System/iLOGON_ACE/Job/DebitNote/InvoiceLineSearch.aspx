<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceLineSearch.aspx.cs" Inherits="iWMS.Web.Job.DebitNote.InvoiceLineSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>InvoiceLineSearch</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>

</head>
<body>
    <form id="Form1" method="post" runat="server" defaultbutton="Searchbtn">
        <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
        <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0" Visible="False"></asp:Label>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="InvoiceLineSearch" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <asp:Button ID="Searchbtn" runat="server" Text="Search" OnClick="Searchbtn_Click"
            OnClientClick="disableBtn(this.id)" ToolTip="Search" UseSubmitBehavior="false" CssClass="white" />
        &nbsp;
          <asp:Button ID="Excelbtn" runat="server" Text="Excel" OnClick="Excelbtn_Click"
              OnClientClick="disableBtn(this.id)" ToolTip="Export to excel" UseSubmitBehavior="false" CssClass="green" />
        <br />
        <br />

        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>

    </form>
</body>
</html>
