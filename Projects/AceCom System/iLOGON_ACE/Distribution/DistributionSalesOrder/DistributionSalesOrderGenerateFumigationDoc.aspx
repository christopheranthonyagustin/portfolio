<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DistributionSalesOrderGenerateFumigationDoc.aspx.cs" Inherits="iWMS.Web.Distribution.DistributionSalesOrder.DistributionSalesOrderGenerateFumigationDoc" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Generate Fumigation Doc</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/NewBusyBox.js" language="javascript" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript">
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
        .radComboboxWithMultiCol .rcbItem,
        .radComboboxWithMultiCol .rcbHovered {
            /*float: left;*/
            /*margin: 0 1px;*/
            margin: 0;
            min-height: 13px;
            overflow: hidden;
            padding: 0;
            box-sizing: border-box;
            display: table-row;
            position: relative;
            border-color: #768ca5;
            white-space: pre-wrap;
        }

            .radComboboxWithMultiCol .rcbItem:nth-child(2n) {
                /* Alternate row color */
                background-color: rgba(0,0,0,0.04);
            }

        .radComboboxWithMultiCol .rcbHeader {
            padding: 0 !important;
            padding-right: 17px !important; /* to solve design issue in Internet Explorer */

            color: #fff;
            background-color: #748ea3;
            border-color: #768ca5;
        }

            .radComboboxWithMultiCol .rcbHeader .col {
                font-size: 12px;
                font-family: Helvetica;
                padding: 4px 6px;
            }

        .radComboboxWithMultiCol .col {
            margin: 0;
            padding: 2px 6px 2px 6px;
            line-height: 14px;
            box-sizing: border-box;
            display: table-cell;
            border-color: #768ca5;
            border-width: 0 0 1px 1px;
            border-style: solid;
            font-family: Helvetica, sans-serif;
            font-size: 12px;
            word-break: break-all; /*some words can't break down itself (e.g Word contain Comma). For this word, we need to use this feature.*/
            width: 100px; /*to fit with max col header width*/
        }

            .radComboboxWithMultiCol .col:first-child {
                border-left: 0;
            }

        .radComboboxWithMultiCol .rcbHeader ul,
        .radComboboxWithMultiCol .rcbFooter ul,
        .radComboboxWithMultiCol .rcbItem ul,
        .radComboboxWithMultiCol .rcbHovered ul,
        .radComboboxWithMultiCol .rcbDisabled ul {
            margin: 0;
            padding: 0 !important;
            width: 100%;
            display: inline-block;
            list-style-type: none;
        }

        .radComboboxWithMultiCol .rcblist {
            border-collapse: collapse;
            border-spacing: 0;
            table-layout: fixed;
            display: table;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td style="width: 5px"></td>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    <br />
                    &nbsp;<asp:Button ID="AddBtn" CssClass="white" runat="server" OnClick="AddBtn_Click" Text="Add"
                        OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                    &nbsp;<asp:Button ID="CloseBtn" CssClass="white" runat="server" OnClick="CloseBtn_Click" Text="Close" CausesValidation="false"
                        OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>

                    <telerik:GridTemplateColumn HeaderText="No" HeaderStyle-Width="30px">
                        <ItemTemplate>
                            <asp:Label ID="lblNo" runat="server" Text='<%# Container.ItemIndex + 1 %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                                       <telerik:GridTemplateColumn UniqueName="FumigationDocumentItem" Visible ="false">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="FumigationDocumentItemIdTxt" Visible ="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "FumigationDocumentItemId") %>'>
                            </telerik:RadTextBox>
                            <br />
                            <br />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="salesorderitemid" SortExpression="salesorderitemid" ItemStyle-Wrap="false" Visible="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>

                    <telerik:GridTemplateColumn UniqueName="ItemDescription" HeaderText="ItemDescription">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="ItemDescriptionTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "itemdescription") %>' Skin="Sunset" BackColor="#ded7c6">
                            </telerik:RadTextBox>
                            <br />
                            <br />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="Commodity" ItemStyle-Wrap="false">
                        <ItemTemplate>
                            <telerik:RadComboBox ID="CommodityComBo" runat="server" DataTextField="descr" DataValueField="item"
                                Skin="Sunset" Width="150px" DropDownWidth="150px" DataSource='<%# CommodityDS%>'
                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains" AutoPostBack="true"
                                Text='<%# DataBinder.Eval(Container.DataItem, "commodity") %>'>
                            </telerik:RadComboBox>
                        </ItemTemplate>
<%--                        <EditItemTemplate>
                            <telerik:RadComboBox ID="CommodityComBo" runat="server" DataTextField="descr" DataValueField="item"
                                Skin="Sunset" Width="150px" DropDownWidth="150px" DataSource='<%# CommodityDS%>'
                                RenderMode="Lightweight" CausesValidation="false" Filter="Contains" AutoPostBack="true"
                                Text='<%# DataBinder.Eval(Container.DataItem, "commodity") %>'>
                            </telerik:RadComboBox>
                            <asp:RequiredFieldValidator ID="CommodityComBoReqVal" runat="server"
                                ControlToValidate="CommodityComBo" ErrorMessage="*" ForeColor="Red" />
                        </EditItemTemplate>--%>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="ItemCode" SortExpression="ItemCode" HeaderText="Item Code" ItemStyle-Wrap="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
