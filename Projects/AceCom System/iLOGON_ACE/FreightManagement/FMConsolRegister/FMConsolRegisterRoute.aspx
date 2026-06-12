<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMConsolRegisterRoute.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMConsolRegister.FMConsolRegisterRoute" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FMConsoleRegisterRoute</title>
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
        <table width="100%">
            <tr>
                <td>
                    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
                        <telerik:RadPageView runat="server" ID="HeaderRadPageView" Height="5px">
                            <br />
                            <asp:Panel ID="Panel1" runat="server">
                                <asp:Button ID="NewRouteBtn" runat="server" CssClass="white" Text="NewRoute" ValidationGroup="reqvalgrp"
                                    OnClick="NewRouteBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                <br />
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server">
                            </asp:Panel>
                            <br />
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                                        AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
                                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                            <Selecting AllowRowSelect="true" />
                                        </ClientSettings>
                                        <SortingSettings EnableSkinSortStyles="false" />
                                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                        <ItemStyle Wrap="false"></ItemStyle>
                                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" TableLayout="Auto">
                                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                            <Columns>
                                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="5px" ItemStyle-Width="5px">
                                                    <HeaderTemplate>
                                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="10px" ItemStyle-Width="10px">
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton runat="server" Visible="True" ID="EditBtn"
                                                            ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit" OnClick="ldEdit_Click"
                                                            BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                        <asp:ImageButton ID="Delete" runat="server" Visible="True" ImageUrl="../../image/deleted.png" ToolTip="Delete"
                                                            Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteIcon_Click"
                                                            OnClientClick="return confirm('Are you sure you want to delete Route Information ?');"
                                                            BorderWidth="0"></asp:ImageButton>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="TransportMode" UniqueName="TransportMode" HeaderText="TransportMode"
                                                    ShowFilterIcon="false" AllowFiltering="false" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Type" UniqueName="Type" HeaderText="Type" ShowFilterIcon="false" AllowFiltering="false" HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="LegOrder" UniqueName="LegOrder" SortExpression="LegOrder" HeaderText="LegOrder" ShowFilterIcon="false" AllowFiltering="false" HeaderStyle-Width="10px" ItemStyle-Width="10px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Vessel" UniqueName="Vessel" HeaderText="Vessel" ShowFilterIcon="false" AllowFiltering="false" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Voyage" UniqueName="Voyage" HeaderText="Voyage" ShowFilterIcon="false" AllowFiltering="false" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="IMO" UniqueName="IMO" HeaderText="IMO" ShowFilterIcon="false" AllowFiltering="false" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Flight" UniqueName="Flight" HeaderText="Flight" ShowFilterIcon="false" AllowFiltering="false" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="AirCraftRegNo" UniqueName="AirCraftRegNo" HeaderText="AirCraftRegNo" ShowFilterIcon="false" AllowFiltering="false" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="ETD" UniqueName="ETD" SortExpression="ETD" HeaderStyle-Width="100px" ItemStyle-Width="100px"
                                                    HeaderText="ETD" DataFormatString="{0:dd/MMM/yyyy}" ShowFilterIcon="false" AllowFiltering="false">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="ETA" UniqueName="ETA" SortExpression="ETA" HeaderStyle-Width="100px" ItemStyle-Width="100px"
                                                    HeaderText="ETA" DataFormatString="{0:dd/MMM/yyyy}" ShowFilterIcon="false" AllowFiltering="false">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="POLDescr" UniqueName="LoadPort" SortExpression="LoadPort" ShowFilterIcon="false" AllowFiltering="false"
                                                    HeaderText="LoadPort" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="DepartureFrom" UniqueName="DepartureFrom" SortExpression="DepartureFrom" ShowFilterIcon="false" AllowFiltering="false"
                                                    HeaderText="DepartureFrom" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="PODDescr" UniqueName="DischargePort" SortExpression="DischargePort" ShowFilterIcon="false" AllowFiltering="false"
                                                    HeaderText="DischargePort">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="ArrivalAt" UniqueName="ArrivalAt" SortExpression="ArrivalAt" ShowFilterIcon="false" AllowFiltering="false"
                                                    HeaderText="ArrivalAt" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="adddate" UniqueName="adddate" SortExpression="adddate" HeaderText="AddDate" ShowFilterIcon="false" AllowFiltering="false"
                                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="adduser" UniqueName="adduser" SortExpression="adduser" ShowFilterIcon="false" AllowFiltering="false"
                                                    HeaderText="AddUser" HeaderStyle-Width="10px" ItemStyle-Width="100px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="editdate" UniqueName="editdate" SortExpression="editdate" HeaderText="EditDate" AllowFiltering="false"
                                                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="edituser" UniqueName="edituser" SortExpression="UniqueName" ShowFilterIcon="false" AllowFiltering="false"
                                                    HeaderText="EditUser" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="status" Display="false">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="FMCSLId" Display="false">
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
                                    OnClick="AddnewRouteBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                                <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                    OnClick="UpdateRouteBtn_Click" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                                <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                                    OnClick="newRidesCancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:CheckBox ID="UpdateJobRouteChk" runat="server"/>
                                <asp:Label runat="server" ID="UpdateJobRouteLbl" Text="UpdateJobRoute" Font-Bold="true" ></asp:Label>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </asp:Panel>
                        </telerik:RadPageView>
                    </telerik:RadMultiPage>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
