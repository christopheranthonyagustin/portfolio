<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MassOutgoingShipmentHead.aspx.cs" Inherits="iWMS.Web.Outbound.OutgoingShipment.MassOutgoingShipmentHead" %>

<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubPrintMenu" Src="../../Control/SubMenu.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>IssueHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>        
    <script language="javascript" type="text/javascript">
        function CheckAllDataGridCheckBoxes(aspCheckBoxID, checkVal) {
            re = new RegExp(':' + aspCheckBoxID + '$')  //generated control name starts with a colon
            for (i = 0; i < Form1.elements.length; i++) {
                elm = document.forms[0].elements[i]
                if (elm.type == 'checkbox') {
                    if (re.test(elm.name))
                        elm.checked = checkVal
                }
            }
        }
    </script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <asp:Button Style="z-index: 0" ID="PrintPTBtn" runat="server" CssClass="detailbutton"
        Text="Print PT" OnClick="PrintPTBtn_Click" OnClientClick="return busyBox.Show();">
    </asp:Button>
    &nbsp;<asp:Button Style="z-index: 0" ID="PrintDOBtn" runat="server" CssClass="detailbutton"
        Text="Print DO" OnClick="PrintDOBtn_Click" OnClientClick="return busyBox.Show();">
    </asp:Button>
    &nbsp;<asp:Label Style="z-index: 0" ID="Label1" runat="server">Mass Print selection is per page basis.</asp:Label>
    <br />
    <br />
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
        Visible="False"></asp:Label>
    <div id="div-datagrid" style="height: 92%">
        <asp:datagrid id="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False" BorderStyle="None" CellPadding="2" 
                    PageSize="50" AllowSorting="True" UseAccessibleHeader="True" AllowPaging="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <SelectedItemStyle Wrap="False" ForeColor="White" BackColor="#0033CC"></SelectedItemStyle>
            <Columns>
                <asp:TemplateColumn ItemStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        <input id="SelectALLCB" type="checkbox" onclick="CheckAllDataGridCheckBoxes('SelectCB',this.checked)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="SelectCB" runat="server" Checked="false"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="acid" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="sitecode" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="id" SortExpression="id" HeaderText="ID" Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="number" SortExpression="number" HeaderText="Issue#">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="opid" SortExpression="opid" HeaderText="OP#">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="permitno" SortExpression="permitno" HeaderText="Permit#">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="status" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="statuscolor" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="prioritydescr" SortExpression="prioritydescr" HeaderText="Pri">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="route" SortExpression="route" HeaderText="Route">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="expdate" SortExpression="expdate" HeaderText="Expected"
                    DataFormatString="{0:dd/MMM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="shippeddate" SortExpression="shippeddate" HeaderText="Shipped"
                    DataFormatString="{0:dd/MMM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustRef">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="exdate2" SortExpression="exdate2" HeaderText="CustRefDate"
                    DataFormatString="{0:dd/MMM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="shtocode" SortExpression="shtocode" HeaderText="Consignee">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="shname" SortExpression="shname" HeaderText="Name">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="shaddr1" SortExpression="shaddr1" HeaderText="Addr1">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="exref1" SortExpression="exref1" HeaderText="ExtRef1">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="exdate1" SortExpression="exdate1" HeaderText="ExtDate1"
                    DataFormatString="{0:dd/MMM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="sealno" SortExpression="sealno" HeaderText="Seal#">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="grp" SortExpression="grp" HeaderText="Group">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="pono" SortExpression="pono" HeaderText="PoNo">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="podate" SortExpression="podate" HeaderText="PODate" DataFormatString="{0:dd/MMM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="shaddr2" SortExpression="shaddr2" HeaderText="Addr2">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="shaddr3" SortExpression="shaddr3" HeaderText="Addr3">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="shaddr4" SortExpression="shaddr4" HeaderText="Addr4">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="shzipcode" SortExpression="shzipcode" HeaderText="Zip">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="shcitycode" SortExpression="shcitycode" HeaderText="City">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="shcountrycode" SortExpression="shcountrycode" HeaderText="Cty">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="vslvoy" SortExpression="vslvoy" HeaderText="Vsl.Voy">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="etd" SortExpression="etd" HeaderText="ETD" DataFormatString="{0:dd/MMM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="rem3" SortExpression="rem3" HeaderText="Remark3">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="rem4" SortExpression="rem4" HeaderText="Remark4">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="sitecode" Visible="False"></asp:BoundColumn>
            </Columns>
					<PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
        </asp:DataGrid></div>
        <iframe id="BusyBoxIFrame" ondrop="return false;" frameBorder="0" name="BusyBoxIFrame" scrolling="no"></iframe>
			<script "text/javascript"  language="JavaScript1.2">
			    // Instantiate our BusyBox object
			    var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../Image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
			</script>
    </form>
</body>
</html>
