<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryStatusTrackerDeliveryItems.aspx.cs" Inherits="iWMS.Web.Report.DeliveryStatusTracker.DeliveryStatusTrackerDeliveryItems" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>DeliveryStatusTracker @ DeliveryItems</title>
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
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" 
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
            OnItemDataBound="ResultDG_ItemDataBound">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" ColumnsReorderMethod="Reorder">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true"  Name="ParentGrid">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                   
                    <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="false" />
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

                    <telerik:GridTemplateColumn UniqueName="QTY" HeaderText="QTY" ItemStyle-Width="155px" HeaderStyle-Width="155px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("outerqty")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="qtyTxt" Width="140px" InputType="Number"></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Weight" HeaderText="Weight" ItemStyle-Width="155px" HeaderStyle-Width="155px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("wt")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="weightTxt" Width="140px" InputType="Number"></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Vol" HeaderText="Vol" ItemStyle-Width="155px" HeaderStyle-Width="155px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("vol")) %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="VolTxt" Width="140px" InputType="Number"></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
