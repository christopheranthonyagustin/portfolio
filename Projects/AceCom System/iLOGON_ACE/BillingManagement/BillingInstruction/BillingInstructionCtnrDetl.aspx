<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BillingInstructionCtnrDetl.aspx.cs" Inherits="iWMS.Web.BillingManagement.BillingInstruction.BillingInstructionCtnrDetl" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html>
<head id="Head1" runat="server">
    <title>BillingInstructionEqpDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <style type="text/css">
        .style1
        {
            height: 39px;
        }
        .style2
        {
            width: 258px;
        }
        .style3
        {
            height: 39px;
            width: 258px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0" onload="if (document.getElementById('CtnrNoTxt')!= null) document.getElementById('CtnrNoTxt').focus();">
    <form id="Form1" method="post" runat="server">
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
                <asp:Label ID="IdLbl" runat="server"></asp:Label>
            </td>
            <td align="right">
                <asp:Button ID="AddDetailBtn" runat="server" Text="+ Detail" Visible="False" CssClass="detailButton"
                    OnClick="AddDetailBtn_Click"></asp:Button>&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="AddPanel" runat="server" Visible="False">
                    <table id="Table1" border="0" cellspacing="1" cellpadding="1" width="100%">
                        <tr>
                            <td width="20%">
                                <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </td>
                            <td width="80%" align="right">
                                <asp:Button ID="SaveNextBtn" runat="server" CssClass="detailButton" 
                                    OnClick="SaveNextBtn_Click" Text="Save &amp; Next" />
                                &nbsp;<asp:Button ID="SaveBtn" runat="server" CssClass="detailButton" 
                                    OnClick="SaveBtn_Click" Text=" Save " />
                                <asp:Button ID="ClosePanelBtn" runat="server" CausesValidation="False" 
                                    CssClass="detailButton" OnClick="ClosePanelBtn_Click" Text="- Hide" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <iwms:iform id="formCtl" runat="server"></iwms:iform>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <br>
    <div style="height: 80%; top: 0px; left: 0px;" id="div-datagrid">
        <asp:DataGrid ID="ResultDG" runat="server" PageSize="8" CellPadding="2" AutoGenerateColumns="False"
            DataKeyField="id" OnItemCommand="Detail_Edit" AllowSorting="True" UseAccessibleHeader="True">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <Columns>
                <asp:TemplateColumn>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="..\..\image\pencil.gif"
                            Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                            CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                            onserverclick="Detail_Delete" runat="server">
                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                runat="server"></a>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <HeaderTemplate>
                        S/N
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="biid" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="ctnrtype" SortExpression="ctnrtype" HeaderText="EqpType">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="ctnrno" SortExpression="ctnrno" HeaderText="EqpRef">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="ctnrsealno" SortExpression="ctnrsealno" HeaderText="Seal">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="customssealno" SortExpression="customssealno" HeaderText="CustomsSeal">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="ctnrwt" SortExpression="ctnrwt" HeaderText="EqpWt" DataFormatString="{0:#,0.000}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="ctnrvol" SortExpression="ctnrvol" HeaderText="EqpVol"
                    DataFormatString="{0:#,0.000}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="goodswt" SortExpression="goodswt" HeaderText="GoodsWt"
                    DataFormatString="{0:#,0.000}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="goodsvol" SortExpression="goodsvol" HeaderText="GoodsVol"
                    DataFormatString="{0:#,0.000}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="vendorcode" SortExpression="vendorcode" HeaderText="VendorCode">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="vendorname" SortExpression="vendorname" HeaderText="VendorName">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="status" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status" Visible="false">
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
                <asp:BoundColumn DataField="id" Visible="False"></asp:BoundColumn>
						    <asp:BoundColumn Visible="False" DataField="statuscolor" SortExpression="statuscolor" HeaderText="statuscolor"></asp:BoundColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Left" ForeColor="Black" Position="TopAndBottom" Mode="NumericPages">
            </PagerStyle>
        </asp:DataGrid></div>
	    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    </form>
</body>
</html>
