<%@ Control Language="c#" AutoEventWireup="True" Codebehind="Tabs.ascx.cs" Inherits="iWMS.Web.Control.Tabs" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<div id="menu">
	<table cellSpacing="0" cellPadding="0" border="0">
		<%--<tr>--%>
			<asp:Repeater id="TabMenuRepeater" EnableViewState="False" runat="server">
				<itemtemplate>
				  <%# (Container.ItemIndex + 1) % 12 == 0 ? "<tr>" : string.Empty%>
					<td class="tab">
						&nbsp;&nbsp;&nbsp;<a href='<%= Request.ApplicationPath %>/<%# DataBinder.Eval(Container.DataItem, "path") %>' target="main"><%# DataBinder.Eval(Container.DataItem, "name") %></a>
					</td>					
				  <%# (Container.ItemIndex + 1) % 12 == 12? "</tr>" : string.Empty%>
				</itemtemplate>
				<SeparatorTemplate>
					<td class="mnsep">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</SeparatorTemplate>
			</asp:Repeater>
		<%--</tr>--%>
	</table>
</div>
