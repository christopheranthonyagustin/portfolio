<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BomV2Detl.aspx.cs" Inherits="iWMS.Web.Master.BomV2.BomV2Detl" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>BomV2Detl</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">

    <script src="../../js/row.js" type="text/javascript"></script>
  <style type="text/css">
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1"
        CausesValidation="false" AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
        <Tabs>
            <telerik:RadTab Text="Main" Value="0" readonly="readonly" runat="server">
            </telerik:RadTab>
           <%-- <telerik:RadTab Text="CHILDSKU" Value="100" runat="server">
            </telerik:RadTab>--%>
        </Tabs>
    </telerik:RadTabStrip>
     <br>
    <table>
        <tr>
            <td>&nbsp;
                <asp:Label ID="NumberLbl" runat="server" CssClass="pagetitle"></asp:Label>
            </td>
        </tr>
    </table>
     <br>     
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
        <telerik:RadPageView runat="server" Height="700px" ID="MainInfoRadPageView">
            <table id="Table1" cellspacing="1" width="100%" border="0" runat="server">
                <tr>
                    <td>  
                        <asp:Button ID="UpdteBtn" class="white" runat="server" OnClick="UpdateBtn_Click"
                         Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Update" /> 
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td><br />
                        <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                    </td>
                </tr>
                <tr>
                    <td> <br />
                         <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
                            AllowFilteringByColumn="false" Skin="Metro" OnItemDataBound="ResultDG_ItemDataBound" 
                            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemCommand="ResultDG_ItemCommand">
                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Selecting AllowRowSelect="true"></Selecting>
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <HeaderStyle Wrap="false"></HeaderStyle>
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" Name="ParentGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White"
                                ItemStyle-Wrap="true" HeaderStyle-Wrap="true" AlternatingItemStyle-Wrap="true"
                                HierarchyLoadMode="Client" DataKeyNames="id" CommandItemDisplay="Top" EditMode="InPlace">
                                <Columns>
                                    <telerik:GridTemplateColumn UniqueName="icon">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                                Width="15" Height="15" AlternateText="Edit B.O.M Detail" CommandName="Edit" BackColor="Transparent" 
                                                BorderWidth="0"></asp:ImageButton>
                                            <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                onserverclick="ResultDG_Delete" runat="server">
                                                <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Receipt Detail"
                                                    title="Delete" runat="server" /></a>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                                BorderWidth="0"></asp:ImageButton>
                                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                            <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="childskuid" Display="False">
                                    </telerik:GridBoundColumn>
                                   <telerik:GridTemplateColumn UniqueName="cskucode" HeaderText="SKU" AllowFiltering="false">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "cskucode")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="skutext" Skin="Office2007" Rows="2" Width="150px" AutoPostBack="true" OnTextChanged="SKUCodeText_Changed">
                                            </telerik:RadTextBox>
                                            <asp:RequiredFieldValidator ID="skubomtext" runat="server" ControlToValidate="skutext"
                                                ErrorMessage="*" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>                    
                                    <telerik:GridTemplateColumn UniqueName="cskudescr" HeaderText="Description" AllowFiltering="false">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "cskudescr")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="descrtext" Enabled="false" Skin="Office2007" Rows="2" Width="150px">
                                            </telerik:RadTextBox>                                          
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>                                    
                                    <telerik:GridTemplateColumn UniqueName="childbomqty" HeaderText="ChildBOMQty" AllowFiltering="false">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "childbomqty","{0:#.##}")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="childbomtext" Skin="Office2007" Rows="2" Width="150px">
                                            </telerik:RadTextBox>
                                            <asp:RequiredFieldValidator ID="ChildBOMQtytext" runat="server" ControlToValidate="childbomtext"
                                                ErrorMessage="*" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="childbomtext" runat="server"
                                             ErrorMessage="Positive Intergers Only" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>                                    
                                    <telerik:GridTemplateColumn UniqueName="childbomuomdescr" HeaderText="ChildBOMUOM" AllowFiltering="false">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "childbomuomdescr")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList runat="server" ID="childbomUOMDDL" DropDownHeight="150px" Skin="WebBlue">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="childbomuomtxt" runat="server" ControlToValidate="childbomUOMDDL" ErrorMessage="*" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>                                    
                                    <telerik:GridTemplateColumn UniqueName="skubomtypedescr" HeaderText="ChildBOMType">
                                        <HeaderStyle Wrap="false" HorizontalAlign="left" />
                                        <ItemStyle Wrap="False" HorizontalAlign="left"></ItemStyle>
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "skubomtypedescr")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList runat="server" ID="childbomtypeDDL" DropDownHeight="150px" Skin="WebBlue" 
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ChildbomtypeDS,DataBinder.Eval(Container.DataItem, "type").ToString())%>'
                                                DataSource='<%# ChildbomtypeDS%>' DataTextField="descr" DataValueField="item">
                                            </telerik:RadDropDownList>                                            
                                        </EditItemTemplate>
                                     </telerik:GridTemplateColumn>                                                                        
                                     <telerik:GridTemplateColumn UniqueName="rem1" HeaderText="Remark" AllowFiltering="false">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem, "rem1")%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="Remarktext" Skin="Office2007" Rows="2" Width="150px">
                                            </telerik:RadTextBox>                                           
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>   
                                    <telerik:GridBoundColumn DataField="sb_adddate" SortExpression="sb_adddate" HeaderText="AddDate"
                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="sb_adduser" SortExpression="sb_adduser" HeaderText="Add User">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="sb_editdate" SortExpression="sb_editdate" HeaderText="EditDate"
                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="sb_edituser" SortExpression="sb_edituser" HeaderText="EditUser">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                </Columns>         
                                <DetailTables>
                                <telerik:GridTableView Name="ChildGrid" Width="100%" SkinID="Telerik" AllowFilteringByColumn="false" >
                                <HeaderStyle Wrap="false" />
                                <ItemStyle Wrap="false"/>
                                <AlternatingItemStyle Wrap="false" />
                                <Columns>
                                    <telerik:GridTemplateColumn>
                                        <HeaderTemplate>
                                            No
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="SKUBOMId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="status" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="SubChildSKUId" SortExpression="SubChildSKUId" Display="false" HeaderText="SubChildSKUId">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="ChildSKUCode">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>   
                                    <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>                                 
                                    <telerik:GridBoundColumn DataField="SubChildQty" SortExpression="SubChildQty" HeaderText="SubChildQty"  DataFormatString="{0:#.##}">
                                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemStyle Wrap="False" HorizontalAlign="Center"/>
                                    </telerik:GridBoundColumn>                                   
                                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser">
                                        <HeaderStyle Wrap="False"></HeaderStyle>
                                        <ItemStyle Wrap="False"></ItemStyle>
                                    </telerik:GridBoundColumn>
                                </Columns>
                                </telerik:GridTableView>
                              </DetailTables>                      
                                <PagerStyle HorizontalAlign="Left" ForeColor="Black" Position="TopAndBottom" Mode="NumericPages">
                                </PagerStyle>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
     <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
            border: 2px solid #780606;" DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                            </td>
                            <td style="width: 2%;">
                            </td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="btnOk" runat="server" Text="OK" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
    </form>
</body>
</html>