<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="ShipmentForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.Shipment.ShipmentForm" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DeclarationForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>

</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0"
    topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7" CausesValidation="false">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Transport" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Party" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Container" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Invoice" Value="250" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Items" Value="300" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="CPC" Value="350" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Sum" Value="400" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Attc" Value="550" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="450" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Upload" Value="500" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>&nbsp;&nbsp;
                </td>
                <td>
                    <br />
                    <asp:Button ID="PopulateGRBtn" runat="server" Skin="WebBlue" Text="Populate GR"
                        Visible="false" CssClass="LongLabelGreen" OnClick="PopulateReceiptBtn_Click"></asp:Button>
                    &nbsp;
                <asp:Button ID="BackButton" runat="server" CssClass="white" Visible="false" Text="Hide"
                    OnClick="BackButton_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                &nbsp;
            <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Visible="false" Text="Update"
                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                &nbsp;
            <br>
                <br>
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="TransportRadPageView">
                <br />
                &nbsp;
            <asp:Button ID="UpdateBtn2" runat="server" CssClass="white" Visible="false" Text="Update"
                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                &nbsp;<br />
                <br />
                <br />
                <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="PartyRadPageView">
                <br />
                &nbsp;
            <asp:Button ID="UpdateBtn3" runat="server" CssClass="white" Visible="false" Text="Update"
                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />

                &nbsp;<br />
                <br />
                <br />
                <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="ContainerRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="InvoiceRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="ItemsRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="CPCRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="SumRadPageView">
                <p>
                    <asp:Button ID="RefreshButton" runat="server" CssClass="white" Visible="true" Text="Refresh"
                        OnClick="RefreshButton_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="UpdateBtn4" runat="server" CssClass="white" Visible="false" Text="Update"
                        OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <br />
                    <asp:Label ID="Id4Lbl" runat="server" CssClass="pagetitle" Visible="false"></asp:Label>&nbsp;
                    <asp:Label Style="z-index: 0" ID="msgLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label><br>
                    <iWMS:iForm ID="formCtl4" runat="server"></iWMS:iForm>
                    <p>
                    </p>
                    <p>
                        &nbsp;
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                </p>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="UploadRadPageView" />
        </telerik:RadMultiPage>
        <asp:ValidationSummary ID="valSummary" runat="server" CssClass="RedText" EnableClientScript="true"
            DisplayMode="BulletList" HeaderText="The following field(s) need to be entered correctly:"></asp:ValidationSummary>
    </form>
</body>
</html>
