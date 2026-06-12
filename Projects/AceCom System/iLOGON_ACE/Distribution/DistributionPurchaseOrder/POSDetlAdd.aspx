<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="POSDetlAdd.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionPurchaseOrder.POSDetlAdd" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>RCSDetlAdd</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <asp:Label ID="StepLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td align="right">&nbsp;
                <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text=" Save " OnClick="SaveBtn_Click"
                    OnClientClick="this.disabled = true;  this.value = 'Saving...';" UseSubmitBehavior="false"></asp:Button>&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <br>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label><br />
        <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" OnItemDataBound="ResultDG1_ItemDataBound"
            Skin="Office2007" AllowPaging="true" OnNeedDataSource="ResultDG1_NeedDataSource">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="PurchaseRequestItemId" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn HeaderText="No" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Label ID="FromLb" runat="server">PO :</asp:Label>
                                </tr>
                                <tr>
                                    <asp:Label ID="ToLb" runat="server">RCS:</asp:Label>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="ItemType" SortExpression="ItemType" HeaderText="ItemType" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="ItemQty" SortExpression="qty" AllowFiltering="false">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "expecteduomqty","{0:#}") %>'
                                            ID="AvailQtyLabel" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <telerik:RadTextBox runat="server" Width="60px" ID="QtyTxt" BackColor="Yellow" Text='<%# DataBinder.Eval(Container.DataItem, "expecteduomqty","{0:#}") %>'></telerik:RadTextBox>
                                        <asp:RequiredFieldValidator ID="QtyReq" runat="server" ErrorMessage="*" ControlToValidate="QtyTxt"></asp:RequiredFieldValidator>
                                        <asp:CustomValidator ID="ItemQtyVal" runat="server" ControlToValidate="QtyTxt" ClientValidationFunction="ClientValidate"
                                            EnableClientScript="true" ErrorMessage="Exceed" ForeColor="Red" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="ItemUOM">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ItemUOM") %>'
                                            ID="FromuomLbl" /><br>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <telerik:RadDropDownList ID="UOMList" DataTextField="descr" DataValueField="item" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ItemUOMDS,DataBinder.Eval(Container.DataItem, "ItemUOM").ToString())%>'
                                            DataSource='<%# ItemUOMDS%>' runat="server" Width="100" AutoPostBack="true" Skin="Sunset" BackColor="#ded7c6" />
                                        <asp:CustomValidator ID="UOMListVal" runat="server" ControlToValidate="UOMList" ClientValidationFunction="ClientValidate"
                                            EnableClientScript="true" />
                                        <asp:RequiredFieldValidator ID="UOMListReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="UOMList" ErrorMessage="*" ForeColor="Red" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="ItemUnitPrice" SortExpression="ItemUnitPrice" HeaderText="ItemUnitPrice" AllowFiltering="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <%--<telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderText="LocationBinCode">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <ItemTemplate>
                            <telerik:RadComboBox ID="LocationBinCodeList" runat="server"
                                dropdownheight="150px" Skin="WebBlue" DataSource='<%# LocationBinCodeDS%>'
                                DataTextField="descr" DataValueField="item" OnDataBound="LocationBinCodeComboBox_DataBound" RenderMode="Lightweight" Filter="Contains"
                                AutoPostBack="false" CausesValidation="false" Width="150">
                            </telerik:RadComboBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderText="StorageLocationCode">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <ItemTemplate>
                            <telerik:RadComboBox ID="StorageLocationCodeList" runat="server"
                                dropdownheight="150px" Skin="WebBlue" DataSource='<%# StorageLocationCodeDS%>'
                                DataTextField="descr" DataValueField="item" OnDataBound="StorageLocationCodeComboBox_DataBound" RenderMode="Lightweight" Filter="Contains"
                                AutoPostBack="false" CausesValidation="false" Width="150">
                            </telerik:RadComboBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>--%>

                    <telerik:GridBoundColumn DataField="ItemUnitPrice" SortExpression="ItemUnitPrice" HeaderText="ItemUnitPrice" AllowFiltering="false">
                        <HeaderStyle Wrap="False"></HeaderStyle>
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <%--<telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="ItemUnitLandedCost" SortExpression="LandedCostTxt" AllowFiltering="false" Display="true">
                        <ItemTemplate>
                            <telerik:RadTextBox runat="server" ID="LandedCostTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ExpectedReceivedQty","{0:#}") %>'></telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>--%>

                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="ItemId" SortExpression="ItemId" AllowFiltering="false" Display="false">
                        <ItemTemplate>
                            <telerik:RadTextBox runat="server" ID="ItemIdTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ItemId","{0:#}") %>'></telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn ItemStyle-Wrap="False" HeaderText="ItemLHUQty" SortExpression="ItemLHUQty" AllowFiltering="false" Display="false">
                        <ItemTemplate>
                            <telerik:RadTextBox runat="server" ID="ItemLHUQtyTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ItemQty","{0:#}") %>'></telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <telerik:RadCodeBlock ID="RadCodeBlock" runat="server">
            <script type="text/javascript">
                function ClientValidate(sender, args) {
                    var isValid;
                    var grid = $find("<%=ResultDG1.ClientID %>");
                    var tableView = grid.get_masterTableView();
                    var items = tableView.get_dataItems();

                    for (var i = 0; i < items.length; i++) {
                        var rowValues = items[i];
                        var ItemId = rowValues.findElement("ItemIdTxt").value;
                        var NewItemQty = rowValues.findElement("QtyTxt").value;
                        var ItemLHUQty = rowValues.findElement("ItemLHUQtyTxt").value;
                        var UOM = rowValues.findElement("UOMList").value;
                    }

                    if (NewItemQty != null && NewItemQty != "" && UOM != null && UOM != "") {
                        var dataobj = { ItemId: ItemId, ItemLHUQty: ItemLHUQty, NewItemQty: NewItemQty, UOM: UOM };
                        $.ajax({
                            async: false,
                            url: 'POSDetlAdd.aspx/ValidateItemQtyAndUOM',
                            data: JSON.stringify(dataobj),
                            type: 'POST',
                            contentType: "application/json; charset=utf-8",
                            success: function (result) {
                                isValid = result.d;
                            },
                            failure: function (response) {
                                alert('Error Occur: Check ItemQty Again.');
                            }
                        });

                        args.IsValid = isValid;
                    }
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>
