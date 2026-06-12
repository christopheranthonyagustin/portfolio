<%@ Register TagPrefix="iWMS" TagName="iPopup" Src="../../Control/iPopupCtl.ascx" %>

<%@ Page MaintainScrollPositionOnPostback="true" Language="c#" CodeBehind="ProductOrderLog.aspx.cs"
    AutoEventWireup="True" Inherits="iWMS.Web.Inbound.ProductOrder.ProductOrderLog" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>RegisterLotNo</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
</head>
<body onload="javascript:window.focus();" leftmargin="0" topmargin="0">
		<form id="Form1" method="post" runat="server">
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td>
                <br />
                &nbsp
                <asp:Label ID="ReceiptIdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server"></a>
                <br />
                <br />
            </td>
            <td align="right">
                &nbsp;
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
        <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" BorderStyle="None"
            GridLines="Both" CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False">
            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="False"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem" Wrap="False"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="seqno" SortExpression="seqno" HeaderText="S/No">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
