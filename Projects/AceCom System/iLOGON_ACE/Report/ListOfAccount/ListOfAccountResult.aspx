<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListOfAccountResult.aspx.cs"
    Inherits="iWMS.Web.Report.ListOfAccount.ListOfAccountResult" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>List Of Account Report</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script language="javascript" type="text/javascript" src="../../js/fullscreen.js"></script>

</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <table width="100%">
        <tr class="graytitle">
            <td colspan="3">
                <asp:Label ID="LicenseNameLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                Report
            </td>
            <td>
                :
            </td>
            <td>
                List Of Account
            </td>
            <td width="80%" align="right">
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>
            </td>
        </tr>
        <tr class="graytitle">
            <td>
                <asp:Label ID="DateLbl" runat="server">Date</asp:Label>
            </td>
            <td>
                :
            </td>
            <td colspan="2">
                <asp:Label ID="NowLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <div style="height: 90%" id="div-datagrid">
        <asp:DataGrid ID="ResultDG" runat="server" ItemStyle-Wrap="False" UseAccessibleHeader="True"
            CellPadding="2" GridLines="Both" BorderStyle="None" AutoGenerateColumns="false">
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
            <Columns>
                <asp:BoundColumn DataField="id" HeaderText="id"></asp:BoundColumn>
                <asp:BoundColumn DataField="code" HeaderText="code"></asp:BoundColumn>
                 <asp:BoundColumn DataField="code2" HeaderText="code2"></asp:BoundColumn>
                <asp:BoundColumn DataField="name" HeaderText="name"></asp:BoundColumn>
                <asp:BoundColumn DataField="type" HeaderText="type"></asp:BoundColumn>
                <asp:BoundColumn DataField="statusdescr" HeaderText="status"></asp:BoundColumn>
                <asp:BoundColumn DataField="inshelflife" HeaderText="inshelflife"></asp:BoundColumn>
                <asp:BoundColumn DataField="outshelflife" HeaderText="outshelflife"></asp:BoundColumn>
                <asp:BoundColumn DataField="addr1" HeaderText="addr1"></asp:BoundColumn>
                <asp:BoundColumn DataField="addr2" HeaderText="addr2"></asp:BoundColumn>
                <asp:BoundColumn DataField="addr3" HeaderText="addr3"></asp:BoundColumn>
                <asp:BoundColumn DataField="addr4" HeaderText="addr4"></asp:BoundColumn>
                <asp:BoundColumn DataField="zipcode" HeaderText="zipcode"></asp:BoundColumn>
                <asp:BoundColumn DataField="citycode" HeaderText="citycode"></asp:BoundColumn>
                <asp:BoundColumn DataField="countrycode" HeaderText="countrycode"></asp:BoundColumn>
                <asp:BoundColumn DataField="tel" HeaderText="tel"></asp:BoundColumn>
                <asp:BoundColumn DataField="fax" HeaderText="fax"></asp:BoundColumn>
                <asp:BoundColumn DataField="web" HeaderText="web"></asp:BoundColumn>
                <asp:BoundColumn DataField="contact" HeaderText="contact"></asp:BoundColumn>
                <asp:BoundColumn DataField="billaddr1" HeaderText="Billingaddr1"></asp:BoundColumn>
                <asp:BoundColumn DataField="billaddr2" HeaderText="Billingaddr2"></asp:BoundColumn>
                <asp:BoundColumn DataField="billaddr3" HeaderText="Billingaddr3"></asp:BoundColumn>
                <asp:BoundColumn DataField="billaddr4" HeaderText="Billingaddr4"></asp:BoundColumn>
                <asp:BoundColumn DataField="hp" HeaderText="hp"></asp:BoundColumn>
                <asp:BoundColumn DataField="email" HeaderText="email"></asp:BoundColumn>
                <asp:BoundColumn DataField="taxno" HeaderText="taxno"></asp:BoundColumn>
                <asp:BoundColumn DataField="regno" HeaderText="regno"></asp:BoundColumn>
                <asp:BoundColumn DataField="rem1" HeaderText="rem1"></asp:BoundColumn>
                <asp:BoundColumn DataField="biztype" HeaderText="biztype"></asp:BoundColumn>
                <asp:BoundColumn DataField="smancode" HeaderText="smancode"></asp:BoundColumn>
                <asp:BoundColumn DataField="currcode" HeaderText="currcode"></asp:BoundColumn>
                <asp:BoundColumn DataField="payterms" HeaderText="payterms"></asp:BoundColumn>
                <asp:BoundColumn DataField="InvoiceDeliveryMethod" HeaderText="InvoiceDeliveryMethod">
                </asp:BoundColumn>
                <asp:BoundColumn DataField="taxprofilecode" HeaderText="taxprofilecode"></asp:BoundColumn>
                <asp:BoundColumn DataField="license" HeaderText="license"></asp:BoundColumn>
                <asp:BoundColumn DataField="billaddr1" HeaderText="billaddr1"></asp:BoundColumn>
                <asp:BoundColumn DataField="billaddr2" HeaderText="billaddr2"></asp:BoundColumn>
                <asp:BoundColumn DataField="billaddr3" HeaderText="billaddr3"></asp:BoundColumn>
                <asp:BoundColumn DataField="billaddr4" HeaderText="billaddr4"></asp:BoundColumn>
                <asp:BoundColumn DataField="BillPostalCode" HeaderText="BillPostalCode"></asp:BoundColumn>
                <asp:BoundColumn DataField="BillCityCode" HeaderText="BillCityCode"></asp:BoundColumn>
                <asp:BoundColumn DataField="BillCountryCode" HeaderText="BillCountryCode"></asp:BoundColumn>
                <asp:BoundColumn DataField="billcontact" HeaderText="billcontact"></asp:BoundColumn>
                <asp:BoundColumn DataField="billtel" HeaderText="billtel"></asp:BoundColumn>
                <asp:BoundColumn DataField="billfax" HeaderText="billfax"></asp:BoundColumn>
                <asp:BoundColumn DataField="billemail" HeaderText="billemail"></asp:BoundColumn>
                <asp:BoundColumn DataField="entid" HeaderText="entid"></asp:BoundColumn>
                <asp:BoundColumn DataField="DefaultExRef1" HeaderText="DefaultExRef1"></asp:BoundColumn>
                <asp:BoundColumn DataField="DefaultExRef2" HeaderText="DefaultExRef2"></asp:BoundColumn>
                <asp:BoundColumn DataField="DefaultProjectCode" HeaderText="DefaultProjectCode">
                </asp:BoundColumn>
                <asp:BoundColumn DataField="orderby1" HeaderText="orderby1"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderbyemail1" HeaderText="orderbyemail1"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderbyphone1" HeaderText="orderbyphone1"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderbyremarks1" HeaderText="orderbyremarks1"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderby2" HeaderText="orderby2"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderbyemail2" HeaderText="orderbyemail2"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderbyphone2" HeaderText="orderbyphone2"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderbyremarks2" HeaderText="orderbyremarks2"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderby3" HeaderText="orderby3"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderbyemail3" HeaderText="orderbyemail3"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderbyphone3" HeaderText="orderbyphone3"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderbyremarks3" HeaderText="orderbyremarks3"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderby4" HeaderText="orderby4"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderbyemail4" HeaderText="orderbyemail4"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderbyphone4" HeaderText="orderbyphone4"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderbyremarks4" HeaderText="orderbyremarks4"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderby5" HeaderText="orderby5"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderbyemail5" HeaderText="orderbyemail5"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderbyphone5" HeaderText="orderbyphone5"></asp:BoundColumn>
                <asp:BoundColumn DataField="orderbyremarks5" HeaderText="orderbyremarks5"></asp:BoundColumn>
                <asp:BoundColumn DataField="crblockstatus" HeaderText="crblockstatus"></asp:BoundColumn>
                <asp:BoundColumn DataField="crblockby" HeaderText="crblockby"></asp:BoundColumn>
                <asp:BoundColumn DataField="crblockdate" HeaderText="crblockdate"></asp:BoundColumn>
                <asp:BoundColumn DataField="lasttrandate" HeaderText="lasttrandate"></asp:BoundColumn>
                <asp:BoundColumn DataField="adddate" HeaderText="adddate"></asp:BoundColumn>
                <asp:BoundColumn DataField="adduser" HeaderText="adduser"></asp:BoundColumn>
                <asp:BoundColumn DataField="editdate" HeaderText="editdate"></asp:BoundColumn>
                <asp:BoundColumn DataField="edituser" HeaderText="edituser"></asp:BoundColumn>
            </Columns>
        </asp:DataGrid></div>
    </form>
</body>
</html>
