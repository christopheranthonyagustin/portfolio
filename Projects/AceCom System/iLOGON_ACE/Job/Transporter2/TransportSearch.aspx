<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="TransportSearch.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.Transporter2.TransportSearch" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransportSearch</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <style type="text/css">
        .style1
        {
            width: 60px;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server" defaultbutton="SearchImgBtn">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
<%--    <table width="20%" id="report" runat="server">
        <tr>--%>
<%--            <td class="style1">
              <asp:ImageButton ID="SearchImgBtn" runat="server" ImageUrl="../../Image/Search.png" Visible="true" BackColor="Transparent" 
                BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle" OnClick="SearchBtn_Click" /> 
            </td>
            <td class="style1">
                <asp:ImageButton ID="excelImgBtn" runat="server" ImageUrl="../../Image/Excel.png"
                    Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" 
                    ImageAlign="AbsMiddle" ToolTip="Export To Excel" OnClick="ExportExcel" />
            </td>
                <td>--%>
                    <asp:Button ID="SearchImgBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="excelImgBtn" class="green" runat="server" OnClick="ExportExcel" Text="Excel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
<%--                </td>
        </tr>
    </table>--%>
    <br />
    <br />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        RenderMode="Lightweight" SelectedIndex="0" Skin="Windows7" CausesValidation="false"
        AutoPostBack="true">
        <Tabs>
            <telerik:RadTab Text="Search" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
           <%-- <telerik:RadTab Text="EXIM" Value="1" runat="server">
            </telerik:RadTab>
            <telerik:RadTab Text="Party" Value="2" runat="server">
            </telerik:RadTab>--%>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
        <telerik:RadPageView runat="server" Height="700px" ID="RadPageView1"><br />
            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="RadPageView2">
            <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="700px" ID="RadPageView3">
            <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    &nbsp;<asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False"
        CssClass="errorLabel"></asp:Label></form>
</body>
</html>
