<%@ Page Language="c#" CodeBehind="QuotationSDetl.aspx.cs" AutoEventWireup="True"
    Inherits="iWMS.Web.Sales.Quotation_17.QuotationSDetl" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>QUSDet</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <base target="_self">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function Close() {
            GetRadWindow().close();
        }
    </script>
</head>
<body onload="javascript:window.focus();">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td>
                <br />
              <%--  &nbsp;<asp:Button ID="AddDetailBtn" runat="server" Text="Add" CssClass="white"
                    OnClick="AddDetailBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false"></asp:Button>--%>
                &nbsp;<asp:Label ID="DescrLbl" runat="server" CssClass="pagetitle"></asp:Label><br />
                <br />
            </td>
            <td align="right">
                <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <br>
    <div id="div-datagrid">
        <telerik:RadGrid ID="QUSDetDG" runat="server" AutoGenerateColumns="false" GridLines="Both" OnCancelCommand="QUSDetDG_Cancel" 
            OnNeedDataSource="QUSDetDG_NeedDataSource" OnUpdateCommand="QUSDetDG_Update" OnEditCommand="QUSDetDG_Edit" OnItemCommand="QUSDetDG_ItemCommand"
            OnItemDataBound="QUSDetDG_ItemDataBound" CellPadding="2" UseAccessibleHeader="True" Skin="Metro">
            <ClientSettings>
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>        
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="ID" EditMode="InPlace" CommandItemDisplay="Top" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">  
            <CommandItemSettings ShowRefreshButton="false" />         
            <Columns>
                <telerik:GridTemplateColumn UniqueName="icon">
                    <ItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="SkuGrpUOMEdit" ImageUrl="../../image/pencil.gif"
                            Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                        <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="QUSDetDelete"
                            runat="server">
                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete UOM"
                                runat="server"></a>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton runat="server" Visible="True" ID="QUSDetUpdate" ImageUrl="../../image/floppy.gif"
                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                            BorderWidth="0"></asp:ImageButton>
                        <asp:ImageButton runat="server" Visible="True" ID="QUSDetCancel" ImageUrl="../../image/arrow6.gif"
                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                            BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                    </EditItemTemplate>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridTemplateColumn>   
                <telerik:GridTemplateColumn>
                    <HeaderTemplate>
                        S/N
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.ItemIndex+1%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn> 
                <telerik:GridBoundColumn Visible="False" DataField="qudtId" SortExpression="qudtId" HeaderText="QudtId">
                </telerik:GridBoundColumn>
                <%--  <asp:TemplateColumn HeaderText="UOM">
                    <EditItemTemplate>
                        <asp:DropDownList ID="UOMList" DataTextField="Descr" DataValueField="Item" runat="server"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(packListDS,DataBinder.Eval(Container.DataItem, "uom").ToString())%>'
                            DataSource='<%# packListDS%>' />
                        <asp:RequiredFieldValidator ID="ReqUOMListVal" runat="server" ControlToValidate="UOMList"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "uomdescr") %>
                    </ItemTemplate>
                </asp:TemplateColumn>--%>
                <telerik:GridTemplateColumn HeaderText="Zone" ItemStyle-HorizontalAlign="Right">
                    <EditItemTemplate>
                        <telerik:RadDropDownList ID="ZoneList" Enabled="True" DataTextField="Descr" DataValueField="item" Skin="Office2007"
                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ZoneListDS,DataBinder.Eval(Container.DataItem, "zonecode").ToString())%>'
                            runat="server" DataSource='<%# ZoneListDS%>' Width="150px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "zonecode")%>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Qty" ItemStyle-HorizontalAlign="Right">                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "qty", "{0:#,0.000000}")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="QtyTxt" Skin="Office2007" runat="server" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "qty") %>'></telerik:RadTextBox>
                    </EditItemTemplate>                    
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="Rate" ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "rate", "{0:#,0.00}")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="RateTxt" Skin="Office2007" runat="server" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "rate") %>'></telerik:RadTextBox>
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>          
                <telerik:GridTemplateColumn UniqueName="chargecode" HeaderText="ChargeCode">
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle> 
                     <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "chargecode")%>
                    </ItemTemplate>                  
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="ChargeCodeList" runat="server"  DataTextField="code" DataValueField="id" RenderMode="Lightweight" Filter="Contains"
                            DataSource='<%# ChargeCodeListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ChargeCodeListDS,DataBinder.Eval(Container.DataItem, "chargeid").ToString())%>'
                            DropDownHeight="150px" Skin="WebBlue" >                           
                        </telerik:RadComboBox>                                          
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>
               <telerik:GridTemplateColumn UniqueName="chargedescr" HeaderText="ChargeDescr" >
                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                    <ItemStyle Wrap="False" HorizontalAlign="Center" ></ItemStyle>  
                    <ItemTemplate>
                        <%# DataBinder.Eval(Container.DataItem, "chargedescr")%>
                    </ItemTemplate>                   
                    <EditItemTemplate>
                        <telerik:RadTextBox ID="ChargeDescrTxt" Skin="Office2007" TextMode="MultiLine" runat="server" Width="150px" Height="40px" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'></telerik:RadTextBox>                                      
                    </EditItemTemplate>
                </telerik:GridTemplateColumn>             
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" ReadOnly="True" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn> 
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" ReadOnly="True" HeaderText="Add User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn> 
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" ReadOnly="True" HeaderText="Edit Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ReadOnly="True" HeaderText="Edit User">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>
            </Columns>
           </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
