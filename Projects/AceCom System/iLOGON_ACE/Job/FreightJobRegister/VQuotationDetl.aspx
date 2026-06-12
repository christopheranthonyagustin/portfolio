<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VQuotationDetl.aspx.cs" Inherits="iWMS.Web.Job.FreightJobRegister.VQuotationDetl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>QuotationDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td align="left">
                  <%--  <asp:Label ID="QuNoLbl" runat="server">QuotationNo</asp:Label>
                    <br />
                    <telerik:RadTextBox ID="QuNoTxt" runat="server" Enabled="false"></telerik:RadTextBox>--%>
                                 
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
                </tr>
                <tr>
                <td>
                <telerik:RadButton Style="z-index: 0" ID="SearchBtn" runat="server" 
                Text="Search" Skin="WebBlue" OnClick="serachBtn_Click"></telerik:RadButton>&nbsp;
                <telerik:RadButton Style="z-index: 0" ID="AddBtn" runat="server" 
                Text="Add" Skin="WebBlue" OnClick="AddBtn_Click"></telerik:RadButton>&nbsp;
                <telerik:RadButton Style="z-index: 0" ID="CloseBtn" runat="server" 
                Text="Close" Skin="WebBlue" OnClick="CloseBtn_Click"></telerik:RadButton>&nbsp;
                    </td>                     
                                             
            
            </tr>
        <tr>
            <td>
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </td>
            <td>
            </td>
        </tr>
    </table>

    <br />
    <div>
    
     <telerik:RadGrid ID="JBCostDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        Skin="Office2007" >
        
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevAndNumeric" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" EditMode="InPlace">
            <Columns>
            
             <telerik:GridTemplateColumn HeaderText="SeqNo" HeaderStyle-HorizontalAlign="Center" >
            <ItemTemplate>
                        <asp:Label ID="QuDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' Visible="false"></asp:Label>
                       <%-- <asp:Label ID="QuDtTaxTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "taxtype") %>' Visible="false" />--%>
                     <%--   <asp:Label ID="SeqNoLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "seqno") %>' />--%>
             </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
             </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn HeaderText="Charge" HeaderStyle-HorizontalAlign="Center" ItemStyle-Font-Bold="True"
                        UniqueName="ChargeDescription" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="chargeidLbl" runat="server" 
                                Text='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>'></asp:Label>
                            <br>
                        </br>
                            <asp:Label ID="chargeLbl" runat="server"  
                                Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'></asp:Label>
                        </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle Font-Bold="True"></ItemStyle>
                    </telerik:GridTemplateColumn>
          
               <telerik:GridTemplateColumn HeaderText="Qty" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
               <ItemTemplate>
                         <asp:TextBox ID="QtyTxt" runat="server" Width="60"></asp:TextBox>
               </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Right"></ItemStyle>
               </telerik:GridTemplateColumn>
               <telerik:GridTemplateColumn HeaderText="UOM" HeaderStyle-HorizontalAlign="Center" >
               <ItemTemplate>
                          <asp:Label ID="UomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrateuom") %>'></asp:Label>
               </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
               </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
               <ItemTemplate>
                           <asp:TextBox ID="UnitRateTxt" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate", "{0:#,0.00}") %>'></asp:TextBox>
               </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Right"></ItemStyle>
               </telerik:GridTemplateColumn>
               <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center" >
               <ItemTemplate>
                           <asp:TextBox ID="RemarksTxt" runat="server" Width="300" TextMode="MultiLine"></asp:TextBox>
               </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
               </telerik:GridTemplateColumn>
               <telerik:GridTemplateColumn HeaderText="EstQty" HeaderStyle-HorizontalAlign="Center" >
               <ItemTemplate>
                          <asp:Label ID="estqtyLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estqty") %>'></asp:Label>
               </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
               </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="EstUnitCostUOM" HeaderStyle-HorizontalAlign="Center" >
               <ItemTemplate>
                          <asp:Label ID="estunitcostuomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcostuom") %>'></asp:Label>
               </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
               </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="estunitcost" HeaderStyle-HorizontalAlign="Center" >
               <ItemTemplate>
                           <asp:Label ID="estunitcostLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "estunitcost") %>'></asp:Label>
               </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
               </telerik:GridTemplateColumn>
               <telerik:GridTemplateColumn HeaderText="MinCharge" HeaderStyle-HorizontalAlign="Center" >
               <ItemTemplate>
                          <asp:Label ID="minchargeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge") %>'></asp:Label>
               </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
               </telerik:GridTemplateColumn>
               <telerik:GridTemplateColumn HeaderText="MinChargeUOM" HeaderStyle-HorizontalAlign="Center" >
               <ItemTemplate>
                           <asp:Label ID="minchargeuomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumchargeuom") %>'></asp:Label>
               </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
               </telerik:GridTemplateColumn>
               <telerik:GridTemplateColumn HeaderText="MinChargeType" HeaderStyle-HorizontalAlign="Center" >
               <ItemTemplate>
                           <asp:Label ID="minchargetypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumchargetype") %>'></asp:Label>
               </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
               </telerik:GridTemplateColumn>
               <telerik:GridTemplateColumn HeaderText="MinCharge2" HeaderStyle-HorizontalAlign="Center" >
               <ItemTemplate>
                           <asp:Label ID="mincharge2Lbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "minimumcharge2") %>'></asp:Label>
               </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
               </telerik:GridTemplateColumn>
              
 
            </Columns>
         <PagerStyle HorizontalAlign="Left" ForeColor="Black" Mode="NumericPages"></PagerStyle>
                </MasterTableView>
        </telerik:RadGrid></div>
    </form>
</body>
</html>
