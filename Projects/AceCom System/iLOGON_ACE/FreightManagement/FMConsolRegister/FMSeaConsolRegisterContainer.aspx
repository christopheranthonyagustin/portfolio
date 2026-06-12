<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FMSeaConsolRegisterContainer.aspx.cs" Inherits="iWMS.Web.FreightManagement.FMConsolRegister.FMSeaConsolRegisterContainer" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FMSeaConsolRegisterContainer</title>
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
    </script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td>
                    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
                        <telerik:RadPageView runat="server" Height="5px" Width="100%" ID="HeaderRadPageView">
                            <br />
                            <asp:Panel ID="NewCtnrBtnPanel" runat="server">
                                <asp:Button ID="NewCtnrBtn" runat="server" CssClass="white" Text="New" ValidationGroup="reqvalgrp"
                                    OnClick="NewContainer_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            </asp:Panel>
                            <br />
                            <asp:UpdatePanel ID="CtnrUpdatePanel" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                                        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                                        AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_OnItemDataBound">
                                        <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                            <Selecting AllowRowSelect="true" />
                                        </ClientSettings>
                                        <SortingSettings EnableSkinSortStyles="false" />
                                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                        <ItemStyle Wrap="false"></ItemStyle>
                                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="ParentGrid" DataKeyNames="id">
                                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                            <Columns>
                                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="5px">
                                                    <HeaderTemplate>
                                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="20px">
                                                    <ItemStyle Wrap="False"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="CtnrEditBtn"
                                                            ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit" OnClick="ldEdit_Click"
                                                            BackColor="Transparent" BorderWidth="0"></asp:ImageButton>&nbsp;
                                                        <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="CtnrCopyBtn"
                                                            ImageUrl="../../image/copy.png" Width="15" Height="15" AlternateText="Edit" OnClick="CopyBtn_Click"
                                                            BackColor="Transparent" BorderWidth="0"></asp:ImageButton>&nbsp;
                                                        <asp:ImageButton ID="CtnrDeleteBtn" runat="server" Visible="True" ImageUrl="../../image/deleted.png" ToolTip="Delete"
                                                            Width="15" Height="15" AlternateText="Delete" BackColor="Transparent" OnClick="DeleteIcon_Click" ImageAlign="AbsMiddle"
                                                            OnClientClick="return confirm('Are you sure you want to delete Container Information ?');"
                                                            BorderWidth="0"></asp:ImageButton>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="Sno" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="50px" ItemStyle-Width="50px"
                                                    AllowFiltering="false" HeaderText="Sno" SortExpression="Sno">
                                                    <ItemTemplate>
                                                        <%#Container.ItemIndex+1%>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="Number" UniqueName="Number" HeaderText="Container"
                                                    ShowFilterIcon="true" AllowFiltering="true" ItemStyle-Width="90px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="SealNo1" UniqueName="SealNo1" SortExpression="SealNo1" HeaderText="Seal Number" HeaderStyle-Width="90px"
                                                    ItemStyle-Width="90px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="TransportMode" UniqueName="Mode" HeaderText="Mode" ShowFilterIcon="true" AllowFiltering="true" HeaderStyle-Width="90px"
                                                    ItemStyle-Width="90px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Type" UniqueName="Type" HeaderText="Container Type" ShowFilterIcon="true" AllowFiltering="true"
                                                    HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="DeliveryMode" UniqueName="DeliveryMode" HeaderText="Delivery Mode" ShowFilterIcon="true" AllowFiltering="true"
                                                    HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Shipment" UniqueName="Shipment" HeaderText="Shipment" ShowFilterIcon="false" AllowFiltering="false"
                                                    ItemStyle-Width="90px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="ImportHaulierName" UniqueName="ImportHaulierName" HeaderText="HaulierName" ShowFilterIcon="false" AllowFiltering="false"
                                                    ItemStyle-Width="90px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="ImportHaulierUenNo" UniqueName="ImportHaulierUenNo" HeaderText="HaulierUenNo" ShowFilterIcon="false" AllowFiltering="false"
                                                    ItemStyle-Width="90px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Temperature" UniqueName="Temperature" HeaderText="Temperature" ShowFilterIcon="false" AllowFiltering="false"
                                                    ItemStyle-Width="90px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="VentSetting" UniqueName="VentSetting" HeaderText="VentSetting" ShowFilterIcon="false" AllowFiltering="false"
                                                    ItemStyle-Width="90px">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="GrossWT" UniqueName="GrossWT" SortExpression="GrossWT" ShowFilterIcon="false" AllowFiltering="false"
                                                    ItemStyle-Width="90px" HeaderText="Gross Weight">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="Quality" UniqueName="Quality" SortExpression="Quality" ShowFilterIcon="true" AllowFiltering="false"
                                                    ItemStyle-Width="90px" HeaderText="WQ">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr" HeaderText="Status" ShowFilterIcon="false"
                                                    ItemStyle-Width="90px" AllowFiltering="false">
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
                            <asp:Panel ID="ConatinerFormPanel" runat="server">
                                <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                                    OnClick="AddnewCtnrBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                    OnClick="UpdateCtnrBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text="Save" Visible="false"
                                    OnClick="SaveBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                                    OnClick="CtnrCancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                                <br />
                                <br />
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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
