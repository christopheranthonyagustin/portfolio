<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportManifestAddBox.aspx.cs" Inherits="iWMS.Web.Job.ImportManifest.ImportManifestAddBox" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ImportManifestAddBox</title>
    <base target="_self">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <br />
        <asp:Button ID="ConfirmBtn" runat="server" CssClass="white" Text="Confrim"
            OnClick="ConfirmBtn_Click" UseSubmitBehavior="false" />
        &nbsp;
        <asp:Button ID="CloseBtn" runat="server" CssClass="white" Text="Close"
            OnClick="CloseBtn_Click" UseSubmitBehavior="false" />
        <br />
        <br />
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="ResultsGrid" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
                    AllowFilteringByColumn="false" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id"
                        EditMode="InPlace" Name="ParentGrid">
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="20" HeaderStyle-Width="20">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="lineChkbx" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn AllowFiltering="false" ItemStyle-Width="50" HeaderStyle-Width="50">
                                <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                <HeaderTemplate>
                                    S/No
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="TrackingNo" HeaderText="Tracking Number" UniqueName="TrackingNo" ItemStyle-Width="100" HeaderStyle-Width="100">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="skudescr" HeaderText="Size" UniqueName="skudescr" ItemStyle-Width="100" HeaderStyle-Width="100">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Vessel" HeaderText="Vessel" UniqueName="Vessel" ItemStyle-Width="100" HeaderStyle-Width="100">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="smancode" HeaderText="First Name" UniqueName="smancode" ItemStyle-Width="100" HeaderStyle-Width="100">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="orderby" HeaderText=" Last Name" UniqueName="orderby" ItemStyle-Width="100" HeaderStyle-Width="100">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="orderbyphone" HeaderText="MobileNumber" UniqueName="orderbyphone" ItemStyle-Width="100" HeaderStyle-Width="100">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="POD" HeaderText="Destination" UniqueName="POD" ItemStyle-Width="100" HeaderStyle-Width="100">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>