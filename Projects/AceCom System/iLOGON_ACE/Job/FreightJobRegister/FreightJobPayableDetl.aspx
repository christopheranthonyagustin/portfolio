<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightJobPayableDetl.aspx.cs" Inherits="iWMS.Web.Job.FreightJobRegister.FreightJobPayableDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FreightJobPayableDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css">
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
     <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
        Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
        OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
          <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" PageSize="50">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <HeaderTemplate>
                        S/N
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                
                <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="ReferenceNo"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>

                 <telerik:GridBoundColumn DataField="trandate" SortExpression="trandate" HeaderText="Date" DataFormatString="{0:dd/MMM/yyyy}"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
          
                <telerik:GridBoundColumn DataField="cbdctnrno" SortExpression="cbdctnrno" HeaderText="CtnrNo"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
               
                <telerik:GridBoundColumn DataField="chargedescr" SortExpression="chargedescr" HeaderText="Charge"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
                
                <telerik:GridBoundColumn DataField="cbdlcamt" SortExpression="cbdlcamt" HeaderText="LcAmt" DataFormatString="{0:N}" 
                    AllowFiltering="true">
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
                
                <telerik:GridBoundColumn DataField="cbdexref1" SortExpression="cbdexref1" HeaderText="Invoice/ReceiptNo"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
               
                <telerik:GridBoundColumn DataField="cbdexdate1" SortExpression="cbdexdate1" HeaderText="Invoice/ReceiptDate" DataFormatString="{0:dd/MMM/yyyy}"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
              
                <telerik:GridBoundColumn DataField="cbdvdname" SortExpression="cbdvdname" HeaderText="VendorName"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
                
                <telerik:GridBoundColumn DataField="cbdpercode" SortExpression="cbdpercode" HeaderText="Personnel"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
                
                <telerik:GridBoundColumn DataField="cbdvehno" SortExpression="cbdvehno" HeaderText="Vehicle"
                    AllowFiltering="true">
                </telerik:GridBoundColumn>
                
                
               
                
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
