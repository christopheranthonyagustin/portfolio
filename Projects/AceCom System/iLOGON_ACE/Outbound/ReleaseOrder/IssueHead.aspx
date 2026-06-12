<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iSubPrintMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="IssueHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.ReleaseOrder.IssueHead" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>IssueHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <script type="text/javascript">
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0; i < inputElements.length; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
                else {
                    myElement.checked = invoker.UnChecked

                }
            }
        }
    </script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"/>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
            Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
            OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged">
            <clientsettings allowcolumnsreorder="true" reordercolumnsonclient="true">
        </clientsettings>
            <sortingsettings enableskinsortstyles="false" />
            <alternatingitemstyle wrap="false"></alternatingitemstyle>
            <itemstyle wrap="false"></itemstyle>
            <headerstyle wrap="false"></headerstyle>
            <mastertableview allowmulticolumnsorting="true" datakeynames="id">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
            
				     <%--   <asp:TemplateColumn Visible="false">
					        <HeaderTemplate>
                                <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)"/>
                            </HeaderTemplate>
					        <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
						    </ItemTemplate>
					    </asp:TemplateColumn>--%>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
						    <ItemTemplate>
							    <iwms:iSubMenu id="subMenuCtl" runat="server"></iwms:iSubMenu>
							    <iwms:iSubPrintMenu id="subMenuPrintCtl" runat="server" Visible="false"></iwms:iSubPrintMenu>
							    <asp:Label ID="isSHCfmLbl" runat="server" />
							    <asp:Label ID="aedPKCfmLbl" runat="server" />
							    <asp:Label ID="aedCICfmLbl" runat="server" />
							    <asp:Label ID="aedLOICfmLbl" runat="server" />
						    </ItemTemplate>
						    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridTemplateColumn>
                
                <telerik:GridBoundColumn Display="false" DataField="acid"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="false" DataField="sealno"></telerik:GridBoundColumn>

				<telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>

			    <telerik:GridBoundColumn Display="false" DataField="sitecode"></telerik:GridBoundColumn>
		    
				<telerik:GridBoundColumn DataField="sitedescr" SortExpression="sitedescr" HeaderText="Site"
                    AllowFiltering="false">
                </telerik:GridBoundColumn>
	
				<telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
		    
		                    <telerik:GridBoundColumn Display="false" DataField="number"></telerik:GridBoundColumn>

					    <%--<asp:BoundColumn DataField="number" SortExpression="number" HeaderText="IssueNo">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>--%>

				<telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="CustRef"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>

					    
					   <%-- <asp:BoundColumn DataField="exdate2" SortExpression="exdate2" HeaderText="CustRefDate" DataFormatString="{0:dd/MMM/yyyy}">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>--%>
					    
				<telerik:GridBoundColumn DataField="opid" SortExpression="opid" HeaderText="OP#"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
					    
				<telerik:GridBoundColumn DataField="permitno" SortExpression="permitno" HeaderText="Permit#"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
					    
                <telerik:GridBoundColumn Display="false" DataField="status"></telerik:GridBoundColumn>
					    
                <telerik:GridBoundColumn Display="false" DataField="statuscolor"></telerik:GridBoundColumn>
					    
				<telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>

				<telerik:GridBoundColumn DataField="prioritydescr" SortExpression="prioritydescr" HeaderText="Pri"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>   
					    
					    
				<telerik:GridBoundColumn DataField="type2descr" SortExpression="type2descr" HeaderText="Type"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>  
					    
					
					    
					   <%-- <asp:BoundColumn DataField="route" SortExpression="route" HeaderText="Route">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>--%>
					    
			    <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="Expected" DataFormatString="{0:dd/MMM/yyyy}"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>  
					    
				<telerik:GridBoundColumn DataField="shippeddate" SortExpression="shippeddate" HeaderText="Shipped" DataFormatString="{0:dd/MMM/yyyy}"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>	    
					    
					    
					    
					   <%-- <asp:BoundColumn DataField="shtocode" SortExpression="shtocode" HeaderText="Consignee">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>--%>
					    
					    <%--<asp:BoundColumn DataField="shname" SortExpression="shname" HeaderText="Name">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>--%>
					    
					    <telerik:GridBoundColumn DataField="shaddr1" SortExpression="shaddr1" HeaderText="Addr1"
                    AllowFiltering="true">
                </telerik:GridBoundColumn> 
					    
					    
					    
					  <%--  <asp:BoundColumn DataField="exref1" SortExpression="exref1" HeaderText="ExtRef1">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>
					    <asp:BoundColumn DataField="exdate1" SortExpression="exdate1" HeaderText="ExtDate1" DataFormatString="{0:dd/MMM/yyyy}">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>
					    <asp:BoundColumn DataField="sealno" SortExpression="sealno" HeaderText="Seal#">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>
					    <asp:BoundColumn DataField="grp" SortExpression="grp" HeaderText="Group">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>
					    <asp:BoundColumn DataField="pono" SortExpression="pono" HeaderText="PoNo">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>
					    <asp:BoundColumn DataField="podate" SortExpression="podate" HeaderText="PODate" 
                            DataFormatString="{0:dd/MMM/yyyy}">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>
					    <asp:BoundColumn DataField="shaddr2" SortExpression="shaddr2" HeaderText="Addr2">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>
					    <asp:BoundColumn DataField="shaddr3" SortExpression="shaddr3" HeaderText="Addr3">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>
					    <asp:BoundColumn DataField="shaddr4" SortExpression="shaddr4" HeaderText="Addr4">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>--%>
					    
					    <telerik:GridBoundColumn DataField="shzipcode" SortExpression="shzipcode" HeaderText="Zip"
                    AllowFiltering="true">
                </telerik:GridBoundColumn> 
					    
					   <telerik:GridBoundColumn DataField="shcitycode" SortExpression="shcitycode" HeaderText="City"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
					    
					    
					    
					   <%-- <asp:BoundColumn DataField="shcountrycode" SortExpression="shcountrycode" HeaderText="Cty">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>--%>
					    <%--<asp:BoundColumn DataField="vslvoy" SortExpression="vslvoy" HeaderText="Vsl.Voy">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>
					    <asp:BoundColumn DataField="etd" SortExpression="etd" HeaderText="ETD" 
                            DataFormatString="{0:dd/MMM/yyyy}">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>--%>
					    
					    <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remark1"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
					    
					    <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remark2"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
					    
					   
					    
					    <%--<asp:BoundColumn DataField="rem3" SortExpression="rem3" HeaderText="Remark3">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>
					    <asp:BoundColumn DataField="rem4" SortExpression="rem4" HeaderText="Remark4">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>--%>
					   <%-- <asp:BoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>
					    <asp:BoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>
					    <asp:BoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>
					    <asp:BoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User">
						    <HeaderStyle Wrap="False"></HeaderStyle>
						    <ItemStyle Wrap="False"></ItemStyle>
					    </asp:BoundColumn>--%>
					    
					    <telerik:GridBoundColumn Display="false" DataField="jobno"></telerik:GridBoundColumn>
					    
					 
					    
				     </Columns>
        </mastertableview>
        </telerik:RadGrid>
    </form>
</body>
</html>
