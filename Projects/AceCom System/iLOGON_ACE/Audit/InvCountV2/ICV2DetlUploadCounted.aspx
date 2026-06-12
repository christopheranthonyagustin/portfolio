<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ICV2DetlUploadCounted.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV2.ICV2DetlUploadCounted" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Inventory CountV2 Detail Counted</title>

    <script src="../../js/CastleBusyBox.js" language="javascript"></script>

    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
        .style1
        {
            width: 7%;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server" style="z-index: 0">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
            <tr>
                <td>
                    <asp:Label ID="excelLbl" runat="server">File Location&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="excelFile" runat="server" />
                </td>   
            </tr>
            <tr>
                <td class="style1">
                &nbsp;
                </td>
                <td>
                    <asp:DropDownList ID="excelssDDL" runat="server" AutoPostBack="True"
                        Visible="false" />
                    <br />
                    <asp:Label ID="lblnote" Text="Note : Only Microsoft Excel files can be Uploaded."
                        runat="server"></asp:Label><br />
                    <br />
                    <asp:Button ID="excelSend" Text=" VALIDATE & UPLOAD " runat="server" OnClick="excelSend_Click"
                        OnClientClick="return busyBox.Show();" />
                    <br />
                    <asp:Label ID="summaryLbl" runat="server" ForeColor="#ff0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="excelVal" runat="server" ControlToValidate="excelFile"
                        ErrorMessage="This is not a valid file type" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.xls|.XLS)$"
                        Visible="False" />
                    <br />
                    <asp:Label ID="lblErrRetrieve" CssClass="BlackText" runat="server" Visible="False"
                        ForeColor="#ff0000"></asp:Label><br />
                </td>
            </tr>
        </table>        
        <br />
        <asp:Label ID="ErrorMsg" CssClass="errorLabel" runat="server"></asp:Label>
        <div id="div-datagrid" style="height: 92%">
            <asp:datagrid id="ResultDG" runat="server" GridLines="Both" CellPadding="2" AutoGenerateColumns="False"
					AllowSorting="True" UseAccessibleHeader="True">
					<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
					<ItemStyle CssClass="DGItem"></ItemStyle>
                <Columns>
                  <asp:BoundColumn DataField="error" SortExpression="error" HeaderText="Error"></asp:BoundColumn>
                      <asp:BoundColumn DataField="message" SortExpression="message" HeaderText="Message"></asp:BoundColumn>
                      <asp:BoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SkuCode"></asp:BoundColumn>
                      <asp:BoundColumn DataField="loccode" SortExpression="loccode" HeaderText="LocCode"></asp:BoundColumn>
                      <asp:BoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TUNO1"></asp:BoundColumn>
                      <asp:BoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TUNO2"></asp:BoundColumn>
                      <asp:BoundColumn DataField="qty" SortExpression="qty" HeaderText="Qty"></asp:BoundColumn>
                      <asp:BoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot4"></asp:BoundColumn>
                      <asp:BoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot5"></asp:BoundColumn>
                      <asp:BoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot6"></asp:BoundColumn>
                      <asp:BoundColumn DataField="lot9" SortExpression="lot9" HeaderText="Lot9"></asp:BoundColumn>
                      <asp:BoundColumn DataField="lot10" SortExpression="lot10" HeaderText="Lot10"></asp:BoundColumn>
                      <asp:BoundColumn DataField="lot11" SortExpression="lot11" HeaderText="Lot11"></asp:BoundColumn>
                      <asp:BoundColumn DataField="counter" SortExpression="counter" HeaderText="Counter"></asp:BoundColumn>
                      <asp:BoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Rem1"></asp:BoundColumn>
                      <asp:BoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Rem2"></asp:BoundColumn>
                </Columns>
            </asp:DataGrid>
        </div>
    </form>
    <iframe id="BusyBoxIFrame" ondrop="return false;" frameborder="0" name="BusyBoxIFrame"
        scrolling="no"></iframe>

    <script>
        // Instantiate our BusyBox object
        var busyBox = new BusyBox("BusyBoxIFrame", "busyBox", 4, "../../image/gears_ani_", ".gif", 125, 308, 172, "../../BusyBox.htm");
    </script>
</body>
</html>
