<%@ Control Language="c#" AutoEventWireup="True" Codebehind="SubMenu.ascx.cs" Inherits="iWMS.Web.Control.SubMenu" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table cellSpacing="1" cellPadding="0" border="0" style="CLEAR: none; DISPLAY: inline; POSITION: static">
	<tr>
		<td noWrap>
			<div id="postmenu_<%=MenuID %>">
			    <a href="#" style="border:0;text-decoration:none;">
			        <% if(CurrentMenuType.Equals(MenuType.Print)) { %>
			            <img src="../../Image/printer.png"  align="absbottom" border="0" />
			            
			            <% }else if(CurrentMenuType.Equals(MenuType.Flag)) { %>
			            <img src="../../Image/flag_red.png"  align="absbottom" border="0" />
			            
			        <% } else { %>
			            <img src="../../Image/wrench.png"  align="absbottom" border="0" />
			        <% } %>
			    </a>
				<script type="text/javascript"> 
					kfmenu_register('<%= "postmenu_" + MenuID %>', true); 
				</script>
			</div>
		</td>
	</tr>
</table>
<div class="kfmenu_popup" id="postmenu_<%=MenuID %>_menu">
	<table cellSpacing="1" cellPadding="2" border="0">
		<tr>
			<td nowrap class="thead"><asp:Label ID="TitleLbl" Runat="server"></asp:Label></td>
		</tr>
		<asp:Repeater id="SubMenuRepeater" EnableViewState="False" runat="server">
			<itemtemplate>
				<tr>
					<td class="kfmenu_option">
						<img src='<%# DataBinder.Eval(Container.DataItem, "ImgUrl")  %>' border="0" width="15" height="15" /> 
						<a href='<%# "../" + CurrentNode + "/" + DataBinder.Eval(Container.DataItem, "path")  %>' 
							onclick='<%# DataBinder.Eval(Container.DataItem, "onclick")  %>'
							target='<%# DataBinder.Eval(Container.DataItem, "target")  %>' runat=server>
							&nbsp;<%# DataBinder.Eval(Container.DataItem, "name")  %>
						</a>
					</td>
				</tr>
			</itemtemplate>
		</asp:Repeater>
	</table>
</div>
<script type="text/javascript">
<!--
	kfSubMenu_init();
//-->
</script>