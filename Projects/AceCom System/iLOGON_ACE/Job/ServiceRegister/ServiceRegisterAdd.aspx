<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceRegisterAdd.aspx.cs" Inherits="iWMS.Web.Job.ServiceRegister.ServiceRegisterAdd" %>
<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ServiceRegisterAdd</title> 
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <style type="text/css">
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
    </style>
    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script src="../../js/telerikScrip.js" type="text/javascript"></script>
    </telerik:RadScriptBlock>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        CausesValidation="False" RenderMode="Lightweight" SelectedIndex="0" Skin="Office2007"
        AutoPostBack="True">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server" Selected="True">
            </telerik:RadTab>
            <telerik:RadTab Text="Book-a-Date" Value="100" runat="server">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage"
        RenderSelectedPageOnly="true">
        <telerik:RadPageView runat="server" Height="700px" ID="RadPageView1"> 
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                    <br />&nbsp;
                    <asp:Button ID="AddBtn" runat="server" Text="Add" class="white" OnClick="AddBtn_Click" 
                        OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false"/>
                    </td>
                    <td>
                    <asp:UpdatePanel ID="SCPanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                    <ContentTemplate>
                    <br />
                    &nbsp;
                    <asp:Button ID="InputPopup" class="white" runat="server" Text="Instruction" 
                        OnClientClick="window.open('TransportStandingOrder.aspx','popUpWindow', 'height=341,width=542,left=100,top=30,resizable=No,scrollbars=No,toolbar=no,menubar=no,location=no,directories=no, status=No');" Visible="false" />
                    <asp:Button ID="InputPopupNo" class="white" runat="server" Text="Instruction" disabled="true" 
                        OnClientClick="window.open('TransportStandingOrder.aspx','popUpWindow', 'height=341,width=542,left=100,top=30,resizable=No,scrollbars=No,toolbar=no,menubar=no,location=no,directories=no, status=No');" Visible="false" />
                    </ContentTemplate>
                    </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
            <br />             
            <asp:UpdatePanel ID="SCPanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <iWMS:iForm ID="formCtl" runat="server" />             
                <iWMS:iForm ID="formCtl2" runat="server" />
            </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" Height="70%" ID="BookADateRadPageView" >
            <table border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <br />&nbsp;
                        <asp:Button ID="RefreshBtn" runat="server" Text="Refresh" CssClass="white" OnClick="RefreshBtn_Click" 
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top">
                        <iWMS:iForm ID="formCtlBook" runat="server"></iWMS:iForm>
                    </td>
                    <td style="width:5px">
                    </td>
                    <td>
                        Resource
                        <br />
                        <telerik:RadListBox runat="server" ID="ResourceList" Height="120px" Width="190px"
                            ButtonSettings-AreaWidth="35px" AllowTransfer="true" TransferToID="SelectedResourceList"
                            TransferMode="Move" AllowTransferDuplicates="false" SelectionMode="Multiple"
                            Skin="Sunset" AllowReorder="false" AllowDelete="false" AutoPostBackOnTransfer="true"
                            OnTransferred="ResourceList_Transferred">
                        </telerik:RadListBox>
                        <telerik:RadListBox runat="server" ID="SelectedResourceList" Height="120px" Width="160px"
                            Skin="Sunset" ButtonSettings-AreaWidth="35px" SelectionMode="Multiple" AllowReorder="false"
                            AllowDelete="false">
                        </telerik:RadListBox>
                    </td>
                    <td style="width:10px">
                    </td>
                    <td style="vertical-align:top">
                        <br />
                        <br />
                        <asp:LinkButton class="btn btn-info btn-xs" runat="server" ID="PrevBtn" OnClick="PrevBtn_Click">
                        <span class="glyphicon glyphicon-triangle-left"></span></asp:LinkButton>
                    </td>
                    <td style="width:4px">
                    </td>
                    <td style="vertical-align:top">
                        <iWMS:iForm ID="formCtlBook2" runat="server"></iWMS:iForm>
                    </td>
                    <td style="vertical-align:top">
                        <br />
                        <br />
                        <asp:LinkButton class="btn btn-info btn-xs" runat="server" ID="NextBtn" OnClick="NextBtn_Click">
                        <span class="glyphicon glyphicon-triangle-right"></span></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                        <asp:Button ID="BookBtn" runat="server" Text="Book" CssClass="white" OnClick="BookBtn_Click" 
                            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    </td>
                </tr>
            </table>
            <br />
            <div id="div-radgrid">
                <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" AllowPaging="false" AllowSorting="true" 
                    OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" EnableViewState="false" AllowFilteringByColumn="false">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="true"></Selecting>
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true">        
                        <Columns>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    &nbsp;<asp:Button ID="CopyBtn" runat="server" Text="Copy" Visible="False" CssClass="detailbutton"
        OnClick="CopyBtn_Click" />
    <asp:ValidationSummary HeaderText="The following field(s) need to be entered correctly:"
        DisplayMode="BulletList" EnableClientScript="true" runat="server" ID="valSummary"
        CssClass="RedText" />
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;" DefaultButton="btnOk">
        <div class="popupHeader" style="width: 420px;">
            <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
            <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
        </div>
        <div style="max-height: 500px; width: 420px; overflow: hidden;">
            <div style="float: left; width: 380px; margin: 20px;">
                <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                    <tr>
                        <td style="text-align: left; vertical-align: top; width: 11%;">
                            <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                        </td>
                        <td style="width: 2%;">
                        </td>
                        <td style="text-align: left; vertical-align: top; width: 87%;">
                            <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">                                
                                <asp:Button ID="btnOk" runat="server" Text="OK" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <%--Message popup area end--%>
    </form>
</body>
</html>