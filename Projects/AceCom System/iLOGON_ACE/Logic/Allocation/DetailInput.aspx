<%@ Page language="c#" Codebehind="DetailInput.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Logic.Allocation.DetailInput" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head runat="server">
		<title>Allocation Detail</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../css/iWMS.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<base target="_self">
	    <style type="text/css">
            .style1
            {
                width: 4px;
            }
        </style>
        <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
    </script>
	</head>
	<body leftMargin="0" topMargin="0" onload="javascript:window.focus();">
		<form id="Form1" method="post" runat="server">
		 <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
			<table cellSpacing="0" cellPadding="0" width="100%">
				<tr>
					<td class="pagetitle">&nbsp;
						<asp:label id="ModeLbl" runat="server"></asp:label>&nbsp;
						<asp:label id="IdLbl" runat="server"></asp:label></td>
				</tr>
				<tr>
					<td style="HEIGHT: 242px">
						<table>
							<tr>
								<td>
									<asp:Label id="StepLbl" runat="server">Step</asp:Label>:
									<asp:CompareValidator id="StepVal" runat="server" ErrorMessage="#" ControlToValidate="StepTxt" Type="Integer"
										Operator="DataTypeCheck"></asp:CompareValidator><BR>
								    <telerik:RadTextBox ID="StepTxt" runat="server" Width="40px"></telerik:RadTextBox>	
								</td>
								<td>
									<asp:Label id="DescrLbl" runat="server">Description</asp:Label>:
									<asp:RequiredFieldValidator id="DescrReq" runat="server" ControlToValidate="DescrTxt" ErrorMessage="*"></asp:RequiredFieldValidator><BR>
									<telerik:RadTextBox ID="DescrTxt" runat="server" Width="200px"></telerik:RadTextBox>
							    </td>
								<td><asp:Label id="LogicLbl" runat="server">Strategy Type</asp:Label>:<br>									
									<telerik:RadDropDownList ID="LogicList" runat="server" Skin="WebBlue"></telerik:RadDropDownList>
								</td>
							</tr>
							<tr>
								<td>
									<asp:Label id="UomLbl" runat="server">Pick UOM</asp:Label>
									:<BR>
									<telerik:RadDropDownList ID="PickTypeList" runat="server" Skin="WebBlue"></telerik:RadDropDownList>
									</td>
								<td>From Pick Face:<BR>
									<asp:checkbox id="FromPFCB" runat="server" Text="Tick=Yes"></asp:checkbox></td>
								<td>
									<asp:Label id="ZoneLbl" runat="server">Zone</asp:Label>:<BR>
									<telerik:RadDropDownList ID="ZoneList" runat="server" Skin="WebBlue"></telerik:RadDropDownList>
							    </td>
							</tr>
							<tr>
								<td align="center" colSpan="3">&nbsp;
									<TABLE id="Table1" border="0" cellpadding="0" cellspacing="0">
                                        <TR>
											<TD>Available Lottables</TD>
											<TD>Rotation Priority</TD>
											<TD class="style1">&nbsp;</TD>
											<TD>&nbsp;</TD>
										</TR>
                                        <%--<tr>
                                            <td class="style1">
                                                <asp:Label ID="Label1" runat="server" Text="Available Lottables" Font-Bold="true" Font-Size="Medium"/>
                                            </td>
                                            <td class="style1">
                                                <asp:Label ID="Label2" runat="server" Text="Rotation Priority" Font-Bold="true" Font-Size="Medium"/>
                                            </td>
                                        </tr>--%>
                                        <tr>
                                            <td style="width: 200px" valign="top" align="center">
                                                <telerik:RadGrid ID="ResultDGAvailableLots" runat="server" AutoGenerateColumns="false" GridLines="None" Width="195px"
                                                    EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" AllowSorting="true" OnRowDrop="ResultDGAvailableLots_RowDrop"
                                                    OnItemDataBound="ResultDGAvailableLots_ItemDataBound" UseAccessibleHeader="true" AllowFilteringByColumn="false" 
                                                    OnNeedDataSource="ResultDGAvailableLots_NeedDataSource" AllowMultiRowSelection="true">
                                                    <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true">
                                                        <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                                                    </ClientSettings>
                                                    <SortingSettings EnableSkinSortStyles="false" />
                                                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                                    <ItemStyle Wrap="false"></ItemStyle>
                                                    <HeaderStyle Wrap="false"></HeaderStyle>
                                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="100">
                                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="Lots" SortExpression="Lots" HeaderText="Lots"
                                                                ItemStyle-Wrap="false">
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                </telerik:RadGrid>
                                            </td>
                                            <td style="width: 200px" valign="top">
                                                <telerik:RadGrid ID="ResultDGPriority" runat="server" AutoGenerateColumns="false" GridLines="None" Width="195px"
                                                    OnItemDataBound="ResultDGPriority_ItemDataBound" EnableLinqExpressions="false" AllowPaging="true" Skin="Office2007" 
                                                    AllowSorting="true" OnRowDrop="ResultDGPriority_RowDrop" UseAccessibleHeader="true" AllowFilteringByColumn="false" 
                                                    OnNeedDataSource="ResultDGPriority_NeedDataSource"> 
                                                    <ClientSettings AllowRowsDragDrop="true" AllowAutoScrollOnDragDrop="false" Selecting-AllowRowSelect="true" >
                                                        <Scrolling UseStaticHeaders="True" AllowScroll="true" />
                                                    </ClientSettings>
                                                    <SortingSettings EnableSkinSortStyles="false" />
                                                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                                    <ItemStyle Wrap="false"></ItemStyle>
                                                    <HeaderStyle Wrap="false"></HeaderStyle>
                                                    <MasterTableView AllowMultiColumnSorting="true" PageSize="100">
                                                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="Lots" SortExpression="Lots" HeaderText="Lots"
                                                                ItemStyle-Wrap="false">
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                </telerik:RadGrid>
                                            </td>
                                        </tr>
										<TR>
										  <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
										<%--    <TD>
										    <asp:Label id="Label1" runat="server">Policy</asp:Label><BR>
										    <telerik:RadDropDownList ID="policyDDL" runat="server"></telerik:RadDropDownList>
										  
										    <asp:Label id="Label2" runat="server">PolicyValue</asp:Label><BR>
										    <telerik:RadTextBox ID="policyTxt" runat="server"></telerik:RadTextBox>
										    </TD>--%>
										</TR>
									</TABLE>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td vAlign="top" align="center">&nbsp;
					<%--<telerik:RadButton ID="SaveNextBtn" runat="server" OnClick="SaveNextBtn_Click"
                    Text="Save &amp; Next" ButtonType="LinkButton">
                    </telerik:RadButton>--%>
                        <asp:Button ID="SaveNextBtn" CssClass="white" runat="server" OnClick="SaveNextBtn_Click"
                            Text="Save &amp; Next" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                    <%--<telerik:RadButton ID="SaveBtn" runat="server" OnClick="SaveBtn_Click"
                    Text="Save &amp; Close" ButtonType="LinkButton">
                    </telerik:RadButton>--%>
                         <asp:Button ID="SaveBtn" CssClass="white" runat="server" OnClick="SaveBtn_Click"
                            Text="Save &amp;Close" OnClientClick="disableBtn(this.id, true)" UseSubmitBehavior="false" />
                    <%--<telerik:RadButton ID="CloseBtn" runat="server" OnClick="CloseBtn_Click"
                    Text="Close" ButtonType="LinkButton">
                    </telerik:RadButton>--%>
                        <asp:Button ID="CloseBtn" CssClass="white" runat="server" OnClick="CloseBtn_Click"
                            Text="Close" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
					<%--<asp:button id="SaveNextBtn" runat="server" Text="Save &amp; Next" CssClass="detailButton" onclick="SaveNextBtn_Click"></asp:button>&nbsp;
					<asp:button id="SaveBtn" runat="server" Text="Save &amp; Close" CssClass="detailButton" onclick="SaveBtn_Click"></asp:button>&nbsp;
						<asp:button id="CloseBtn" runat="server" Text="Close" CssClass="detailButton" onclick="CloseBtn_Click" 
                            ></asp:button>--%>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
