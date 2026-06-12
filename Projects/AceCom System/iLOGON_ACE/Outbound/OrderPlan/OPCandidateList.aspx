<%@ Page Language="c#" CodeBehind="OPCandidateList.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.OrderPlan.OPCandidateList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>OPCandidateList</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" defaultbutton="BuildBtn">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="1" cellpadding="1" border="0" width="100%">
            <tr>
                <td>
                    <br />
                    <asp:Label ID="OPIdLbl" runat="server" class="pagetitle"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="BuildBtn" runat="server" Text="Build" Visible="False"
                        OnClick="BuildBtn_Click" CssClass="white"></asp:Button>
                </td>
            </tr>
        </table>
        <br>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" AllowMultiRowSelection="true"
                    Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true" UseAccessibleHeader="True"
                    OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged" lientSettings-AllowColumnsReorder="true">
                    <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="800">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                            </telerik:GridClientSelectColumn>
                            <telerik:GridBoundColumn Display="false" DataField="acid"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn Display="false" DataField="id"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="isno" SortExpression="isno" HeaderText="IssueNo" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Grp" SortExpression="Grp" HeaderText="Group" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn Display="false" DataField="status"></telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="shname" SortExpression="shname" HeaderText="ConsigneeName" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ttlvol" SortExpression="ttlvol" HeaderText="TotalVol" DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ttlwt" SortExpression="ttlwt" HeaderText="TotalWT" DataFormatString="{0:#,0.##}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="linecount" SortExpression="linecount" HeaderText="TotalLines">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="priority" SortExpression="priority" HeaderText="Pri" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="route" SortExpression="route" HeaderText="Route" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="Expected" DataFormatString="{0:dd/MMM/yyyy}" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="shtocode" SortExpression="shtocode" HeaderText="Csgn" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="shaddr1" SortExpression="shaddr1" HeaderText="Addr1" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="Ext.Ref#1" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="exdate1" SortExpression="exdate1" HeaderText="Ext.Date1" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="Ext.Ref#2" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="exdate2" SortExpression="exdate2" HeaderText="Ext.Date2" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="pono" SortExpression="pono" HeaderText="PO#" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="podate" SortExpression="podate" HeaderText="PODate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="shaddr2" SortExpression="shaddr2" HeaderText="Addr2" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="shaddr3" SortExpression="shaddr3" HeaderText="Addr3" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="shaddr4" SortExpression="shaddr4" HeaderText="Addr4" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="shzipcode" SortExpression="shzipcode" HeaderText="Zip" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="shcitycode" SortExpression="shcitycode" HeaderText="City" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="shcountrycode" SortExpression="shcountrycode" HeaderText="Cty" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="vslvoy" SortExpression="vslvoy" HeaderText="Vsl.Voy" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="etd" SortExpression="etd" HeaderText="ETD" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2" AllowFiltering="false">
                            </telerik:GridBoundColumn>



                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                <HeaderTemplate>
                                    Pick-To-Clear
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkPickToClear" runat="server"></asp:CheckBox>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </telerik:GridTemplateColumn>


                            <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser" AllowFiltering="false">
                            </telerik:GridBoundColumn>

                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <span class="boldtext">
                    <asp:Label ID="InfoLbl" runat="server"></asp:Label></span>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
