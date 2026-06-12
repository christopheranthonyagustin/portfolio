<%@ Page Language="c#" CodeBehind="ShipmentCtnrItemDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Job.Shipment.ShipmentCtnrItemDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>DeclarationCtnrItemDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
  	<LINK href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet"/>
     <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
  	   <script type="text/javascript" src="../../js/row.js"></script>
  	   <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
  	   <script language="javascript" type="text/javascript">
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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle"><br />
                <asp:Button ID="AddDetailBtn" CssClass="white" runat="server" Visible="False"
                    OnClick="AddDetailBtn_Click" Text="New"  OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <asp:Button ID="UpdateDetailBtn" CssClass="white" runat="server" Visible="true"
                    OnClick="UpdateDetailBtn_Click" Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <asp:Button ID="MassDeleteBtn" CssClass="white" runat="server" Visible="true"
                    OnClick="MassDeleteBtn_Click" Text="Delete" OnClientClick="return confirm('Confirm to delete the selected Container(s)?')" UseSubmitBehavior="true" />
                <asp:Button ID="ButtonExcel" CssClass="green" runat="server" OnClick="ExcelBtn_Click" Text="Excel" CausesValidation="false" UseSubmitBehavior="false" />
                <asp:Button ID="GenLotNoBtn" CssClass="LongLabelWhite" runat="server" Visible="true"
                    OnClick="GenLotNoBtn_Click" Text="Generate LotNo" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />

                    &nbsp;
                <br />
            </td>
            <td align="right">
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" Visible="False" ForeColor="Red"
                    Font-Bold="True"></asp:Label>&nbsp;
            </td>
             <td align="right">
                <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
            </td>
        </tr>
    </table>
    <br>
   <div id="div-datagrid" style=" width: 100%;">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
            AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource"
            OnEditCommand="ResultDG_EditCommand">            
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false"></Selecting>
                <Scrolling UseStaticHeaders="True" AllowScroll="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                    <HeaderTemplate>
                        <input id="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="SelectChkBox" runat="server"></asp:CheckBox>
                    </ItemTemplate>
                     </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ldEdit" ImageUrl="../../image/pencil.gif"
                                Width="15" Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Edit Detail"
                                CommandName="Edit" CausesValidation="False"></asp:ImageButton>
                            <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                            <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                onserverclick="CtnrItemDetail_Delete" runat="server">
                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                    runat="server" /></a>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn AllowFiltering="false">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn Display="False" DataField="id" SortExpression="id" HeaderText="id"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="acid" SortExpression="acid" HeaderText="acid"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="jbid" SortExpression="jbid" HeaderText="jbid"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="seqno" SortExpression="seqno" HeaderText="SeqNo"
                        ItemStyle-Wrap="false" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Acc"
                        ItemStyle-Wrap="false" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="jbctnrno" SortExpression="jbctnrno" HeaderText="Container"
                        ItemStyle-Wrap="false" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="invnodescr" SortExpression="invnodescr" HeaderText="Invoice"
                        ItemStyle-Wrap="false" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="hscode" SortExpression="hscode" HeaderText="HSCode"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="outerqty" SortExpression="outerqty" HeaderText="OuterQty"
                        DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="inqty" SortExpression="inqty" HeaderText="InPackQty"
                        DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="innerqty" SortExpression="innerqty" HeaderText="InnerPackQty"
                        DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="inmostqty" SortExpression="inmostqty" HeaderText="InMostPackQty"
                        DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="dutiableqty" SortExpression="dutiableqty" HeaderText="DutiableQty"
                        DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="uprice" SortExpression="uprice" HeaderText="DutyRate"
                        DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="outeruom" SortExpression="outeruom" HeaderText="OuterUOM"
                        ItemStyle-Wrap="false" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pono" SortExpression="pono" HeaderText="PONO"
                        ItemStyle-Wrap="false" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="poline" SortExpression="poline" HeaderText="POLine"
                        ItemStyle-Wrap="false" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="currlotno" SortExpression="currlotno" HeaderText="CurrentLotNo"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="SKUDescription"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="coo" SortExpression="coo" HeaderText="COO" ItemStyle-Wrap="false" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <%--Edited by XR -- 08/06/2016 Ticket#2113--%>
                    <telerik:GridTemplateColumn HeaderText="Brand" AllowFiltering="false" Resizable="true">
                        <ItemTemplate>
                            <asp:TextBox ID="brandTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "brand") %>'></asp:TextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <%--Edited End--%>
                   <%-- <telerik:GridBoundColumn DataField="brand" SortExpression="brand" HeaderText="Brand"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>--%>
                    <telerik:GridBoundColumn DataField="ciffobamt" SortExpression="ciffobamt" HeaderText="CIFValue" 
                        DataFormatString="{0:#,0.00}" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ABV" SortExpression="ABV" HeaderText="ABV" ItemStyle-Wrap="false"
                     DataFormatString="{0:#,0.0}" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    </telerik:GridBoundColumn >
                    <telerik:GridBoundColumn DataField="hstypedescr" SortExpression="hstypedescr" HeaderText="HSType" AllowFiltering="false"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="xdouterqty" SortExpression="xdouterqty" HeaderText="XDOuterQty"
                        DataFormatString="{0:#,0.##}" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="xdouteruom" SortExpression="xdouteruom" HeaderText="XDOuterUOM"
                        ItemStyle-Wrap="false" AllowFiltering="false">
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
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
   
    </form>
</body>
</html>
