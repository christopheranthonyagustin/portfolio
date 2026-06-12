<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NCCPARList.aspx.cs" Inherits="iWMS.Web.Master.NCCPAR.NCCPARList" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>NCCPAR</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script src="../../js/checkbox.js" type="text/javascript"></script>
    <script src="../../js/sub_global.js" type="text/javascript"></script>
</head>

    <body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
               <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
        Visible="False"></asp:Label>
    <div id="div-datagrid" style="height: 92%">
     <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                EnableLinqExpressions="false" AllowPaging ="true"
                Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                OnItemDataBound="ResultDG_ItemDataBound" >
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White" 
                DataKeyNames="id" >
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false" UniqueName="icon"  >
                    <ItemTemplate>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <asp:Label ID="CancelLbl" runat="server"></asp:Label>
                        <asp:Label ID="CloseLbl" runat="server"></asp:Label>
                        <asp:Label ID="NCPARLbl" runat="server"></asp:Label>                                
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                     <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="NCCPAR #"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="auditor" SortExpression="Auditor" HeaderText="Auditor"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="description" SortExpression="Description" HeaderText="Description"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Revision" SortExpression="Revision" HeaderText="Revision"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="what" SortExpression="What" HeaderText="What"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="who" SortExpression="Who" HeaderText="Who"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="where" SortExpression="Where" HeaderText="Where"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="rootcauseanalysis" SortExpression="RootCauseAnalysis" HeaderText="RootCauseAnalysis"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="effects" SortExpression="Effects" HeaderText="Effects"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="correctiveaction" SortExpression="CorrectiveAction" HeaderText="CorrectiveAction"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="reviewdate" SortExpression="ReviewDate" HeaderText="ReviewDate"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="othersuggestion" SortExpression="OtherSuggestion" HeaderText="OtherSuggestion"
                    DataFormatString="{0:dd/MMM/yyyy}"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                            HeaderText="EditUser">
                        </telerik:GridBoundColumn>
                         <%--<telerik:GridBoundColumn DataField="imagetype" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="statuscolor" Display="False"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                           </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
    
    
    
</body>
</html>

