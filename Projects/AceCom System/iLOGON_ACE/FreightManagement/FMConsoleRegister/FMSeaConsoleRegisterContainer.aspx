<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMSeaConsoleRegisterContainer.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMConsoleRegister.FMSeaConsoleRegisterContainer" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FMJobRegisterRoute</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>

    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="false" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="100px" ID="RidesPageView">
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" Height="5px" Width="100%" ID="HeaderRadPageView">
                        <br />
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:Button ID="Button2" runat="server" CssClass="white" Text="NewCtnr" ValidationGroup="reqvalgrp"
                                OnClick="NewContainer_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <br />
                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server">
                        </asp:Panel>
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                                    AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" >
                                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                        <Selecting AllowRowSelect="true" />
                                    </ClientSettings>
                                    <SortingSettings EnableSkinSortStyles="false" />
                                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                    <ItemStyle Wrap="false"></ItemStyle>
                                    <HeaderStyle Wrap="false"></HeaderStyle>
                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                        <Columns>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                <HeaderTemplate>
                                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                                <ItemStyle Wrap="False"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit" OnClick="ldEdit_Click"
                                                         BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="Number" UniqueName="Number" HeaderText="Container"
                                                ShowFilterIcon="true" AllowFiltering="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="SealNo1" UniqueName="SealNo1" SortExpression="SealNo1" HeaderText="Seal Number">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Mode" UniqueName="Mode" HeaderText="Mode" ShowFilterIcon="true" AllowFiltering="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Type" UniqueName="Type" HeaderText="Ctnr Type" ShowFilterIcon="true" AllowFiltering="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="DeliveryMode" UniqueName="DeliveryMode" HeaderText="Delivery Mode" ShowFilterIcon="true" AllowFiltering="true">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="GrossWT" UniqueName="GrossWT" SortExpression="GrossWT" ShowFilterIcon="true" AllowFiltering="true"
                                                HeaderText="Gross Weight">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="Quality" UniqueName="Quality" SortExpression="Quality" ShowFilterIcon="true" AllowFiltering="false"
                                                HeaderText="WQ">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="status" Display="false">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <iWMS:MsgPopup ID="MsgPopup1" runat="server"></iWMS:MsgPopup>
                            </ContentTemplate>
                            <Triggers>
                            </Triggers>
                        </asp:UpdatePanel>
                        <br />
                        <asp:Panel ID="Panel3" runat="server">
                            <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                                OnClick="AddnewRouteBtn_Click"  OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"  />
                            <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                OnClick="UpdateRouteBtn_Click"  OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                                OnClick="newRidesCancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                            <br />
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <br />
                                    <iWMS:iForm ID="formCtl2" runat="server" Visible="false"></iWMS:iForm>
                                    <iWMS:iForm ID="formCtl_Rides" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
