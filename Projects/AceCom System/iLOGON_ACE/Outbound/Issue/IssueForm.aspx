<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="IssueForm.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.Issue.IssueForm" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>IssueForm</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
     <link rel="stylesheet" type="text/css" href="../../css/style.css">

</head>
<body onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
         <asp:Label Style="z-index: 0" ID="isstatusLbl" runat="server" Visible="False"></asp:Label>
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false"  MultiPageID="RadMultiPage1"
        AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Shipping" Value="100" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Party" Value="150" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="SKULine" Value="200" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="PickTask" Value="250" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="PackBySKU" Value="255" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Pack" Value="260" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="PackInstruc" Value="300" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Charge" Value="400" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Container" Value="450" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="LoadPlanning" Value="460" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Task" Value="500" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="InvHistory" Value="550" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Attachment" Value="600" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Notify" Value="650" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="ShipDetail" Value="660" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Log" Value="700" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Upload" Value="750" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <table>
        <tr>
            <td><br />
                <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
            <td><br />
                <telerik:RadMenu ID="RadMenu1" runat="server" ClickToOpen="true" ExpandAnimation-Type="None">
                    <Items>
                        <telerik:RadMenuItem Text="Print">
                        </telerik:RadMenuItem>
                    </Items>
                </telerik:RadMenu>
            </td>
        </tr>
    </table>       
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
        <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
            <br />
            <asp:Button ID="UpdateBtn" runat="server" Text="Update" Visible="False" OnClientClick="disableBtn(this.id,true)" 
                UseSubmitBehavior="false" CssClass="white" OnClick="UpdateBtn_Click"></asp:Button>
                 &nbsp;
            &nbsp;<asp:Button ID="GenIssueBtn" runat="server" Text="GenIssue" Visible="false" OnClientClick="disableBtn(this.id,true)"
                UseSubmitBehavior="false" CssClass="white" OnClick="GenIssueBtn_Click"></asp:Button>
                &nbsp;
            &nbsp;
                <asp:Button ID="AllocatedImgBtn" runat="server" Text="Allocate" OnClick="AllocatedImgBtn_Click"
                    OnClientClick="disableBtn(this.id,false)"
                    UseSubmitBehavior="false" CssClass="white" ToolTip="Allocate Selected Issue(s)" />
                <br />
            <br />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </ContentTemplate>
            </asp:UpdatePanel> 
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="IssueInfoRadPageView">
            <br />
            &nbsp;<asp:Button ID="UpdateBtn2" runat="server" Text="Update" Visible="False" OnClientClick="disableBtn(this.id,false)" 
                UseSubmitBehavior="false" CssClass="white" OnClick="UpdateBtn_Click"></asp:Button><br />
            <br />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                     <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="PartyRadPageView">
            <br />
            &nbsp;<asp:Button ID="UpdateBtn3" runat="server" Text="Update" Visible="False" OnClientClick="disableBtn(this.id,false)" 
                UseSubmitBehavior="false" CssClass="white"  OnClick="UpdateBtn_Click"></asp:Button><br />
            <br />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                     <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="SKULineRadPageView" />
        <telerik:RadPageView runat="server" Height="700px" ID="PickDetailRadPageView" />
        <telerik:RadPageView runat="server" Height="700px" ID="PackBySKURadPageView" />
        <telerik:RadPageView runat="server" Height="690px" ID="PackRadPageView" />
        <telerik:RadPageView runat="server" Height="700px" ID="PackInstrucRadPageView" />
        <telerik:RadPageView runat="server" Height="480px" ID="ChargesRadPageView" />
        <telerik:RadPageView runat="server" Height="700px" ID="ContainerRadPageView" />
        <telerik:RadPageView runat="server" Height="430px" ID="LoadPlanningRadPageView" />
        <telerik:RadPageView runat="server" Height="700px" ID="TaskRadPageView" />
        <telerik:RadPageView runat="server" Height="700px" ID="InvHistoryRadPageView" />
        <telerik:RadPageView runat="server" Height="700px" ID="AttcRadPageView" />
        <telerik:RadPageView runat="server" Height="700px" ID="NotifyRadPageView">
            <br />
            &nbsp;<asp:Button ID="UpdateBtn5" runat="server" Text="Update" Visible="False" OnClientClick="disableBtn(this.id,false)" 
                UseSubmitBehavior="false" CssClass="white" OnClick="UpdateBtn_Click"></asp:Button><br />
            <br />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                     <iWMS:iForm ID="formCtl5" runat="server"></iWMS:iForm>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="ShipDetailRadPageView" />
        <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView" />
        <telerik:RadPageView runat="server" Height="700px" ID="UploadRadPageView" />
    </telerik:RadMultiPage>
    </form>
</body>
</html>
