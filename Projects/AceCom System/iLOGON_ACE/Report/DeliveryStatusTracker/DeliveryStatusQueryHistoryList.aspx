<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryStatusQueryHistoryList.aspx.cs" Inherits="iWMS.Web.Report.DeliveryStatusTracker.DeliveryStatusQueryHistoryList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>DeliveryStatusTracker @ HistoryList</title>
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

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
         <table width="100%">
            <tr class="GrayTitle">
                <td colspan="2">
                    <asp:Label ID="CustreferenceLbl" runat="server" class="graytitle" Text="CustReference&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:" />
                    <asp:Label ID="CustreferenceValue" runat="server" class="graytitle"></asp:Label>
                </td>
            </tr>
            <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="TripTypeLbl" runat="server" class="graytitle" Text="Trip Type &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:" />
                    <asp:Label ID="TripTypeValue" runat="server" class="graytitle" />
                </td>
            </tr>
            <tr class="graytitle">
                <td colspan="2">
                    <asp:Label ID="AttachmentStatusLbl" runat="server" class="graytitle" Text="Attachment Status :" />
                    <asp:Label ID="AttachmentStatusValue" runat="server" class="graytitle" />
                </td>
            </tr>
        </table>
        <br/>
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
            <MasterTableView AllowMultiColumnSorting="true" Name="ParentGrid">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>

                    <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="false" />

                    <telerik:GridTemplateColumn UniqueName="No" HeaderText="No" ItemStyle-Width="100px" HeaderStyle-Width="50px" AllowFiltering="false">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Status" HeaderText="Status" ItemStyle-Width="100px" HeaderStyle-Width="100px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0}", Eval("StatusDescr")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                  <%--  <telerik:GridTemplateColumn UniqueName="CustomerReference" HeaderText="CustReference" ItemStyle-Width="165px" HeaderStyle-Width="165px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("CustReference")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>--%>

                    <telerik:GridTemplateColumn UniqueName="Partner" HeaderText="Partner" ItemStyle-Width="155px" HeaderStyle-Width="155px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("Partner")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Vehicle" HeaderText="Vehicle" ItemStyle-Width="100px" HeaderStyle-Width="100px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("Vehicle")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Driver" HeaderText="Driver" ItemStyle-Width="155px" HeaderStyle-Width="155px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("Driver")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Remarks" HeaderText="Remarks" ItemStyle-Width="155px" HeaderStyle-Width="155px" AllowFiltering="false">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("Remarks")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="Date" HeaderText="Date" HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                    <ItemTemplate>
                                        <%# string.Format("{0:dd/MMM/yyyy HH:mm}", Eval("AddDate")) %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn UniqueName="EditUser" HeaderText="EditUser" ItemStyle-Width="155px" HeaderStyle-Width="155px" AllowFiltering="true">
                        <ItemTemplate>
                            <%# string.Format("{0:}",Eval("EditUser")) %>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
