<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WHSServiceRatesBillCalcMethodInfo.aspx.cs" Inherits="iWMS.Web.Sales.WarehouseServiceRates.WHSServiceRatesBillCalcMethodInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bill Calculation Method Info</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1"/>
    <meta name="CODE_LANGUAGE" content="C#"/>
    <meta name="vs_defaultClientScript" content="JavaScript"/>
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5"/>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <div>
            <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
            <div id="test" runat="server"></div>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td class="pagetitle">&nbsp;<asp:Label ID="ListCodeLbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="height: 10px;"></td>
                </tr>
            </table>
            <br />
            <div style="height: 80%; width: 100%" id="div-datagrid">
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" AllowSorting="true"
                    AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
                    <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                        <Selecting AllowRowSelect="true"></Selecting>
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="200" DataKeyNames="id">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />

                        <Columns>
                            <telerik:GridTemplateColumn AllowFiltering="false">
                                <HeaderTemplate>
                                    No
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.ItemIndex+1%>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="acid" Display="False" ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="item" SortExpression="item" HeaderText="Item"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="descr" SortExpression="descr" HeaderText="Description"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef01" SortExpression="usrdef01" HeaderText="User Def.01"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef02" SortExpression="usrdef02" HeaderText="User Def.02"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef03" SortExpression="usrdef03" HeaderText="User Def.03"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef04" SortExpression="usrdef04" HeaderText="User Def.04"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef05" SortExpression="usrdef05" HeaderText="User Def.05"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef06" SortExpression="usrdef06" HeaderText="User Def.06"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef07" SortExpression="usrdef07" HeaderText="User Def.07"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef08" SortExpression="usrdef08" HeaderText="User Def.08"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef09" SortExpression="usrdef09" HeaderText="User Def.09"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef10" SortExpression="usrdef10" HeaderText="User Def.10"
                                ItemStyle-Wrap="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef11" SortExpression="usrdef11" HeaderText="UserDef.11">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef12" SortExpression="usrdef12" HeaderText="UserDef.12">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef13" SortExpression="usrdef13" HeaderText="UserDef.13">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef14" SortExpression="usrdef14" HeaderText="UserDef.14">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef15" SortExpression="usrdef15" HeaderText="UserDef.15">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef16" SortExpression="usrdef16" HeaderText="UserDef.16">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef17" SortExpression="usrdef17" HeaderText="UserDef.17">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef18" SortExpression="usrdef18" HeaderText="UserDef.18">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef19" SortExpression="usrdef19" HeaderText="UserDef.19">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="usrdef20" SortExpression="usrdef20" HeaderText="UserDef.20">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" Display="False" ItemStyle-Wrap="false">
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
                            <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </div>
    </form>
</body>
</html>
