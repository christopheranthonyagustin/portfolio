<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VehicleImageExpiredList.aspx.cs"
    Inherits="iWMS.Web.Master.Vehicle.VehicleImageExpiredList" %>

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

    <script type="text/javascript" src="../../js/row.js"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td><br />&nbsp;
                <asp:Label ID="VehLbl" runat="server" CssClass="pagetitle">Vehicle Image :</asp:Label><br><br />&nbsp;             
                <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click" Text="NewDoc" UseSubmitBehavior="true"></asp:Button> 
                &nbsp;<asp:Label ID="vehicleCodeLbl" Font-Italic="False" runat="server" Style="font-family: Arial, Helvetica, sans-serif;
                    font-size: 16px; font-weight: 700"></asp:Label><asp:Label ID="MessageLbl" runat="server"
                        ForeColor="Red" Font-Bold="True"></asp:Label>
            </td>
            <td align="right">
                &nbsp;&nbsp;
                <asp:Button ID="ExportExcelLnk" class="LongLabelGreen" runat="server" OnClick="ExportExcel" Text="Export to Excel" UseSubmitBehavior="true" ></asp:Button>
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
            OnItemDataBound="ResultDG_ItemDataBound">
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
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Detail"
                                    OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                            <asp:Label ID="ImageLbl" runat="server"></asp:Label>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="VehicleImage_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Vehicle"
                                    runat="server"></a>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                     
                    <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="refno" SortExpression="refno" HeaderText="Reference"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="imagename" SortExpression="imagename" HeaderText="Name"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="frdate" SortExpression="frdate" HeaderText="From Date"
                        DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="todate" SortExpression="todate" HeaderText="To Date"
                        DataFormatString="{0:dd/MMM/yyyy}" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="amt" SortExpression="amt" HeaderText="Amount"
                        DataFormatString="{0:#,0.##}" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rem1" SortExpression="rem1" HeaderText="Remarks1"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rem2" SortExpression="rem2" HeaderText="Remarks2"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add User"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                        ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="imagetype" Display="False" ItemStyle-Wrap="False">
                    </telerik:GridBoundColumn>
                    
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
