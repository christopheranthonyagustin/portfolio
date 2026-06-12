<%@ Page Language="c#" CodeBehind="LoadPlanningCtnrList.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Outbound.Issue.LoadPLanningCtnrList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>LoadPLanningCtnrList</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1
        {
            width: 99px;
        }
    
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%" cellspacing="0" cellpadding="0" border="0">
    <tr>
    <td>
        <asp:Panel ID="MainPanel" runat="server">
        <table width="100%" >
                <tr>
                    <td colspan ="6">
                    <telerik:RadButton ID="BackBtn" runat="server" Text="Back" Visible="true" Skin="WebBlue"
                            OnClick="BackBtn_Click" />
                    &nbsp;<asp:Label ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                    <%-- <telerik:RadButton ID="NextBtn" runat="server" Text="Transfer" Visible="true" Skin="WebBlue"
                            OnClick="TransferBtn_Click" />--%>
                    </td>
                    <td align="left">
                        <br />
                        &nbsp;<br />
                        &nbsp;<br />
                        <br />
                    </td>
                    <td colspan ="4" align="right">
                    &nbsp;
                    </td>
                </tr>
              <tr>       
                <td>
                    Choose From: 
                </td>
                <td>
                    <telerik:RadDropDownList ID ="CtnrDDL" runat="server" Skin="Sunset" OnSelectedIndexChanged="CtnrDDL_SelectedIndexChanged" AutoPostBack="true"></telerik:RadDropDownList>
                </td>
                
                <td>            
                </td>           
                <td class="style1">
                </td>
            
                <td>
                    To: 
                </td>
                <td>
                    <telerik:RadDropDownList ID ="ToCtnrDDL" runat="server" Skin="Sunset" OnSelectedIndexChanged="ToCtnrDDL_SelectedIndexChanged" AutoPostBack="true"></telerik:RadDropDownList>
                </td>
                
                <td>
                </td>                
                <td class="style1">
                </td>
                
                
                 <td>            
                    <telerik:RadButton ID="CheckBtn" runat="server" Text="Check" Visible="true" Skin="WebBlue"
                        OnClick="CheckBtn_Click" />
                </td> 
                
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="false" Skin="Metro" AllowSorting="false"
            AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource" Width="50%">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" >
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="id" Display="False"
                        ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                    <%--<telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                        HeaderText="No">
                        <ItemTemplate>
                            <%#Container.ItemIndex+1%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>--%>
                    <telerik:GridBoundColumn DataField="pkdid" SortExpression="pkdid" 
				    Display="false"/>
				    <telerik:GridBoundColumn DataField="ptdtid" SortExpression="ptdtid"
				    Display="false"/>
                    <telerik:GridBoundColumn DataField="skulotwt" SortExpression="skulotwt" HeaderText="SKULotWt" 
				    Display="false"/>
				    <telerik:GridBoundColumn DataField="skulotnetwt" SortExpression="skulotnetwt" HeaderText="SKULotNetwt" 
				    Display="false"/>
                    <telerik:GridBoundColumn DataField="ref" SortExpression="ref" HeaderText="Ref"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="sku" SortExpression="sku" HeaderText="SKU" 
				    ItemStyle-Wrap="false"/> 
				    <telerik:GridBoundColumn DataField="LotNo" SortExpression="LotNo" HeaderText="LotNo" 
				    ItemStyle-Wrap="false"/> 
				    <telerik:GridBoundColumn DataField="Loccode" SortExpression="Loccode" HeaderText="LocCode" 
				    ItemStyle-Wrap="false"/> 
                    <telerik:GridBoundColumn DataField="qty" SortExpression="qty" HeaderText="Qty">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="tuno1" 
				    ItemStyle-Wrap="false"/> 
                    
                    			    
                    <telerik:GridBoundColumn DataField="blank" SortExpression="" HeaderText="Wt" ItemStyle-Width="20%" />
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="TransQty" AllowFiltering="false"
                        HeaderText="TransferQty" ItemStyle-Width="20%">
                        <ItemTemplate>
                            <telerik:RadTextBox ID="TransQtyTxt" runat="server" Skin="WebBlue" Text ="0" Width="80px" EnabledStyle-HorizontalAlign="Center" ></telerik:RadTextBox>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                   <%-- <telerik:GridBoundColumn DataField="ctnrtype" SortExpression="ctnrtype" HeaderText="ctnrtype"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>--%>
                    <%--<telerik:GridBoundColumn DataField="NoOfPkCtn" SortExpression="NoOfPkCtn" HeaderText="TotalPLT"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>--%>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="NoOfPLT" AllowFiltering="false"
                        HeaderText="ToPLT">
                        <ItemTemplate>
                            <telerik:RadDropDownList ID="ToPalletList" runat="server"
                             Width="120px" DropDownHeight="150px" Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ToPltListDS,DataBinder.Eval(Container.DataItem, "ref").ToString())%>'
                            DataSource='<%# ToPltListDS%>' DataTextField="ref" DataValueField="id" ></telerik:RadDropDownList>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>        
        </asp:Panel>        
     </td>
    </tr>
    
    <tr>
     <td>
       <asp:Panel ID="CheckPannel" runat="server" Visible="False">
        <table id="Table2" border="0" cellspacing="1" cellpadding="1" width="100%">
            <tr>
                <td>
                    <telerik:RadButton ID="BackBtn2" runat="server" Text="Back" Visible="true" Skin="WebBlue"
                            OnClick="BackBtn2_Click" />
                    &nbsp;
                        <telerik:RadButton ID="TransferBtn" runat="server" Text="Transfer" Visible="true" Skin="WebBlue"
                            OnClick="TransferBtn_Click" />
                    &nbsp;<asp:Label ID="MessageLbl2" runat="server" CssClass="errorLabelBig"></asp:Label>
                    </td>               
        </tr>
      </table>
      <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="false" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="false" Skin="Metro" AllowSorting="false"
            AllowFilteringByColumn="true" OnItemDataBound="RadGrid1_ItemDataBound" OnNeedDataSource="RadGrid1_NeedDataSource" Width="50%">
            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" >
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <%--<telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="id" Display="False"
                        ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn> --%>                  
                    <telerik:GridBoundColumn DataField="CtnrNo" SortExpression="CtnrNo" HeaderText="Container No"
                        ItemStyle-Wrap="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="totbag" SortExpression="totbag" HeaderText="Total Bag" 
				    ItemStyle-Wrap="false"/> 
				    <telerik:GridBoundColumn DataField="wtAfterTransfer" SortExpression="wtAfterTransfer" HeaderText="Total Wt" 
				    ItemStyle-Wrap="false"/> 				   
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
     </asp:Panel> 
    </td>
   </tr>  
   
 </table>           
   
    </form>
</body>
</html>
