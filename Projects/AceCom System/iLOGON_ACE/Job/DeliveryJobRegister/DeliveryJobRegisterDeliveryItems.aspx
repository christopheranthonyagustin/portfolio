<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryJobRegisterDeliveryItems.aspx.cs" Inherits="iWMS.Web.Job.DeliveryJobRegister.DeliveryJobRegisterDeliveryItems" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>DailyDeliveriesPlanningDeliveryItems</title>
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/style.css" type="text/css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style type="text/css">
        .graytitle {
            font-weight: bold;
        }

        .ItemStyle {
            border-left-width: 0px !important;
        }

        .BoldStyle {
            border-left-width: 2px !important;
            border-left-color: dimgrey !important;
        }
    </style>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="false" Skin="Silk" RenderMode="Lightweight" AllowPaging="true"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowMultiRowSelection="true" MasterTableView-AllowSorting="true" Height="98%"
            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" OnItemDataBound="ResultDG_ItemDataBound" AllowSorting="true"
            AllowFilteringByColumn="true" ClientSettings-AllowColumnsReorder="true" OnBatchEditCommand="ResultDG_BatchEditCommand">
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="true"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="500px" />
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                <ClientEvents OnBatchEditGetCellValue="GetCellValue" OnBatchEditGetEditorValue="GetEditorValue"
                    OnBatchEditSetCellValue="SetCellValue" OnBatchEditSetEditorValue="SetEditorValue" OnRowSelected="RowSelected" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="Id" Name="ParentGrid"
                PageSize="50" HeaderStyle-HorizontalAlign="Center" CommandItemDisplay="Top" TableLayout="Auto" EditMode="Batch">
                <BatchEditingSettings EditType="Row" OpenEditingEvent="Click" SaveAllHierarchyLevels="true" HighlightDeletedRows="true" />
                <CommandItemSettings ShowAddNewRecordButton="true" />
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="50px" ItemStyle-Width="50px" HeaderStyle-HorizontalAlign="Left">
                        <HeaderTemplate>
                            <%--<input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%--<asp:CheckBox ID="chkObjective" runat="server" />--%>
<%--                            <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif" BorderWidth="0"
                                BackColor="Transparent" Width="15" Height="15" AlternateText="Edit" OnClick="Edit_Click"></asp:ImageButton>--%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="false"/>
                    <telerik:GridTemplateColumn UniqueName="SkuDescr" HeaderText="Code" ItemStyle-Width="100px" HeaderStyle-Width="100px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("SkuDescr")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="skuDescrTxt" Width="95px"></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="GoodsDescr" HeaderText="Description" ItemStyle-Width="165px" HeaderStyle-Width="165px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("GoodsDescr")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="GoodsDescrTxt" Width="160px"></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="PkgDescr" HeaderText="BatchNo" ItemStyle-Width="155px" HeaderStyle-Width="155px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("PkgDescr")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="PkgDescrTxt" Width="140px"></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="UOM" HeaderText="UOM" ItemStyle-Width="100px" HeaderStyle-Width="100px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("outeruom")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="uomTxt" Width="50px"></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="QTY" HeaderText="QTY" ItemStyle-Width="100px" HeaderStyle-Width="100px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("outerqty")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="qtyTxt" Width="95" InputType="Number"></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Weight" HeaderText="Weight" ItemStyle-Width="100px" HeaderStyle-Width="100px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("wt")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="weightTxt" Width="95px" InputType="Number"></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Vol" HeaderText="Vol" ItemStyle-Width="100px" HeaderStyle-Width="100px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("vol")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="VolTxt" Width="95px" InputType="Number"></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Remarks" HeaderText="Remarks" ItemStyle-Width="165px" HeaderStyle-Width="165px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("remarks")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="remakrsTxt" Width="150px" ></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridButtonColumn CommandName="Delete" Text="Delete" UniqueName="Deletebtn">

                    </telerik:GridButtonColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <telerik:RadCodeBlock ID="RadCodeBlock" runat="server">
            <script type="text/javascript">
                // originally taken from https://vanillajstoolkit.com/polyfills/stringreplaceall/
                /**
                 * String.prototype.replaceAll() polyfill
                 * https://gomakethings.com/how-to-replace-a-section-of-a-string-with-another-one-with-vanilla-js/
                 * @author Chris Ferdinandi
                 * @license MIT
                 */
                if (!String.prototype.replaceAll) {
                    String.prototype.replaceAll = function (str, newStr) {

                        // If a regex pattern
                        if (Object.prototype.toString.call(str).toLowerCase() === '[object regexp]') {
                            return this.replace(str, newStr);
                        }

                        // If a string
                        return this.replace(new RegExp(str, 'g'), newStr);

                    };
                }

                function OnClientClose(sender, args) {
                    var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                    masterTable.rebind();
                }

                function saveChangesToGrid() {
                    // ref: https://docs.telerik.com/devtools/aspnet-ajax/controls/grid/data-editing/commanditem/command-item-template#custom-commanditemtemplate-for-batch-edit-mode
                    var grid = $find('<%=ResultDG.ClientID%>');
                    grid.get_batchEditingManager().saveChanges(grid.get_masterTableView());
                }

                function GetCellValue(sender, args) {
                }

                function SetCellValue(sender, args) {
                }

                function GetEditorValue(sender, args) {
                }

                function SetEditorValue(sender, args) {
                }

                function RowSelected(sender, eventArgs) {
                    // uncheck all other checkbox first
                    var inputElements = document.getElementsByTagName('input');
                    for (var i = 0; i < inputElements.length; i++) {
                        var myElement = inputElements[i];
                        if (myElement.type === "checkbox") {
                            myElement.checked = false;
                        }
                    }

                    // checked the checkbox
                    var checkbox = eventArgs.get_item().findElement('chkObjective');
                    checkbox.checked = true;
                }
            </script>
        </telerik:RadCodeBlock>
    </form>
</body>
</html>
