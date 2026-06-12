<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContainerTruckingOrderSplitCharge.aspx.cs" Inherits="iWMS.Web.Job.ContainerTruckingOrder.SplitCharge" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Split Charge</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript"></script>
    <base target="_self" />
    <script type="text/javascript">
        function CheckAll(id) {
            var masterTable = $find("ResultDG").get_masterTableView();
            var row = masterTable.get_dataItems();
            if (id.checked == true) {
                for (var i = 0; i < row.length; i++) {
                    masterTable.get_dataItems()[i].findElement("chkObjective").checked = true;
                }
            }
            else {
                for (var i = 0; i < row.length; i++) {
                    masterTable.get_dataItems()[i].findElement("chkObjective").checked = false;
                }
            }
        }
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
    <style type="text/css">
        .ctoSplitVertical {
            display: flex;
            flex-direction: column;
            width: 100%;
            height: auto;
        }

            .ctoSplitVertical > * {
                margin: 0 0 10px 0;
            }

        .ctoSplitHorizontal {
            display: flex;
            flex-direction: row;
        }

            .ctoSplitHorizontal > * {
                margin: 0 10px 0 0;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <div class="ctoSplitVertical">
            <asp:Label ID="IdLbl" runat="server" Text="Split Charges" Visible="True" CssClass="pagetitle" Font-Size="Large" />
            <div class="ctoSplitHorizontal">
                <asp:Button ID="SplitBtn" CssClass="white" runat="server" OnClick="SplitBtn_Click"
                    Visible="true" Text="Split" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                <asp:Button ID="CancelBtn" CssClass="white" runat="server" OnClick="CancelBtn_Click"
                    Visible="true" Text="Cancel" OnClientClick="" UseSubmitBehavior="false" />
            </div>
            <div>
                <asp:UpdatePanel ID="formCtlUpdatePanel" runat="server">
                    <ContentTemplate>
                        <iWMS:iForm ID="formCtl" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
                AllowFilteringByColumn="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnDeleteCommand="ResultDG_Delete" OnCancelCommand="ResultDG_Cancel" OnItemCommand="ResultDG_ItemCommand">
                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                    EditMode="InPlace">
                    <Columns>
<%--                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <HeaderTemplate>
                                <label id="completelbl">
                                </label>
                                &nbsp;<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                            </ItemTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        </telerik:GridTemplateColumn>--%>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="JBAcRatioEdit"
                                    ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                    CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="JBAcRatioDelete"
                                    ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete"
                                    CommandName="Delete" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton runat="server" Visible="True" ID="SkuSiteUpdate" ImageUrl="../../image/floppy.gif"
                                    Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                    BorderWidth="0"></asp:ImageButton>
                                <asp:ImageButton runat="server" Visible="True" ID="SkuSiteCancel" ImageUrl="../../image/arrow6.gif"
                                    Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                    BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="billaccountname" HeaderText="BillAccount">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "billacname")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadComboBox ID="BillAccountCombo" runat="server"
                                    DropDownHeight="150px" Skin="Sunset" DataSource='<%# BillAccountListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillAccountListDS,DataBinder.Eval(Container.DataItem, "billacid").ToString())%>'
                                    DataTextField="code" DataValueField="acid" RenderMode="Lightweight" Filter="Contains" AutoPostBack="true" CausesValidation="false">
                                </telerik:RadComboBox>
                                <asp:RequiredFieldValidator ID="billaccountnameReqVal" runat="server" ControlToValidate="BillAccountCombo" ErrorMessage="*" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="quantity" HeaderText="Qty/Ratio">
                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <%# DataBinder.Eval(Container.DataItem, "qty")%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox runat="server" ID="QuantityText" Skin="Office2007" Width="100px" AutoPostBack="true" Text='<%# DataBinder.Eval(Container.DataItem, "qty") %>'>
                                </telerik:RadTextBox>
                                <asp:CompareValidator ID="QTxtCompVal" runat="server" ControlToValidate="QuantityText"
                                    EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                <asp:CompareValidator ID="QTxtZeroVal" runat="server" ControlToValidate="QuantityText"
                                    EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
    </form>
</body>
</html>
