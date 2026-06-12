<%@ Page Language="c#" CodeBehind="CashBookHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.CashBookPV.CashBookHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CashBookPV</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
                   <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
    <div style="height: 92%" id="div-datagrid">
        <table>
            <tr>
                <td align="left">
                    <asp:ImageButton ID="PVCfmImgBtn" runat="server" ImageUrl="../../Image/interfacedrbtncfm.png"
                        Visible="true" BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle"
                        OnClick="PVCfmImgBtn_Click" />
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Button Style="z-index: 0" ID="PrintPVBtn" runat="server" CssClass="detailbutton"
                        Text="Print PV" OnClick="PrintPVBtn_Click" OnClientClick="return busyBox.Show();">
                    </asp:Button>&nbsp;
                    <asp:Button Style="z-index: 0" ID="ConvertPIBtn" runat="server" CssClass="detailbutton"
                        Text="Convert/AddPI" OnClick="ConvertPIBtn_Click">
                    </asp:Button>&nbsp;
                    <br />
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                        Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="SelectCB" runat="server" Checked="false"></asp:CheckBox>
                        </ItemTemplate>
                        </telerik:GridTemplateColumn>
                         <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <iWMS:iSubMenu ID="subMenuCtl" runat="server"></iWMS:iSubMenu>
                            <iWMS:iSubMenu ID="subMenuPrintCtl" runat="server"></iWMS:iSubMenu>
                            <asp:Label ID="CbCfmLbl" runat="server" />
                        </ItemTemplate>
                     </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="ReferenceNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="trandate" SortExpression="trandate" HeaderText="Date"
                        DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="vdname" SortExpression="vdname" HeaderText="VendorName">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="VendorDocNo"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="srcno" SortExpression="srcno" HeaderText="JobNo"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="bankdescr" SortExpression="bankdescr" HeaderText="Bank" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="currcode" SortExpression="currcode" HeaderText="Currency" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="fcinvamt" SortExpression="fcinvamt" HeaderText="FCInvAmt"
                        DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="fcamt" SortExpression="fcamt" HeaderText="FCAmt"
                        DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="fctaxamt" SortExpression="fctaxamt" HeaderText="FCTaxAmt"
                        DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exchrate" SortExpression="exchrate" HeaderText="ExRate"
                        DataFormatString="{0:N6}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lcinvamt" SortExpression="lcinvamt" HeaderText="LCInvAmt"
                        DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lcamt" SortExpression="lcamt" HeaderText="LCAmt"
                        DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lctaxamt" SortExpression="lctaxamt" HeaderText="LCTaxAmt"
                        DataFormatString="{0:N}" ItemStyle-Wrap="False" ItemStyle-HorizontalAlign="Right"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="paytermsdescr" SortExpression="paytermsdescr"
                        HeaderText="PaymentTerms">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="taxprofiledescr" SortExpression="taxprofiledescr" AllowFiltering="false"
                        HeaderText="TaxProfileCode">
                    </telerik:GridBoundColumn>                    
                    <telerik:GridBoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="CtnrNo"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="vehno" SortExpression="vehno" HeaderText="VehNo"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pername" SortExpression="pername" HeaderText="Personnel"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="period" SortExpression="period" HeaderText="Period">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status"
                        Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="apprvby" SortExpression="apprvby" HeaderText="ApprvBy">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="apprvrem1" SortExpression="apprvrem1" HeaderText="ApprvRem1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="apprvstatusdescr" SortExpression="apprvstatusdescr"
                        HeaderText="ApprvStatus">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="period" SortExpression="period" HeaderText="Period">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="entid" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
