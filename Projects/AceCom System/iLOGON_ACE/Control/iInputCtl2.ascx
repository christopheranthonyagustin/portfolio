<%@ Register TagPrefix="iWMS" TagName="iForm" Src="iFormCtl.ascx" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="iInputCtl2.ascx.cs" Inherits="iWMS.Web.Control.iInputCtl2" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table border="0" cellSpacing="0" cellPadding="0" width="100%">
	<TBODY>
		<tr>
			<td width="20%"><asp:textbox id="TEXT_SkuCode" runat="server"></asp:textbox></td>
			<td>&nbsp;&nbsp;<asp:textbox id="INTEGER_Qty" runat="server" Width="80px"></asp:textbox><asp:comparevalidator style="Z-INDEX: 0" id="QtyVal" runat="server" ErrorMessage="#" ControlToValidate="INTEGER_Qty"
					Operator="DataTypeCheck" Type="Integer"></asp:comparevalidator></td>
			<td width="10%"><asp:dropdownlist id="TEXT_Uom" runat="server"></asp:dropdownlist><INPUT style="Z-INDEX: 0; WIDTH: 1px" id="HIDDEN_SkuId" type="hidden" name="hidden" runat="server">&nbsp;</td>
			<td vAlign="bottom" width="60%"><asp:imagebutton style="VERTICAL-ALIGN: middle" id="AlertImgBtn" runat="server" ToolTip="Select a unique SKU/UPC!"
					ImageUrl="../image/icon-lookup.gif" Visible="False" BorderWidth="0" BackColor="Transparent" Width="20px" Height="20px"></asp:imagebutton>&nbsp;<asp:label id="DescrLbl" runat="server"></asp:label></td>
		</tr>
	</TBODY>
</table>
