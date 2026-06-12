<%@ Page Language="c#" CodeBehind="SendToSAP.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.ProductOrder.SendToSAP" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SendToSAP</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
        <meta runat="server" id="RefreshMeta" http-equiv="Refresh" />
    </meta>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <tr>
            <td>
                &nbsp;<asp:Button Style="z-index: 0" ID="SendToSAPBtn" runat="server" CssClass="detailbutton"
                    Text="Send To SAP" OnClick="SendToSAPBtn_Click"></asp:Button>
                &nbsp;<asp:Button Style="z-index: 0" ID="ResetSendToSAPBtn" runat="server" CssClass="detailbutton"
                    Text="Reset" OnClick="ResetSendToSAPBtn_Click"></asp:Button>
                <br />
                &nbsp;
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
                <br />
                <br />
            </td>
        </tr>
    </table>
    <div>
        <asp:DataGrid ID="ResultDG" runat="server" AutoGenerateColumns="False" DataKeyField="pallet_no" 
            BorderStyle="None" GridLines="Both" CellPadding="2" AllowSorting="True" UseAccessibleHeader="True"
            AllowPaging="false">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>			
				<asp:TemplateColumn>
					<ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
					<ItemTemplate>
					<asp:Label id="DetailLbl" runat="server"></asp:Label>
					</ItemTemplate>
				</asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="Batch_No" HeaderText="Batch_No" SortExpression="Batch_No">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Pallet_No" HeaderText="Pallet_No" SortExpression="Pallet_No">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                </asp:BoundColumn>
				<ASP:BOUNDCOLUMN DataField="rcid" HeaderText="rcid" SortExpression="rcid" Visible="false"/>
				<ASP:BOUNDCOLUMN DataField="acid" HeaderText="rcid" SortExpression="acid" Visible="false"/>
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
