<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightExportPayableDetl.aspx.cs"
    Inherits="iWMS.Web.Job.FreightExport.FreightExportPayableDetl" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FreightExportPayableDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
</head>
    <body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
            </td>
        </tr>
    </table>
    <br>
    <div style="height: 80%" id="div-datagrid">
      <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
        AllowFilteringByColumn="true"  OnNeedDataSource="ResultDG_NeedDataSource">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                     <HeaderTemplate>
                        S/N
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                    
                     <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="ReferenceNo"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="trandate" SortExpression="trandate" HeaderText="Date"
                    DataFormatString="{0:dd/MMM/yyyy}"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="cbdctnrno" SortExpression="cbdctnrno" HeaderText="CtnrNo"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="chargedescr" SortExpression="chargedescr" HeaderText="Charge"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="cbdlcamt" SortExpression="cbdlcamt" HeaderText="LcAmt"
                    DataFormatString="{0:N}"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="cbdexref1" SortExpression="cbdexref1" HeaderText="Invoice/ReceiptNo"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="cbdexdate1" SortExpression="cbdexdate1" HeaderText="Invoice/ReceiptDate"
                    DataFormatString="{0:dd/MMM/yyyy}"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="cbdvdname" SortExpression="cbdvdname" HeaderText="VendorName"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="cbdpercode" SortExpression="cbdpercode" HeaderText="Personnel"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="cbdpercode" SortExpression="cbdpercode" HeaderText="Personnel"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn  DataField="cbdvehno" SortExpression="cbdvehno" HeaderText="Vehicle"
                    ItemStyle-Wrap="false">
                </telerik:GridBoundColumn>
             
              </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </div> </div>
    </form>
</body>
</html>
