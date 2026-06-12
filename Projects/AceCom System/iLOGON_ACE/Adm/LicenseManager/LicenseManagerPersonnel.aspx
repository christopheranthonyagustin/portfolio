<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LicenseManagerPersonnel.aspx.cs" Inherits="iWMS.Web.Adm.LicenseManager.LicenseManagerPersonnel" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>LicenseManagerPersonnel</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
</head>
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
    <style type="text/css">
        html {
            overflow: hidden;
        }
    </style>

       <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        &nbsp;
        <asp:Button ID="RenewBtn" runat="server" CssClass="white" Text="Renew" OnClick="RenewBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
        <br />
        <br />
        <asp:UpdatePanel ID="UpdButton" runat="server">
            <ContentTemplate>
            <div id="div2" style="width: 100%; height: 100%; overflow: hidden">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Width="100%" Height="86%"
                AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                OnDetailTableDataBind="ResultDG_DetailTableDataBind" >
                <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Scrolling AllowScroll="True" ScrollHeight="400px" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="1000" DataKeyNames="id" Name="ParentGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" 
                    HeaderStyle-ForeColor="White" HeaderStyle-Font-Names="Arial" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#05538c">
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
                        <telerik:GridBoundColumn DataField="Code" ItemStyle-Wrap="false" SortExpression="Code"
                            HeaderText="Code">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Name" ItemStyle-Wrap="false" SortExpression="Name"
                            HeaderText="Name">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Status" ItemStyle-Wrap="false" SortExpression="Status"
                            HeaderText="Status">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SerialNo" ItemStyle-Wrap="false" SortExpression="SerialNo"
                            HeaderText="SerialNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ExpiryDate" ItemStyle-Wrap="false" SortExpression="ExpiryDate"
                            HeaderText="ExpiryDate" DataFormatString="{0:dd/MMM/yyyy}" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NoOfUsers" ItemStyle-Wrap="false" SortExpression="NoOfUsers"
                            HeaderText="NoOfUsers">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="StatusColor" ItemStyle-Wrap="false" SortExpression="StatusColor"
                            HeaderText="StatusColor" Display="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <DetailTables>
                        <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" HierarchyDefaultExpanded="true" InsertItemDisplay="Bottom"
                            HierarchyLoadMode="Client">
                            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White" BackColor="#05538c" Font-Names="Arial" />
                            <ItemStyle Wrap="true" />
                            <AlternatingItemStyle Wrap="true" />
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                    <HeaderTemplate>
                                        S/N
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%#Container.ItemIndex+1%>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="Type">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="category" SortExpression="category" HeaderText="Category">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="tablename" SortExpression="tablename" HeaderText="TableName">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="beforevalue" SortExpression="beforevalue" HeaderText="BeforeValue">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="aftervalue" SortExpression="aftervalue" HeaderText="AfterValue">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                    ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                                    ItemStyle-Wrap="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </telerik:GridTableView>
                    </DetailTables>
                </MasterTableView>
            </telerik:RadGrid>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
