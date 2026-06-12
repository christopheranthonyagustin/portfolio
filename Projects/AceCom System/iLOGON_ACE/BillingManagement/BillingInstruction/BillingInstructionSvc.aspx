<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BillingInstructionSvc.aspx.cs" Inherits="iWMS.Web.BillingManagement.BillingInstruction.BillingInstructionSvc" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html >
<head id="Head1" runat="server">
    <title>BillingInstructionService</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
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
<body bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0">
    <form id="form1" runat="server">
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
                            <td>
                                <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </td>
                            <td align="right" class="style2">
                            </td>
                            <td align = "right">
                                <asp:Button ID="SaveNextBtn" runat="server" CssClass="detailButton" 
                                    OnClick="SaveNextBtn_Click" Text="Save &amp; Next" />
                                &nbsp;<asp:Button ID="SaveBtn" runat="server" CssClass="detailButton" 
                                    OnClick="SaveBtn_Click" Text=" Save " />
                                <asp:Button ID="ClosePanelBtn" runat="server" CausesValidation="False" 
                                    CssClass="detailButton" OnClick="ClosePanelBtn_Click" Text="- Hide" />
                            </td>
                        </tr>
                        <tr>
					                <td colspan="3">
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
      <asp:DataGrid ID="ResultDG" runat="server" PageSize="8" CellPadding="2" AutoGenerateColumns="False" Width="100%"
            DataKeyField="id" OnItemCommand="Detail_Edit" AllowSorting="True" UseAccessibleHeader="True" >
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
                <asp:BoundColumn DataField="id" SortExpression="id" HeaderText="SvcId" Visible="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="quid" SortExpression="quid" HeaderText="QuId" Visible="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="qucode" SortExpression="qucode" HeaderText="QuotationNo">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="qutype" SortExpression="qutype" HeaderText="QuotationType">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="quhtype" SortExpression="quhtype" HeaderText="QuotationHeadType" Visible="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="quacid" SortExpression="quacid" Visible="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="accode" SortExpression="accode" HeaderText="Customer">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="jobdate" SortExpression="jobdate" HeaderText="JobDate" DataFormatString="{0:dd/MMM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="jobno" SortExpression="jobno" HeaderText="JobNo" Visible="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type" Visible="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="basis" SortExpression="basis" HeaderText="Basis" Visible="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="basisdescr" SortExpression="basisdescr" HeaderText="Basis" Visible="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="specialflag" SortExpression="specialflag" HeaderText="SpecialFlag" Visible="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="sfdescr" SortExpression="sfdescr" HeaderText="SpecialFlag" Visible="false">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="remarks" SortExpression="remarks" HeaderText="Remarks">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="statuscolor" SortExpression="statuscolor" HeaderText="Color" Visible="false"/>
            </Columns>
      </asp:DataGrid>
    </div>
    </form>
	    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
</body>
</html>
