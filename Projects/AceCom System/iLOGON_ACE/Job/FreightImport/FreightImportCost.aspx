<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightImportCost.aspx.cs"
    Inherits="iWMS.Web.Job.FreightImport.FreightImportCost" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FreightImportCost</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script src="../../js/row.js" type="text/javascript"></script>
        <script type="text/javascript">
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
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td align="left">                   
                    <asp:Button ID="SaveBtn" runat="server" CssClass="white" UseSubmitBehavior="false"
                        OnClientClick="disableBtn(this.id,false)" Text="Save" OnClick="SaveBtn_Click"></asp:Button>&nbsp;
                    <!-- Added by Amy on 10/Nov/2017 for Ticket# -->
                    <asp:Button ID="QuBtn" runat="server" CssClass="white" OnClick="QuBtnBtn_Click"
                        Text="Add" Visible="true" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;
                   <asp:Button ID="DelImgBtn" runat="server" CssClass="white" OnClick="DeleteBtn_Click" UseSubmitBehavior="false"
                        Text="Delete"  OnClientClick="disableBtn(this.id,false)"/>
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
                &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <div id="div3" style="height: 100%">
            <telerik:RadGrid ID="JBCostDG" runat="server" AutoGenerateColumns="False" GridLines="Both"
                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"  
                AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
                OnPageIndexChanged="ResultDG_PageIndexChanged" OnItemDataBound="ResultDG_ItemDataBound">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                <ItemStyle Wrap="true"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                          <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false"
                            HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <HeaderTemplate>
                                <asp:CheckBox ID="cbSelectAll" runat="server" OnClick="selectAll(this)" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn Display="False" DataField="acid" SortExpression="acid" HeaderText="acid"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="jbid" SortExpression="jbid" HeaderText="jbid"></telerik:GridBoundColumn>
                        
                        <telerik:GridTemplateColumn HeaderText="jbcostid" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="jbcostIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>'></asp:Label>
                        </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        
                        <telerik:GridTemplateColumn HeaderText="qudtid" HeaderStyle-HorizontalAlign="Center" Display="false">
                        <ItemTemplate>
                            <asp:Label ID="QuDtIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "qudtid") %>'></asp:Label>
                        </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridBoundColumn  DataField="quchargedescr" SortExpression="quchargedescr" HeaderText="Charge" ItemStyle-Font-Bold="true">
                        </telerik:GridBoundColumn>
                    
                        <telerik:GridTemplateColumn HeaderText="Qty" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:TextBox ID="QtyTxt" runat="server" Width="60" Text='<%# DataBinder.Eval(Container.DataItem, "qty") %>'></asp:TextBox>
                        </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn HeaderText="UOM" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="UomLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "uom") %>'></asp:Label>
                        </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn HeaderText="Rate" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="UnitRateTxt" runat="server" Width="40" Text='<%# DataBinder.Eval(Container.DataItem, "unitrate") %>'></asp:TextBox>
                        </ItemTemplate>
                        </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderText="Currency" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:DropDownList ID="CurrencyList" runat="server" DataSource='<%# CurrencyListDS%>' DataTextField="code"
                                DataValueField="code" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CurrencyListDS,DataBinder.Eval(Container.DataItem, "currcode").ToString())%>' />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                        

                        <telerik:GridTemplateColumn HeaderText="FCAmt" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="FcurrAmtTxt" runat="server" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "fcurramt") %>'></asp:TextBox>
                        </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn HeaderText="ExchRate" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="ExchRateTxt" runat="server" Width="60" Text='<%# DataBinder.Eval(Container.DataItem, "exchrate") %>'></asp:TextBox>
                        </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn HeaderText="LCAmt" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <asp:Label ID="LCAmtLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lcurramt") %>'></asp:Label>
                        </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:TextBox ID="RemarksTxt" runat="server" Width="300" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'></asp:TextBox>
                        </ItemTemplate>
                        </telerik:GridTemplateColumn>
                </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
