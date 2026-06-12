<%@ Page Language="c#" CodeBehind="SPCandidateList.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.ShipPlan.SPCandidateList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SPCandidateList</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script language="javascript" type="text/javascript">
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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td>
                    <div class="pagetitle">
                        <asp:Label ID="SPIdLbl" runat="server"></asp:Label>
                        Candidate Selection (Step 2 of 3)
                    </div>
                </td>
                <td align="right">
                    <asp:Button ID="NextBtn" runat="server" Text="Next" Visible="False" CssClass="white"
                        OnClick="NextBtn_Click"></asp:Button>
                    &nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <br>
        <div id="div-datagrid">
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" EnableLinqExpressions="False" AllowSorting="true"
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
                            <HeaderStyle HorizontalAlign="Center" Wrap="false" />
                            <HeaderTemplate>
                                <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server"></asp:CheckBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="acid" SortExpression="acid" HeaderText="acid" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="id" SortExpression="id" UniqueName="id" HeaderText="Pack ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isid" SortExpression="isid" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isno" SortExpression="isno" HeaderText="Issue No" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shtocode" SortExpression="shtocode" HeaderText="Consignee">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shname" SortExpression="shname" HeaderText="ConsigneeName">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="sealno" SortExpression="sealno" HeaderText="SealNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TptModeDescr" SortExpression="TptModeDescr" HeaderText="TptMode">
                        </telerik:GridBoundColumn>                        
                        <telerik:GridBoundColumn DataField="RouteDescr" SortExpression="RouteDescr" HeaderText="Route">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NoOfPackage" SortExpression="NoOfPackage" HeaderText="NoOfPackage" DataFormatString="{0:#.####}" ItemStyle-HorizontalAlign="Center">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NoOfPallet" SortExpression="NoOfPallet" HeaderText="NoOfPallet" DataFormatString="{0:#.####}" ItemStyle-HorizontalAlign="Center">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TotalPackagePallet" SortExpression="TotalPackagePallet" HeaderText="Package+Pallet" DataFormatString="{0:#.####}" ItemStyle-HorizontalAlign="Center">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="dono" SortExpression="dono" HeaderText="DO#">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustRef">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="pono" SortExpression="pono" HeaderText="PO#">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="ExpDate" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="opid" SortExpression="opid" HeaderText="OrderPlanNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="shaddr1" SortExpression="shaddr1" HeaderText="Address">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="status" SortExpression="status" Visible="False">
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


                    </Columns>
                    <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
