<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportContainerNo.aspx.cs" Inherits="iWMS.Web.Job.TransporterLD.TransportContainerNo" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>TransportContainerNo</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowPaging="true" AllowSorting="true" Skin="Metro" AllowFilteringByColumn="true"
        OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
        OnDetailTableDataBind="ResultDG_DetailTableDataBind">
        <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true"> 
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" Name="ParentGrid" PageSize="50" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn AllowFiltering="false" ItemStyle-Width="50" HeaderStyle-Width="50">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="ChargeCode" DataField="chargecode" AllowFiltering="true"
                        ColumnGroupName="chargecode" SortExpression="chargecode" UniqueName="chargecode" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ChargeDescr" DataField="chargedescr" AllowFiltering="true"
                        ColumnGroupName="chargedescr" SortExpression="chargedescr" UniqueName="chargedescr" Reorderable="true">
                    </telerik:GridBoundColumn>    
                    <telerik:GridBoundColumn HeaderText="NoOfContainers" DataField="noofcontainers" AllowFiltering="true"
                        ColumnGroupName="noofcontainers" SortExpression="noofcontainers" UniqueName="noofcontainers" Reorderable="true">
                    </telerik:GridBoundColumn>              
                    <telerik:GridBoundColumn HeaderText="jbid" DataField="jbid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Status" SortExpression="Status" HeaderText="Status" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
                <DetailTables>
                    <telerik:GridTableView DataKeyNames="id" Name="ChildGrid" SkinID="Telerik" EditMode="InPlace"
                        Width="100%" InsertItemDisplay="Bottom" RetainExpandStateOnRebind="true" AllowAutomaticInserts="true">
                        <HeaderStyle Wrap="false" />
                        <ItemStyle Wrap="false" />
                        <AlternatingItemStyle Wrap="false" />
                        <Columns>
                            <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="150px">
                                <ItemTemplate>
                                    <a id="ChargeRefContainerDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                        onclick="return confirm('Confirm Delete Container?')"
                                        onserverclick="ChargeRefContainer_Delete" runat="server">
                                    <img id="Img2" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                        title="Delete" runat="server" /></a>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn AllowFiltering="false" ItemStyle-Width="50" HeaderStyle-Width="50">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                <HeaderTemplate>
                                    S/N
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn HeaderText="ContainerNo" DataField="ctnrno" AllowFiltering="true"
                                ColumnGroupName="ctnrno" SortExpression="ctnrno" UniqueName="ctnrno" Reorderable="true">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="id" DataField="id" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="jbid" DataField="jbid" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="jbchargeid" DataField="jbchargeid" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </telerik:GridTableView>
                </DetailTables>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>