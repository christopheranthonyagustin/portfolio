<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SRVMassChange.aspx.cs" Inherits="iWMS.Web.Inbound.PutAwayTask.SRVMassChange" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SRV-MassChange</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
	<meta name="CODE_LANGUAGE" content="C#" />
	<meta name="vs_defaultClientScript" content="JavaScript" />
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
	<link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
     <script src="../../js/Script.js" type="text/javascript"></script>
	<base target="_self" />
	<meta http-equiv="Pragma" content="no-cache" />
</head>
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <br />
            <td align="left" valign="top">
                &nbsp;
                <%--<asp:ImageButton ID="UpdateBtn" runat="server" ImageUrl="../../Image/Update.png"
                    BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"  OnClick="UpdateBtn_Click" />--%>
                 <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                <%--<asp:ImageButton ID="CancelBtn" runat="server" ImageUrl="../../Image/Cancel.png"
                    BackColor="Transparent" BorderWidth="0" Style="z-index: 0" CausesValidation="false" ImageAlign="AbsMiddle"  OnClick="CancelBtn_Click" />--%>
                 <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel"  CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            </td>
            <td align="right">
                &nbsp;&nbsp;<asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;
            </td>
        </tr>
    </table>
    <div id="div1" style="width: 100%; height: 100%">
    &nbsp;<telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Width="100%" Height="86%"
        OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" AllowPaging="false" 
        AllowSorting="true" Skin="Office2007" AllowAutomaticInserts="True">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
            <Selecting AllowRowSelect="true"></Selecting>
            <Scrolling UseStaticHeaders="true"/>
        </ClientSettings>    
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid"
            EditMode="InPlace" HierarchyLoadMode="Client">
            <Columns>
                <telerik:GridBoundColumn HeaderText="acid" DataField="acid" AllowFiltering="true" UniqueName="acid" 
                   Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="skugrpId" DataField="skugrpId" AllowFiltering="true" UniqueName="skugrpId" 
                   Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="SRVNo"
                    UniqueName="id" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU"
                    UniqueName="skucode" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Descr"
                    UniqueName="skudescr" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="SerialNo"
                    UniqueName="lot4"  Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="uom" SortExpression="uom" HeaderText="UOM"
                    UniqueName="uom" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="uomqty" SortExpression="uomqty" HeaderText="Quantity"
                    UniqueName="uomqty" Reorderable="true" DataFormatString="{0:0.###}">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderText="id" HeaderStyle-HorizontalAlign="Center"
                    AllowFiltering="false" UniqueName="id" Display="false">
                    <ItemTemplate>
                        <asp:Label ID="idLbl" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id")%>' />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn HeaderText="SuggestLoc" HeaderStyle-HorizontalAlign="Center"
                    ItemStyle-HorizontalAlign="Left" AllowFiltering="false" ItemStyle-Wrap="False" SortExpression="paloccode" AllowSorting="false">
                     <HeaderTemplate>
                        SuggestLoc
                        <br />
                        <a id="lnkmassSuggestLoc" onserverclick="Control_Fill" runat="server">SameSuggestLoc</a>
                    </HeaderTemplate>
                    <ItemTemplate>
                         <table cellpadding="0" cellspacing="0">                        
                            <tr>                              
                                <td>
                        <telerik:RadTextBox ID="paloccodetxt" runat="server" Width="150" Skin="WebBlue"
                            Text='<%# DataBinder.Eval(Container.DataItem, "paloccode") %>'></telerik:RadTextBox>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                 <telerik:GridTemplateColumn HeaderText="PALocCode" HeaderStyle-HorizontalAlign="Center"
                    Display="false">
                    <ItemTemplate>
                        <asp:Label ID="paLocCodeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "paloccode") %>'></asp:Label>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="Tuno1"
                    UniqueName="tuno1" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderText="lot2" HeaderStyle-HorizontalAlign="Center"
                    AllowFiltering="false" UniqueName="lot2l" Display="false">
                    <ItemTemplate>
                        <asp:Label ID="lot2Lbl" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot2")%>' />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>

                <telerik:GridTemplateColumn Reorderable="true" UniqueName="lot2" HeaderText="ProductionDate"
                    SortExpression="lot2" ItemStyle-Wrap="False" AllowSorting="false">
                      <HeaderTemplate>
                       ProductionDate
                        <br />
                        <a id="lnkmassProductionDate" onserverclick="Control_Fill" runat="server">SameProductionDate</a>
                    </HeaderTemplate>
                    <ItemTemplate>
                         <table cellpadding="0" cellspacing="0">                        
                            <tr>                              
                                <td>
                        <telerik:RadDatePicker ID="lot2DatePicker" calendar-rangemaxdate='<%# DateTime.Today %>'
                            runat="server" DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy"
                            Skin="WebBlue">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDatePicker>
                           </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>

                <telerik:GridTemplateColumn HeaderText="lot3" HeaderStyle-HorizontalAlign="Center"
                    AllowFiltering="false" UniqueName="lot3l" Display="false">
                    <ItemTemplate>
                        <asp:Label ID="lot3Lbl" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "lot3")%>' />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>

                <telerik:GridTemplateColumn Reorderable="true" UniqueName="lot3" HeaderText="MtnDate"
                    SortExpression="lot3" ItemStyle-Wrap="False" AllowSorting="false">
                     <HeaderTemplate>
                       MtnDate
                        <br />
                        <a id="lnkmassMtnDate" onserverclick="Control_Fill" runat="server">SameMtnDate</a>
                    </HeaderTemplate>
                    <ItemTemplate>
                         <table cellpadding="0" cellspacing="0">                        
                            <tr>                              
                                <td>
                        <telerik:RadDatePicker ID="lot3DatePicker" runat="server" DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy"
                            Skin="WebBlue">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                </SpecialDays>
                            </Calendar>
                        </telerik:RadDatePicker>
                                     </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>

               


                <telerik:GridTemplateColumn HeaderText="ReturnFlag" HeaderStyle-HorizontalAlign="Center"
                    AllowFiltering="false" UniqueName="lot7" ItemStyle-Wrap="False" SortExpression="lot7" AllowSorting="false">
                     <HeaderTemplate>
                        ReturnFlag
                        <br />
                        <a id="lnkmassReturnFlag" onserverclick="Control_Fill" runat="server">SameReturnFlag</a>
                    </HeaderTemplate>
                    <ItemTemplate>
                         <table cellpadding="0" cellspacing="0">                        
                            <tr>                              
                                <td>
                        <telerik:RadTextBox ID="lot7Txt" runat="server" Width="150" Skin="WebBlue"
                            Text='<%# DataBinder.Eval(Container.DataItem, "lot7") %>'></telerik:RadTextBox>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </telerik:GridTemplateColumn> 


                
               
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </div>
         <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxtoolkit:modalpopupextender id="mpeMessagePopup" runat="server" popupcontrolid="pnlMessageBox"
        targetcontrolid="btnMessagePopupTargetButton" okcontrolid="btnOk" cancelcontrolid="btnCancel"
        backgroundcssclass="MessageBoxPopupBackground">
    </ajaxtoolkit:modalpopupextender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;">
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
                                <asp:LinkButton ID="btnOk" runat="server" Style="text-decoration: none;">OK</asp:LinkButton>
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
