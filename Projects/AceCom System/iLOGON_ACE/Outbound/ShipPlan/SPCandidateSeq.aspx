<%@ Page Language="c#" CodeBehind="SPCandidateSeq.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.ShipPlan.SPCandidateSeq" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SPCandidateList</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">ext
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td>
                    <div class="pagetitle">
                        <asp:Label ID="SPIdLbl" runat="server"></asp:Label>&nbsp;Candidate Drop Sequence
                    (Step&nbsp;3 of 3)
                    </div>
                </td>
                <td align="right">
                    <asp:Button ID="BuildBtn" runat="server" Visible="False" Text="Build" CssClass="white"
                      OnClientClick="disableBtn(this.id,false)" ToolTip="Build" UseSubmitBehavior="false"    OnClick="BuildBtn_Click"></asp:Button>&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <br>
        <div id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" EnableLinqExpressions="False"
                Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
                GroupPanelPosition="Top">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn>
                            <ItemTemplate>
                                <asp:DropDownList ID="SeqList" runat="server" DataMember="" DataSource='<%#seqList%>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="acid" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="id" SortExpression="id" UniqueName="id" HeaderText="Pack ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isid" SortExpression="isid" UniqueName="isid" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isno" SortExpression="isno" HeaderText="Issue No">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shtocode" SortExpression="shtocode" HeaderText="Consignee">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shname" SortExpression="shname" HeaderText="ConsigneeName">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sealno" SortExpression="sealno" HeaderText="SealNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="dono" SortExpression="dono" HeaderText="DO#">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="noofpackage" SortExpression="noofpackage" HeaderText="No Of Package">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="noofpallet" SortExpression="noofpallet" HeaderText="No Of Pallet">
                        </telerik:GridBoundColumn>

                    </Columns>
                    <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
