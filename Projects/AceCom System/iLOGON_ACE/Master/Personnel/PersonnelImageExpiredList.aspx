<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonnelImageExpiredList.aspx.cs"
    Inherits="iWMS.Web.Master.Personnel.PersonnelImageExpiredList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>VehicleImageExpiredList</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
    <form id="Form1" method="post" runat="server">
     <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <%--<asp:Label ID="PersonnelLbl" runat="server" CssClass="pagetitle">Personnel Image :</asp:Label>--%><br>
                <asp:Button ID="AddBtn" runat="server" Text="New" CssClass="white" OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false">
                </asp:Button>
                &nbsp;<%--<asp:Label ID="personnelCodeLbl" Font-Italic="False" runat="server" Style="font-family: Arial, Helvetica, sans-serif;
                    font-size: 16px; font-weight: 700"></asp:Label>--%><asp:Label ID="MessageLbl" runat="server"
                        ForeColor="Red" Font-Bold="True"></asp:Label>
            </td>
            <td align="right">
                &nbsp;&nbsp;
                <%--<A id="ExportExcelLnk" runat="server" onserverclick="ExportExcel"><IMG id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
								  height="20" runat="server"></A>--%>
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="False"
            AllowSorting="True" EnableLinqExpressions="False" AllowPaging="True" Skin="Metro"
            OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
            OnEditCommand="ResultDG_EditCommand" GroupPanelPosition="Top">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="../../image/pencil.gif"
                                Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                                CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                            <asp:Label ID="ImageLbl" runat="server"></asp:Label>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="PerExpiredImage_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Vehicle"
                                    runat="server"></a>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
       
                    <telerik:GridBoundColumn DataField="frdate" SortExpression="frdate" HeaderText="From Date"
                        DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="todate" SortExpression="todate" HeaderText="To Date"
                        DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="refno" SortExpression="refno" HeaderText="Reference"
                        ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="imagename" SortExpression="imagename" HeaderText="Name"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>                    
					<telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" 
                        HeaderText="Type">
						<HeaderStyle Wrap="False"></HeaderStyle>
						<ItemStyle Wrap="False"></ItemStyle>
					</telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remarks1"
                        ItemStyle-Wrap="False">
                        <ItemStyle Wrap="False" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remarks2"
                        ItemStyle-Wrap="False">
                        <ItemStyle Wrap="False" />
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="amt" SortExpression="amt" HeaderText="Amount"
                        DataFormatString="{0:#,0.##}" ItemStyle-Wrap="False">
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                        ItemStyle-Wrap="False">
                        <ItemStyle Wrap="False" />
                    </telerik:GridBoundColumn>                    
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                        <ItemStyle Wrap="False" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                        ItemStyle-Wrap="False">
                        <ItemStyle Wrap="False" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                        <ItemStyle Wrap="False" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        ItemStyle-Wrap="False">
                        <ItemStyle Wrap="False" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="imagetype" Display="False" ItemStyle-Wrap="False">
                        <ItemStyle Wrap="False" />
                    </telerik:GridBoundColumn>
                   
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
