<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Page Language="c#" CodeBehind="TransportHead.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.TransporterCT.TransportHead" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TransportHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">

    <script src="../../js/sub_global.js" type="text/javascript"></script>

    <script src="../../js/sub_menu.js" type="text/javascript"></script>

</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form2" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
    <div id="div2" style="height: 92%">
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <div id="div3" style="height: 80%" >
            <asp:Label Style="z-index: 0" ID="Label1" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowSorting="true" AllowFilteringByColumn="true"
                EnableLinqExpressions="false" AllowPaging ="true"
                Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnPageIndexChanged="ResultDG_PageIndexChanged"
                OnItemDataBound="ResultDG_ItemDataBound" >
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" /> 
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" 
                DataKeyNames="id" >
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <ItemTemplate>
                                <iWMS:iSubMenu ID="subMenuCtl" runat="server"></iWMS:iSubMenu>
                                <iWMS:iSubMenu ID="subMenuPrintCtl" runat="server"></iWMS:iSubMenu>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <asp:Label ID="CODLbl" runat="server"></asp:Label>
                                <asp:Label ID="JbCfmLbl" runat="server" />
                                <asp:Label ID="NonBillCfmLbl" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn Display="False" DataField="id" HeaderText="id">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="acid" HeaderText="id">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="JobNo"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="status">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"  ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="CustRef"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="noofctnr">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="nooftrip">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ET" SortExpression="ET" HeaderText="E-T" AllowFiltering="false" ItemStyle-Width="100px">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="noofperh">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="noofperd">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MP" SortExpression="MP" HeaderText="M-P" AllowFiltering="false" ItemStyle-Width="100px">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="drinvno" SortExpression="drinvno" HeaderText="InvNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="ExpDate"
                            DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="cargopacktypedescr" SortExpression="cargopacktypedescr"
                            HeaderText="ShptType" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="billsizetypedescr" SortExpression="billsizetypedescr"
                            HeaderText="BillSize"  ItemStyle-Wrap="false" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="JobType">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="permittypedescr" SortExpression="permittypedescr"
                            HeaderText="TptType" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="license" SortExpression="license" HeaderText="Descr"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="outvessel" SortExpression="outvessel" HeaderText="Vsl"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="outvoyage" SortExpression="outvoyage" HeaderText="Voy"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="ineta" SortExpression="ineta" HeaderText="ETA"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="fraddr" SortExpression="fraddr" HeaderText="From"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="toaddr" SortExpression="toaddr" HeaderText="To"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="eqpaddr" SortExpression="eqpaddr" HeaderText="Eqp" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" ItemStyle-Wrap="false"  HeaderText="Remarks">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="PortnetNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="releaseloc"  ItemStyle-Wrap="false" SortExpression="releaseloc" HeaderText="Site">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="permitno" ItemStyle-Wrap="false" SortExpression="permitno" HeaderText="PermitNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="qucode" ItemStyle-Wrap="false" SortExpression="qucode" HeaderText="QuotationNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="inedoasn" ItemStyle-Wrap="false" SortExpression="inedoasn" HeaderText="ImportEdoAsn">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="outesnasn" ItemStyle-Wrap="false" SortExpression="outesnasn" HeaderText="ExportEsnAsn">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                            HeaderText="EditUser">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isnonbillable" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="cargoPackTypeUSR02" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </div>
    </form>
</body>
</html>
