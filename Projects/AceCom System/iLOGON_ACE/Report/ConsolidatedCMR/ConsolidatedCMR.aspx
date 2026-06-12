<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsolidatedCMR.aspx.cs"
    Inherits="iWMS.Web.Report.ConsolidatedCMR.ConsolidatedCMR" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ConsolidatedCMR</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">

    <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>

    <form id="Form2" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="2" cellpadding="2" width="100%">
        <tr>
            <td valign="top" width="10%">
                OpsUnit
            </td>
            <td>
                <asp:DropDownList ID="opsUnitDDL" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                CollectFrom
            </td>
            <td>
                <asp:TextBox Style="z-index: 0" ID="FrAddrTxt" runat="server" Rows="3" TextMode="MultiLine"
                    Width="155px" Height="80px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="searchBtn" runat="server" Text="Search" OnClick="searchBtn_Clicked" />
            </td>
            <td>
                <asp:Button ID="printBtn" runat="server" Text="print" OnClick="printBtn_Clicked" />
                &nbsp;&nbsp;
                <asp:Button ID="exportBtn" runat="server" Text="Excel" OnClick="excelBtn_Clicked" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div id="div-datagrid" width="8%">
                    <asp:DataGrid ID="ResultDG" runat="server" DataKeyField="id" AutoGenerateColumns="False"
                        BorderStyle="None" CellPadding="2" UseAccessibleHeader="True" AllowSorting="true">
                        <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                        <ItemStyle CssClass="DGItem"></ItemStyle>
                        <Columns>
                            <asp:TemplateColumn>
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:CheckBox ID="SelectedChkbx" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="accode" SortExpression="acname" HeaderText="Account">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="jbno" SortExpression="jbno" HeaderText="JobNo"></asp:BoundColumn>
                            <asp:BoundColumn DataField="exref1" SortExpression="exref1" HeaderText="CustomerReference">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="noofcontainer" SortExpression="noofctnr" HeaderText="NoofContainers">
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="toaddr" SortExpression="toaddr" HeaderText="DeliverTo">
                            </asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid>
                    <br />
                </div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
