<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SHLMSInterface.aspx.cs"
    Inherits="iWMS.Web.Interface.Outgoing.SHLMSInterface" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SHLMS Interface</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table>
        <tr>
            <td>
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox runat="server" ID="FilePathTxt" Visible="false" />
                <telerik:RadButton ID="RefreshBtn" runat="server" OnClick="RefreshBtn_Click" Text="Refresh"
                    Skin="WebBlue" SingleClick="true" SingleClickText="Refreshing...">
                </telerik:RadButton>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <telerik:RadGrid ID="ResultRadGrid" runat="server" GridLines="None" AutoGenerateColumns="false"
        GroupingSettings-CaseSensitive="false" AllowFilteringByColumn="true" FilterType="Classic"
        AllowSorting="false" BorderStyle="Solid" OnItemCreated="ResultRadGrid_ItemCreated"
        OnItemCommand="ResultRadGrid_ItemCommand" Skin="Office2007" OnPreRender="ResultRadGrid_PreRender"
        OnItemDataBound="ResultRadGrid_ItemDataBound">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" EnablePostBackOnRowClick="false"
            Resizing-AllowColumnResize="false">
            <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
        </ClientSettings>
        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
        <ItemStyle Wrap="true"></ItemStyle>
        <HeaderStyle Wrap="true"></HeaderStyle>
        <FooterStyle Font-Bold="true" Wrap="true"></FooterStyle>
        <MasterTableView AllowMultiColumnSorting="false" TableLayout="Fixed" Name="Master"
            DataKeyNames="id" Width="100%">
            <Columns>
                <telerik:GridTemplateColumn HeaderStyle-Width="70px" AllowFiltering="false">
                    <ItemTemplate>
                        <asp:LinkButton ID="browseLnkBtn" runat="server" Text="Preview" OnClick="browseLnkBtn_Click" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn FilterControlWidth="50px" HeaderStyle-Width="80px" ItemStyle-Width="80px"
                    AllowFiltering="true" DataField="SHStatus" ColumnGroupName="SHStatus" ShowFilterIcon="false"
                    SortExpression="SHStatus" UniqueName="SHStatus" HeaderText="Status" AutoPostBackOnFilter="true"
                    CurrentFilterFunction="Contains">
                    <ItemTemplate>
                        &nbsp;
                        <asp:LinkButton ID="logLnkBtn" runat="server" OnClick="logLnkBtn_Click" Text='<% #DataBinder.Eval(Container,"DataItem.SHStatus")%>' />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn HeaderText="Date" DataField="filereceived" AllowFiltering="false"
                    HeaderStyle-Width="85px" ColumnGroupName="filereceived" SortExpression="filereceived" UniqueName="filereceived" 
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="FileName" DataField="filename" AllowFiltering="false"
                    CurrentFilterFunction="Contains" HeaderStyle-Width="280px" ColumnGroupName="filename"
                    SortExpression="filename" UniqueName="filename">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="IFType" DataField="msgtype" AllowFiltering="true"
                    HeaderStyle-Width="80px" FilterControlWidth="60px" ColumnGroupName="msgtype"
                    SortExpression="msgtype" UniqueName="msgtype" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains"
                    ShowFilterIcon="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="SAP Reference" DataField="exref1" AllowFiltering="true"
                    FilterControlWidth="80px" ColumnGroupName="exref1" SortExpression="exref1" UniqueName="exref1"
                    AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ShowFilterIcon="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="srcno" HeaderText="iWMSDocNo" UniqueName="srcno"
                    FilterControlWidth="100px" SortExpression="srcno" AllowFiltering="true" AutoPostBackOnFilter="true"
                    CurrentFilterFunction="Contains" ShowFilterIcon="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="doctype" HeaderText="iWMSDocType" UniqueName="doctype"
                    FilterControlWidth="100px" SortExpression="doctype" AllowFiltering="true" AutoPostBackOnFilter="true"
                    CurrentFilterFunction="Contains" ShowFilterIcon="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ProcessedDate" DataField="editdate" AllowFiltering="false"
                    ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="TriggerBy" DataField="edituser" AllowFiltering="false" HeaderStyle-Width="100px"
                    ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="filepath" UniqueName="filepath" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="processid" UniqueName="processid" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="status" UniqueName="status" Display="false">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
