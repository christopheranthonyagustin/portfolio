<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookaBusForm.aspx.cs" Inherits="iWMS.Web.BusManagement.BookaBus.BookaBusForm" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>BookaBusForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>

    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" OnTabClick="RadTabStrip_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="BusBookedTab" Text="BusBooked" Value="50" runat="server" Visible="false">
                </telerik:RadTab>
                <telerik:RadTab Id="RideTab" Text="Rides" Value="75" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="BillableTab" Text="Billable" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attc" Value="150" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="LogTab" Text="Log" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="CommsTab" Text="Comms" Value="250" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td><br />
                    <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td>
                    <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabelBig"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table width="90%">
                    <tr>
                        <td>
                            <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update"
                                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            <br />
                            <br />
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </td>
                        <td valign="top" align="right">
                            <asp:PlaceHolder ID="JBHID_QRCode" runat="server" />
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            
                
                <telerik:RadPageView runat="server" Height="700px" ID="RadPageView1">
                <br />
                <asp:Panel ID="NewBusBtnPanel" runat="server">
                    <asp:Button ID="NewBusBtn" runat="server" CssClass="white" Text="NewBus" CausesValidation="false"
                        OnClick="NewBusBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="NewRideBtn" runat="server" CssClass="white" Text="NewRide" ValidationGroup="reqvalgrp"
                        OnClick="NewRideBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="AlternativeBtn" runat="server" CssClass="white" Text="Alternative"
                        OnClick="AlternativeBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="OpenBtn" runat="server" CssClass="white" OnClick="OpenBtn_Click"
                        Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                    <asp:Button ID="AssignBtn" runat="server" CssClass="white" OnClick="AssignBtn_Click"
                        Text="Assigned" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                    <asp:Button ID="CompletedBtn" runat="server" CssClass="white" OnClick="CompletedBtn_Click"
                        Text="Completed" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <br />
                </asp:Panel>
                <asp:Panel ID="DetlPanel" runat="server">
                    <asp:Button ID="AddBtn" runat="server" CssClass="white" Text="Add"
                        OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />

                    <asp:Button ID="DetailUpdate" runat="server" CssClass="white" Text="Update"
                        OnClick="DetailUpdate_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <asp:Button ID="CancelBtn" runat="server" CssClass="white" Text="Cancel"
                        OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                    <br />
                    &nbsp;<asp:Label ID="lblProcessID" runat="server" Visible="False" />
                    <br />
                    <br />
                    <telerik:RadGrid ID="ResultDG2" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false" Width="120px"
                        AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG2_NeedDataSource">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn HeaderText="BillSizeType">
                                    <ItemTemplate>
                                        <asp:Label ID="BillSizeTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "descr") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="BillSizeTypeItem" Display="false">
                                    <ItemTemplate>
                                        <asp:Label ID="BillSizeTypeItem" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "item") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="BillOption1" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <telerik:RadDropDownList ID="BillOption1DDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                            DataValueField="Item" DataSource='<%# BillOption1DS%>' Skin="Sunset" Width="140px"
                                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillOption1DS,DataBinder.Eval(Container.DataItem, "item").ToString())%>'
                                            DropDownWidth="140px">
                                        </telerik:RadDropDownList>
                                        <asp:RequiredFieldValidator ID="BillOption1DDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="BillOption1DDL" ErrorMessage="*" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Units" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                    <ItemTemplate>
                                        <telerik:RadTextBox ID="UnitsTxt" runat="server" Width="100" Skin="WebBlue"></telerik:RadTextBox>
                                        <asp:CompareValidator ID="UnitsTxtCompVal" runat="server" ControlToValidate="UnitsTxt"
                                            EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Integer" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="From" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                    <ItemTemplate>
                                        <telerik:RadDatePicker ID="FromDateTxt" runat="server" Width="155"
                                            DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007">
                                            <Calendar runat="server">
                                                <SpecialDays>
                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                </SpecialDays>
                                            </Calendar>
                                        </telerik:RadDatePicker>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="To" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" AllowFiltering="false">
                                    <ItemTemplate>
                                        <telerik:RadDatePicker ID="ToDateTxt" runat="server" Width="155"
                                            DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007">
                                            <Calendar runat="server">
                                                <SpecialDays>
                                                    <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                </SpecialDays>
                                            </Calendar>
                                        </telerik:RadDatePicker>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>
                <br />
                <asp:Panel ID="NewRidePanel" runat="server">
                    <asp:Button ID="AddNewRideBtn" runat="server" CssClass="white" Text="Add"
                        OnClick="AddNewRideBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <asp:Button ID="CancelNewRide" runat="server" CssClass="white" Text="Cancel"
                        OnClick="NewRideCancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl3" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight" 
                            AllowMultiRowSelection="true" OnNeedDataSource="ResultDG_NeedDataSource" OnDetailTableDataBind="ResultDG_DetailTableDataBind"
                            OnItemDataBound="ResultDG_ItemDataBound" OnItemCommand="ResultDG_ItemCommand" ShowGroupPanel="true"
                            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnCancelCommand="ResultDG_Cancel"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" AllowAutomaticInserts="True">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <HeaderStyle Wrap="false" />
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBCId" Name="ParentGrid" 
                                EditMode="InPlace" HierarchyLoadMode="Client" HierarchyDefaultExpanded="true">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="50px" HeaderStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                            &nbsp; &nbsp; 
                                                <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                                    Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                                    BorderWidth="0"></asp:ImageButton>
                                               &nbsp; &nbsp; 
                                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="DelTrip"
                                                        ImageUrl="../../image/Deleted.png" Width="15" Height="15" AlternateText="DeleteTrip"
                                                        CommandName="DeleteTrip" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="ParentUpdate" ImageUrl="../../image/floppy.gif"
                                                Width="15" Height="15" AlternateText="Update" CommandName="ParentUpdate" BackColor="Transparent"
                                                BorderWidth="0"></asp:ImageButton>
                                            &nbsp; &nbsp; 
                                            <asp:ImageButton runat="server" Visible="True" ID="ParentCancel" ImageUrl="../../image/arrow6.gif"
                                                Width="15" Height="15" AlternateText="Cancel" CommandName="ParentCancel" BackColor="Transparent"
                                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                            <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="sno" HeaderText="S/No <br/> BusBookingId" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" HeaderStyle-Width="100px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:} <br/> {1:}", Container.ItemIndex+1, Eval("JBCId")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <%# string.Format("{0:} <br/> {1:}", Container.ItemIndex+1, Eval("JBCId")) %>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="BookedFrom" UniqueName="BookedFrom" ItemStyle-Width="160px" HeaderStyle-Width="100px"  ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Larger">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("BookedFrDate")) %>
                                            &nbsp; &nbsp; 
                                            <%# string.Format("{0:}",Eval("BookedFrDOW")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDatePicker ID="BookedFromDatePicker" Width="115px" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "BookedFrDate")  %>'
                                                DateInput-DateFormat="dd/MMM/yyyy" Skin="Sunset" PopupDirection="TopRight">
                                                <Calendar>
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                            <asp:RequiredFieldValidator ID="BookedFromDatePickerReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="BookedFromDatePicker" ErrorMessage="*" />
                                            <asp:Label runat="server" ID="BookedFrDOWLbl" Width="1px" Text=' <%# DataBinder.Eval(Container.DataItem, "BookedFrDOW")%>' />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="BookedTo" UniqueName="BookedTo" ItemStyle-Width="160px" HeaderStyle-Width="100px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("BookedToDate")) %>
                                            &nbsp; &nbsp; 
                                            <%# string.Format("{0:}",Eval("BookedToDOW")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDatePicker ID="BookedToDatePicker" Width="115px" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "BookedToDate")  %>'
                                                DateInput-DateFormat="dd/MMM/yyyy" Skin="Sunset" PopupDirection="TopRight">
                                                <Calendar>
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                            <asp:RequiredFieldValidator ID="BookedToDatePickerReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="BookedToDatePicker" ErrorMessage="*" />
                                            <asp:Label runat="server" ID="BookedToDOWLbl" Width="1px" Text=' <%# DataBinder.Eval(Container.DataItem, "BookedToDOW")%>' />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Bill" HeaderText="BillSizeType <br/> BillOption1" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px" ItemStyle-Font-Size="Larger" ItemStyle-Font-Bold="true">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("billsizetypedescr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("billoption1descr")) %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="BillSizeTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BillSizeTypeDS%>' Skin="Sunset" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillSizeTypeDS,DataBinder.Eval(Container.DataItem, "billsizetype").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="BillSizeTypeDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="BillSizeTypeDDL" ErrorMessage="*" />
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="BillOption1DDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BillOption1DS%>' Skin="Sunset" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillOption1DS,DataBinder.Eval(Container.DataItem, "billoption1").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="BillOption1DDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="BillOption1DDL" ErrorMessage="*" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="BusDescription" DataField="BusDescription" ItemStyle-HorizontalAlign="Center"
                                        AllowFiltering="true" SortExpression="BusDescription" HeaderStyle-Width="50%"
                                        UniqueName="BusDescription" Reorderable="true" ItemStyle-CssClass="break-word">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("BusDescription")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="BusDescriptionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "BusDescription") %>'
                                                TextMode="MultiLine" Enabled="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="SpecialInstruction" DataField="SpecialInstructions" ItemStyle-HorizontalAlign="Center"
                                        AllowFiltering="true" SortExpression="SpecialInstructions" HeaderStyle-Width="60%"
                                        UniqueName="SpecialInstructions" Reorderable="true" ItemStyle-CssClass="break-word">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("SpecialInstructions")) %>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="SpecialInstructionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "SpecialInstructions") %>'
                                                TextMode="MultiLine" Enabled="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" Display="False">
                                    </telerik:GridBoundColumn>
                                </Columns>
                                <DetailTables>
                                    <telerik:GridTableView DataKeyNames="JBTripId" Name="ChildGrid" SkinID="Telerik" BorderColor="White" BorderWidth="15px" BorderStyle="Solid"
                                        HeaderStyle-HorizontalAlign="Center" CommandItemDisplay="None" EditMode="InPlace" RetainExpandStateOnRebind="true" 
                                        InsertItemDisplay="Bottom" AllowAutomaticInserts="true">
                                        <ParentTableRelation>
                                            <telerik:GridRelationFields DetailKeyField="JBCtnrId" MasterKeyField="JBCId" />
                                        </ParentTableRelation>  
                                        <ItemStyle CssClass="DGItem" Wrap="true"></ItemStyle>                                      
                                        <Columns>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="100px" ItemStyle-Width="50px">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                                    &nbsp; &nbsp; 
                                                <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                                    Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                                    BorderWidth="0"></asp:ImageButton>
                                                    &nbsp; &nbsp; 
                                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="DelRide"
                                                        ImageUrl="../../image/Deleted.png" Width="15" Height="15" AlternateText="Delete"
                                                        CommandName="DeleteRide" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:ImageButton runat="server" Visible="True" ID="DetailUpdate" ImageUrl="../../image/floppy.gif"
                                                        Width="15" Height="15" AlternateText="Update" CommandName="DetailUpdate" BackColor="Transparent"
                                                        BorderWidth="0"></asp:ImageButton>
                                                    &nbsp; &nbsp; 
                                                    <asp:ImageButton runat="server" Visible="True" ID="DetailCancel" ImageUrl="../../image/arrow6.gif"
                                                        Width="15" Height="15" AlternateText="Cancel" CommandName="DetailCancel" BackColor="Transparent"
                                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                                    <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="35px">
                                                <ItemTemplate>
                                                    <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.JBTripId")%>' onserverclick="CopyRide_Click"
                                                        runat="server">
                                                        <img id="copyImg" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy"
                                                            title="Copy" runat="server" />
                                                    </a>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="35px">
                                                <ItemStyle Wrap="False"></ItemStyle>
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" Visible="false" ImageAlign="AbsMiddle" ID="SMSIcon" Enabled="false"
                                                        ImageUrl="../../image/SMS.png" Width="18" Height="18" AlternateText="SMSicon"
                                                        BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <asp:ImageButton runat="server" Visible="false" ImageAlign="AbsMiddle" ID="EmailIcon" Enabled="false"
                                                        ImageUrl="../../image/Email.png" Width="18" Height="18" AlternateText="Emailicon"
                                                        BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="100px" ItemStyle-Width="50px">
                                                <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                                <HeaderTemplate>
                                                    TripNo
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <%#Container.ItemIndex+1%>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="AltPerId" UniqueName="AltPerId" Display="False" />
                                            <telerik:GridBoundColumn DataField="AltPerName" UniqueName="AltPerName" Display="False" />
                                            <telerik:GridBoundColumn DataField="AltVehNo" UniqueName="AltVehNo" Display="False" />
                                            <telerik:GridBoundColumn DataField="AltPerMobileNo" UniqueName="AltPerMobileNo" Display="False" />
                                            <telerik:GridBoundColumn DataField="AltRemarks" UniqueName="AltRemarks" Display="False" />
                                            <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="jbctnrid" UniqueName="jbctnrid" SortExpression="jbctnrid" HeaderText="jbctnrid"
                                                Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn UniqueName="BookingDateTime" HeaderText="Booking DateTime">
                                                <ItemTemplate>
                                                    <%# string.Format("{0:dd/MMM/yyyy}",Eval("TripFrDate")) %>
                                                    <br />
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("TripFrExpDOW")) %>
                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                <%# string.Format("{0:}",Eval("TripToExpDOW")) %>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("TripFrTime")) %>
                                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                             <%# string.Format("{0:}",Eval("TripToExpTime")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <br />
                                                    <telerik:RadDatePicker ID="StartDatePicker" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "TripFrDate") != null && !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "TripFrDate").ToString()) ? DataBinder.Eval(Container.DataItem, "TripFrDate") : DateTime.Now %>'
                                                        DateInput-DateFormat="dd/MMM/yyyy" Skin="Sunset" PopupDirection="TopRight">
                                                        <Calendar runat="server">
                                                            <SpecialDays>
                                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                            </SpecialDays>
                                                        </Calendar>
                                                    </telerik:RadDatePicker>
                                                    <br />
                                                    <asp:Label runat="server" ID="TripFrDOWLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "TripFrExpDOW")%>' />
                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                    <asp:Label runat="server" ID="TripToDOWLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "TripToExpDOW")%>' />
                                                    <br />
                                                    <telerik:RadDropDownList ID="TripFrTimeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                        DataValueField="Item" DataSource='<%# BookedTimeDS%>' Skin="Sunset" Width="75px"
                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BookedTimeDS,DataBinder.Eval(Container.DataItem, "TripFrTime").ToString())%>'
                                                        DropDownWidth="70px">
                                                    </telerik:RadDropDownList>
                                                    <asp:RequiredFieldValidator ID="TripFrTimeDDLReqVal" runat="server"
                                                        ControlToValidate="TripFrTimeDDL" ErrorMessage="*" ForeColor="Red" />
                                                    <telerik:RadDropDownList ID="TripToTimeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                        DataValueField="Item" DataSource='<%# BookedTimeDS%>' Skin="Sunset" Width="75px"
                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BookedTimeDS,DataBinder.Eval(Container.DataItem, "TripToExpTime").ToString())%>'
                                                        DropDownWidth="70px">
                                                    </telerik:RadDropDownList>
                                                    <asp:RequiredFieldValidator ID="TripToTimeDDLReqVal" runat="server"
                                                        ControlToValidate="TripToTimeDDL" ErrorMessage="*" ForeColor="Red" />
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="Vehicle" HeaderText="Vehicle <br/> Driver">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("VehNo")) %>
                                                    <br />
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("Name")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="VehicleList" runat="server" DataTextField="descr" DataValueField="item"
                                                        DataSource='<%# vehListDS%>' Skin="WebBlue" Width="150px"
                                                        DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(vehListDS,DataBinder.Eval(Container.DataItem, "VehNo").ToString())%>'
                                                        OnSelectedIndexChanged="VehicleSelectedIndex_Changed" AutoPostBack="true">
                                                    </telerik:RadComboBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadComboBox ID="DriverList" runat="server" DataTextField="descr" DataValueField="item"
                                                        DataSource='<%# driverListDS%>' Skin="WebBlue" Width="150px"
                                                        DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(driverListDS,DataBinder.Eval(Container.DataItem, "PerId").ToString())%>'>
                                                    </telerik:RadComboBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("FrServicePtDescr")) %>
                                                    <br />
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("FrAddr")) %>
                                                    <br />
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("FrPostalCode")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="FrServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                                        DataSource='<%# ServicePtDS%>' Skin="WebBlue" Width="150px" AllowCustomText="true" Enabled="true"
                                                        DropDownWidth="150px" RenderMode="Lightweight" Filter="Contains" CausesValidation="false"
                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "FrServicePt").ToString())%>'
                                                        OnSelectedIndexChanged="PickpDropOff_SelectedIndex_Changed" AutoPostBack="true">
                                                    </telerik:RadComboBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="FrAddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "FrAddr") %>'
                                                        TextMode="MultiLine" Enabled="true">
                                                    </telerik:RadTextBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="FrPostalCodeTxt" OnTextChanged="FrPostalCodeTxt_TextChanged" AutoPostBack="true" Text='<%# DataBinder.Eval(Container.DataItem, "FrPostalCode") %>'
                                                        TextMode="SingleLine" Enabled="true">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("ToServicePtDescr")) %>
                                                    <br />
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("ToAddr")) %>
                                                    <br />
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("ToPostalCode")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="ToServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                                        DataSource='<%# ServicePtDS%>' Skin="WebBlue" Width="150px" AllowCustomText="true" Enabled="true"
                                                        DropDownWidth="150px" RenderMode="Lightweight" Filter="Contains" CausesValidation="false"
                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "ToServicePt").ToString())%>'
                                                        OnSelectedIndexChanged="PickpDropOff_SelectedIndex_Changed" AutoPostBack="true">
                                                    </telerik:RadComboBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="ToAddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ToAddr") %>'
                                                        TextMode="MultiLine" Enabled="true">
                                                    </telerik:RadTextBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="ToPostalCodeTxt" OnTextChanged="ToPostalCodeTxt_TextChanged" AutoPostBack="true" Text='<%# DataBinder.Eval(Container.DataItem, "ToPostalCode") %>'
                                                        TextMode="SingleLine" Enabled="true">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="TourGuide" HeaderText="TourGuide <br/> MobileNo" ItemStyle-VerticalAlign="NotSet">
                                                <HeaderTemplate>
                                                    TourGuide
                                                    <br />
                                                    MobileNo
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <a id="tourguide" onserverclick="Auto_Fill" runat="server">AutoFill</a>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("TourGuideName")) %>
                                                    <br />
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("TourGuideContactNo")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadComboBox ID="TourGuideList" runat="server" DataTextField="descr" DataValueField="item"
                                                        DataSource='<%# TourGuideDS%>' Skin="WebBlue" Width="150px" AllowCustomText="true" Enabled="true"
                                                        DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains" OnSelectedIndexChanged="TourGuideSelectedIndex_Changed"
                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TourGuideDS,DataBinder.Eval(Container.DataItem, "TourGuideName").ToString())%>'
                                                        AutoPostBack="true">
                                                    </telerik:RadComboBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="ContactNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TourGuideContactNo") %>'
                                                        TextMode="SingleLine" Enabled="true" Width="150px">
                                                    </telerik:RadTextBox>
                                                    <telerik:RadTextBox runat="server" ID="TourGuideNameTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TourGuideName") %>'
                                                        Display="false">
                                                    </telerik:RadTextBox>
                                                    <telerik:RadTextBox runat="server" ID="acIdTxt" Text='<%# DataBinder.Eval(Container.DataItem, "acId") %>'
                                                        Display="false">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="TripDescr" HeaderText="TripDescription <br/> SpecialInstruction">
                                                <ItemTemplate>
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("TripDescr")) %>
                                                    <br />
                                                    <br />
                                                    <%# string.Format("{0:}",Eval("TripSpecialInstruction")) %>
                                                    <br />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="TripDescriptionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TripDescr") %>'
                                                        TextMode="MultiLine" Enabled="true">
                                                    </telerik:RadTextBox>
                                                    <br />
                                                    <br />
                                                    <telerik:RadTextBox runat="server" ID="TripSpecialInstructionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction") %>'
                                                        TextMode="MultiLine" Enabled="true">
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="False">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False" />
                                            <telerik:GridBoundColumn DataField="perid" UniqueName="perid" Display="False" />
                                            <telerik:GridBoundColumn DataField="SMSDetected" UniqueName="SMSDetected" Display="False" />
                                            <telerik:GridBoundColumn DataField="EmailDetected" UniqueName="EmailDetected" Display="False" />
                                            <telerik:GridBoundColumn DataField="TourGuideName" UniqueName="TourGuideName" Display="False" />
                                        </Columns>
                                    </telerik:GridTableView>
                                </DetailTables>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </telerik:RadPageView>

<%--             <telerik:RadPageView runat="server" Height="700px" ID="RadPageView2">
                <br />
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Button ID="Button2" runat="server" CssClass="white" Text="NewRide" ValidationGroup="reqvalgrp"
                        OnClick="newRidesBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="Button3" runat="server" CssClass="white" Text="Alternative"
                        OnClick="alternativeRidesBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="OpenRidesBtn" runat="server" CssClass="white" OnClick="OpenRidesBtn_Click"
                        Text="Open" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                    <asp:Button ID="AssignRidesBtn" runat="server" CssClass="white" OnClick="AssignRidesBtn_Click"
                        Text="Assigned" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp; 
                    <asp:Button ID="CompletedRidesBtn" runat="server" CssClass="white" OnClick="CompletedRidesBtn_Click"
                        Text="Completed" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <br />
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server">
                    <asp:Button ID="Button7" runat="server" CssClass="white" Text="Add"
                        OnClick="AddBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />

                    <asp:Button ID="Button8" runat="server" CssClass="white" Text="Update"
                        OnClick="DetailUpdate_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <asp:Button ID="Button9" runat="server" CssClass="white" Text="Cancel"
                        OnClick="CancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                    <br />
                    &nbsp;<asp:Label ID="Label1" runat="server" Visible="False" />
                    <br />
                    <br />                    
                </asp:Panel>
                <br />
                <asp:Panel ID="Panel3" runat="server">
                    <asp:Button ID="Button10" runat="server" CssClass="white" Text="Add"
                        OnClick="AddnewRidesBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <asp:Button ID="Button11" runat="server" CssClass="white" Text="Cancel"
                        OnClick="newRidesCancelBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl_Rides" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
                <br />
                <asp:UpdatePanel ID="UpdatePanel3" runat="server"  UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadGrid ID="RadGridRides" runat="server" EnableLinqExpressions="False" Skin="Office2007" RenderMode="Lightweight" 
                            AllowMultiRowSelection="true" OnNeedDataSource="RadGridRides_NeedDataSource" 
                            OnItemDataBound="RadGridRides_ItemDataBound" OnItemCommand="RadGridRides_ItemCommand" OnCancelCommand="RadGridRides_Cancel"
                            ExportSettings-UseItemStyles="true" AutoGenerateColumns="false" AllowAutomaticInserts="True">
                            <AlternatingItemStyle CssClass="DGAlternateItem" Wrap="false"></AlternatingItemStyle>
                            <ItemStyle CssClass="DGItem" Wrap="false"></ItemStyle>
                            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                            <HeaderStyle Wrap="false" />
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="JBTripId" Name="ParentGrid" EditMode="InPlace">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="100px" ItemStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />
                                            &nbsp; &nbsp; 
                                        <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                            Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                            BorderWidth="0"></asp:ImageButton>
                                            &nbsp; &nbsp; 
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="DelRide"
                                                ImageUrl="../../image/Deleted.png" Width="15" Height="15" AlternateText="Delete"
                                                CommandName="DeleteRide" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ID="DetailUpdate" ImageUrl="../../image/floppy.gif"
                                                Width="15" Height="15" AlternateText="Update" CommandName="DetailUpdate" BackColor="Transparent"
                                                BorderWidth="0"></asp:ImageButton>
                                            &nbsp; &nbsp; 
                                            <asp:ImageButton runat="server" Visible="True" ID="DetailCancel" ImageUrl="../../image/arrow6.gif"
                                                Width="15" Height="15" AlternateText="Cancel" CommandName="DetailCancel" BackColor="Transparent"
                                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                            <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width="35px">
                                        <ItemTemplate>
                                            <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.JBTripId")%>' onserverclick="CopyRide_Click"
                                                runat="server">
                                                <img id="copyImg" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy"
                                                    title="Copy" runat="server" />
                                            </a>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="35px">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="false" ImageAlign="AbsMiddle" ID="SMSIcon" Enabled="false"
                                                ImageUrl="../../image/SMS.png" Width="18" Height="18" AlternateText="SMSicon"
                                                BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                            <br />
                                            <br />
                                            <br />
                                            <asp:ImageButton runat="server" Visible="false" ImageAlign="AbsMiddle" ID="EmailIcon" Enabled="false"
                                                ImageUrl="../../image/Email.png" Width="18" Height="18" AlternateText="Emailicon"
                                                BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="100px" ItemStyle-Width="50px">
                                        <ItemStyle HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                        <HeaderTemplate>
                                            TripNo
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="AltPerId" UniqueName="AltPerId" Display="False" />
                                    <telerik:GridBoundColumn DataField="AltPerName" UniqueName="AltPerName" Display="False" />
                                    <telerik:GridBoundColumn DataField="AltVehNo" UniqueName="AltVehNo" Display="False" />
                                    <telerik:GridBoundColumn DataField="AltPerMobileNo" UniqueName="AltPerMobileNo" Display="False" />
                                    <telerik:GridBoundColumn DataField="AltRemarks" UniqueName="AltRemarks" Display="False" />
                                    <telerik:GridBoundColumn DataField="JBTripId" UniqueName="JBTripId" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="jbctnrid" UniqueName="jbctnrid" SortExpression="jbctnrid" HeaderText="jbctnrid"
                                        Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn UniqueName="Bill" HeaderText="BillSizeType <br/> BillOption1" HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px" ItemStyle-Font-Size="Larger" ItemStyle-Font-Bold="true">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("billsizetypedescr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("billoption1descr")) %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadDropDownList ID="BillSizeTypeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BillSizeTypeDS%>' Skin="Sunset" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillSizeTypeDS,DataBinder.Eval(Container.DataItem, "billsizetype").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="BillSizeTypeDDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="BillSizeTypeDDL" ErrorMessage="*" />
                                            <br />
                                            <br />
                                            <telerik:RadDropDownList ID="BillOption1DDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BillOption1DS%>' Skin="Sunset" Width="140px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BillOption1DS,DataBinder.Eval(Container.DataItem, "billoption1").ToString())%>'
                                                DropDownWidth="140px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="BillOption1DDLReqVal" runat="server" ValidationGroup="reqvalgrp" ControlToValidate="BillOption1DDL" ErrorMessage="*" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="BookingDateTime" HeaderText="Booking DateTime">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy}",Eval("TripFrDate")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("TripFrExpDOW")) %>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        <%# string.Format("{0:}",Eval("TripToExpDOW")) %>
                                            <br />
                                            <%# string.Format("{0:}",Eval("TripFrTime")) %>
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        <%# string.Format("{0:}",Eval("TripToExpTime")) %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <br />
                                            <telerik:RadDatePicker ID="StartDatePicker" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "TripFrDate") != null && !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "TripFrDate").ToString()) ? DataBinder.Eval(Container.DataItem, "TripFrDate") : DateTime.Now %>'
                                                DateInput-DateFormat="dd/MMM/yyyy" Skin="Sunset" PopupDirection="TopRight">
                                                <Calendar runat="server">
                                                    <SpecialDays>
                                                        <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                    </SpecialDays>
                                                </Calendar>
                                            </telerik:RadDatePicker>
                                            <br />
                                            <asp:Label runat="server" ID="TripFrDOWLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "TripFrExpDOW")%>' />
                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    <asp:Label runat="server" ID="TripToDOWLbl" Text=' <%# DataBinder.Eval(Container.DataItem, "TripToExpDOW")%>' />
                                            <br />
                                            <telerik:RadDropDownList ID="TripFrTimeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BookedTimeDS%>' Skin="Sunset" Width="75px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BookedTimeDS,DataBinder.Eval(Container.DataItem, "TripFrTime").ToString())%>'
                                                DropDownWidth="70px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="TripFrTimeDDLReqVal" runat="server"
                                                ControlToValidate="TripFrTimeDDL" ErrorMessage="*" ForeColor="Red" />
                                            <telerik:RadDropDownList ID="TripToTimeDDL" runat="server" DataTextField="descr" ExpandDirection="Up"
                                                DataValueField="Item" DataSource='<%# BookedTimeDS%>' Skin="Sunset" Width="75px"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BookedTimeDS,DataBinder.Eval(Container.DataItem, "TripToExpTime").ToString())%>'
                                                DropDownWidth="70px">
                                            </telerik:RadDropDownList>
                                            <asp:RequiredFieldValidator ID="TripToTimeDDLReqVal" runat="server"
                                                ControlToValidate="TripToTimeDDL" ErrorMessage="*" ForeColor="Red" />
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Vehicle" HeaderText="Vehicle <br/> Driver">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("VehNo")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("Name")) %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="VehicleList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# vehListDS%>' Skin="WebBlue" Width="150px"
                                                DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(vehListDS,DataBinder.Eval(Container.DataItem, "VehNo").ToString())%>'
                                                OnSelectedIndexChanged="VehicleSelectedIndex_Changed" AutoPostBack="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadComboBox ID="DriverList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# driverListDS%>' Skin="WebBlue" Width="150px"
                                                DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(driverListDS,DataBinder.Eval(Container.DataItem, "PerId").ToString())%>'>
                                            </telerik:RadComboBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="PickUp" HeaderText="PickUp">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("FrServicePt")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("FrAddr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("FrPostalCode")) %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="FrServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# ServicePtDS%>' Skin="WebBlue" Width="150px" AllowCustomText="true" Enabled="true"
                                                DropDownWidth="150px" RenderMode="Lightweight" Filter="Contains" CausesValidation="false"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "FrServicePt").ToString())%>'
                                                OnSelectedIndexChanged="PickpDropOff_SelectedIndex_Changed" AutoPostBack="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="FrAddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "FrAddr") %>'
                                                TextMode="MultiLine" Enabled="true">
                                            </telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="FrPostalCodeTxt" OnTextChanged="FrPostalCodeTxt_TextChanged" AutoPostBack="true" Text='<%# DataBinder.Eval(Container.DataItem, "FrPostalCode") %>'
                                                TextMode="SingleLine" Enabled="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="DropOff" HeaderText="DropOff">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("ToServicePt")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("ToAddr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("ToPostalCode")) %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="ToServicePtList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# ServicePtDS%>' Skin="WebBlue" Width="150px" AllowCustomText="true" Enabled="true"
                                                DropDownWidth="150px" RenderMode="Lightweight" Filter="Contains" CausesValidation="false"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ServicePtDS,DataBinder.Eval(Container.DataItem, "ToServicePt").ToString())%>'
                                                OnSelectedIndexChanged="PickpDropOff_SelectedIndex_Changed" AutoPostBack="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="ToAddrTxt" Text='<%# DataBinder.Eval(Container.DataItem, "ToAddr") %>'
                                                TextMode="MultiLine" Enabled="true">
                                            </telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="ToPostalCodeTxt" OnTextChanged="ToPostalCodeTxt_TextChanged" AutoPostBack="true" Text='<%# DataBinder.Eval(Container.DataItem, "ToPostalCode") %>'
                                                TextMode="SingleLine" Enabled="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TourGuide" HeaderText="TourGuide <br/> MobileNo" ItemStyle-VerticalAlign="NotSet">
                                        <HeaderTemplate>
                                            TourGuide
                                            <br />
                                            MobileNo
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a id="tourguide" onserverclick="Auto_Fill" runat="server">AutoFill</a>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("TourGuideName")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("TourGuideContactNo")) %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadComboBox ID="TourGuideList" runat="server" DataTextField="descr" DataValueField="item"
                                                DataSource='<%# TourGuideDS%>' Skin="WebBlue" Width="150px" AllowCustomText="true" Enabled="true"
                                                DropDownWidth="150px" RenderMode="Lightweight" CausesValidation="false" Filter="Contains" OnSelectedIndexChanged="TourGuideSelectedIndex_Changed"
                                                SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TourGuideDS,DataBinder.Eval(Container.DataItem, "TourGuideName").ToString())%>'
                                                AutoPostBack="true">
                                            </telerik:RadComboBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="ContactNoTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TourGuideContactNo") %>'
                                                TextMode="SingleLine" Enabled="true" Width="150px">
                                            </telerik:RadTextBox>
                                            <telerik:RadTextBox runat="server" ID="TourGuideNameTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TourGuideName") %>'
                                                Display="false">
                                            </telerik:RadTextBox>
                                            <telerik:RadTextBox runat="server" ID="acIdTxt" Text='<%# DataBinder.Eval(Container.DataItem, "acId") %>'
                                                Display="false">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="TripDescr" HeaderText="TripDescription <br/> SpecialInstruction">
                                        <ItemTemplate>
                                            <br />
                                            <%# string.Format("{0:}",Eval("TripDescr")) %>
                                            <br />
                                            <br />
                                            <%# string.Format("{0:}",Eval("TripSpecialInstruction")) %>
                                            <br />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <telerik:RadTextBox runat="server" ID="TripDescriptionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TripDescr") %>'
                                                TextMode="MultiLine" Enabled="true">
                                            </telerik:RadTextBox>
                                            <br />
                                            <br />
                                            <telerik:RadTextBox runat="server" ID="TripSpecialInstructionTxt" Text='<%# DataBinder.Eval(Container.DataItem, "TripSpecialInstruction") %>'
                                                TextMode="MultiLine" Enabled="true">
                                            </telerik:RadTextBox>
                                        </EditItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="status" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="vehno" UniqueName="vehno" Display="False" />
                                    <telerik:GridBoundColumn DataField="perid" UniqueName="perid" Display="False" />
                                    <telerik:GridBoundColumn DataField="SMSDetected" UniqueName="SMSDetected" Display="False" />
                                    <telerik:GridBoundColumn DataField="EmailDetected" UniqueName="EmailDetected" Display="False" />
                                    <telerik:GridBoundColumn DataField="TourGuideName" UniqueName="TourGuideName" Display="False" />
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <iWMS:MsgPopup ID="MsgPopup1" runat="server"></iWMS:MsgPopup>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                   </asp:UpdatePanel>
            </telerik:RadPageView>--%>
            <telerik:RadPageView runat="server" Height="700px" ID="RidesRadPageView" />
            <telerik:RadPageView runat="server" Height="70%" ID="ChargeRadPageView" />
            <telerik:RadPageView runat="server" Height="90%" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView"></telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="CommsRadPageView" />
        </telerik:RadMultiPage>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
            DefaultButton="btnOk">
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
                                <asp:Literal runat="server" ID="ltrMsgImge"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
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
        <%--Message popup 2 area start For Confirm Message Box--%>
        <asp:Button runat="server" ID="PopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="ConfrimMessagePopup" runat="server" PopupControlID="ConfrimMessagePanel"
            TargetControlID="PopupTargetButton" BackgroundCssClass="MessageBoxPopupBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="ConfrimMessagePanel" BackColor="White" Width="420"
            Style="display: none; border: 2px solid #780606;" DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="ConfrimMsg" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="ConfirmCancelBtn" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div runat="server" style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table id="ConfirmTb" runat="server" style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal ID="ltrConfirmImge" runat="server"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label ID="popupConfrimMsgType" runat="server" Text=""></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="ConfirmCancel" runat="server" Text="Cancel" />
                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="ConfirmYesBtn" runat="server" Text="  OK  " />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
    </form>
</body>
</html>
