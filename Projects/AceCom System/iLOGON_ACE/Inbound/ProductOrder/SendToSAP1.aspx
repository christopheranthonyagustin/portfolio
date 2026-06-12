<%@ Page Language="c#" CodeBehind="SendToSAP1.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Inbound.ProductOrder.SendToSAP1" %>

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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td colspan="3">
                &nbsp;<asp:Button Style="z-index: 0" ID="SendToSAPBtn" runat="server" CssClass="detailbutton"
                    Text="Send To SAP" OnClick="SendToSAPBtn_Click"></asp:Button>
                &nbsp;
                <br />
                &nbsp;
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
                <br />
                <br />
            </td>
        </tr>
        <tr valign="top">
            <td width="20%">
                <asp:DataGrid ID="RcHeadDG" runat="server" AutoGenerateColumns="False" DataKeyField="rcid"
                    BorderStyle="None" GridLines="Both" CellPadding="2" AllowSorting="True" UseAccessibleHeader="True"
                    AllowPaging="false">
                    <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem"></ItemStyle>
                    <Columns>
                        <asp:TemplateColumn>
                            <HeaderTemplate>
                                No
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%#Container.ItemIndex+1%>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="LotNo" HeaderText="LotNo" SortExpression="LotNo">
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </asp:BoundColumn>
                        <asp:TemplateColumn ItemStyle-HorizontalAlign="Center">
                            <HeaderTemplate>
                                <label id="completelbl">
                                    Complete</label>
                                &nbsp;<input id="SelectALLCB" type="checkbox" onclick="CheckAllDataGridCheckBoxes('SelectCB',this.checked)">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="SelectCB" runat="server" Checked="false"></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="rcid" HeaderText="rcid" SortExpression="rcid" Visible="false" />
                    </Columns>
                </asp:DataGrid>
            </td>
            <td width="5%">
            </td>
            <td>
                <asp:DataGrid ID="PltHeadDG" runat="server" AutoGenerateColumns="False" DataKeyField="pallet_no"
                    BorderStyle="None" GridLines="Both" CellPadding="2" AllowSorting="True" UseAccessibleHeader="True"
                    AllowPaging="false">
                    <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
                    <ItemStyle CssClass="DGItem"></ItemStyle>
                    <Columns>
                        <asp:TemplateColumn>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
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
                        <asp:BoundColumn DataField="rcid" HeaderText="rcid" SortExpression="rcid" Visible="false" />
                        <asp:BoundColumn DataField="acid" HeaderText="rcid" SortExpression="acid" Visible="false" />
                    </Columns>
                </asp:DataGrid>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
