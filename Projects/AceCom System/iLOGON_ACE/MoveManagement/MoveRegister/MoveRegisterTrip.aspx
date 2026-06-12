<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoveRegisterTrip.aspx.cs" Inherits="iWMS.Web.MoveManagement.MoveRegister.MoveRegisterTrip" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Move Register Trip</title>
    <link href="../../css/iWMStelerik.css" type="textfr/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" CausesValidation="false" MultiPageID="RadMultiPage1"
            AutoPostBack="true" SelectedIndex="0" Skin="Office2007">
            <Tabs>
                <telerik:RadTab Text="TripGrid" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" Height="700px" ID="TripRadPageView">
                <br />
                <asp:UpdatePanel ID="OuterUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="NewPanel" runat="server" >
                            <asp:Button ID="NewBtn" runat="server" CssClass="white" OnClick="NewBtn_Click"
                                Text="New" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                        </asp:Panel>
                        <asp:Panel ID="AddPanel" runat="server" >
                            <table id="Table" border="0" cellspacing="1" cellpadding="1" width="100%" runat="server">
                                <tr>
                                    <td colspan="3" align="left">
                                        <asp:Button ID="SaveNextBtn" runat="server" CssClass="white" Text="Save &amp; Next" OnClick="SaveNextBtn_Click"
                                            UseSubmitBehavior="false" OnClientClick="disableBtn(this.id, true)" />
                                        &nbsp;
                                        <asp:Button ID="SaveBtn" runat="server" CssClass="white" Text=" Save " OnClick="SaveBtn_Click" 
                                            UseSubmitBehavior="false" OnClientClick="disableBtn(this.id, true)" />
                                        &nbsp;
                                        <asp:Button ID="ClosePanelBtn" runat="server" CssClass="white" Text="Hide" OnClick="ClosePanelBtn_Click"
                                            UseSubmitBehavior="false" OnClientClick="disableBtn(this.id)" CausesValidation="false" />
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="MessageLbl" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </td>
                                    <td align="right" class="style2"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <iWMS:iForm ID="formCtl_New" runat="server"></iWMS:iForm>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
                            AllowFilteringByColumn="false" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
                            OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnCancelCommand="ResultDG_Cancel" OnItemCommand="ResultDG_ItemCommand" OnDetailTableDataBind="ResultDG_DetailTableDataBind">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" Name="ParentGrid"
                                HierarchyLoadMode="Client">
                                <Columns>
                                    <telerik:GridTemplateColumn HeaderStyle-Width="120px" ItemStyle-Width="120px" Reorderable="false"
                                UniqueName="icon" AllowFiltering="false">
                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                        onserverclick="lnkDelete_ServerClick" runat="server">
                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete JBCTNR"
                                            title="Delete JBCTNR" runat="server" />
                                    </a>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                                        <HeaderTemplate>
                                            S/N
                                        </HeaderTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <%#Container.ItemIndex+1%>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="Date"
                                        DataFormatString="{0:dd/MMM/yyyy HH:mm}" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="fraddr" SortExpression="fraddr" HeaderText="Fraddr"
                                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Toaddr" SortExpression="Toaddr" HeaderText="Toaddr"
                                        ItemStyle-Wrap="False" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="Add user"
                                        ItemStyle-Wrap="False" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="Edit User"
                                        ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="Edit Date"
                                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" ItemStyle-Wrap="False" HeaderStyle-HorizontalAlign="Center">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                                    </telerik:GridBoundColumn>
                                </Columns>
                                <DetailTables>
                                    <telerik:GridTableView DataKeyNames="JBTripId" Name="Child" Width="100%" SkinID="Telerik"
                                        runat="server" EditMode="InPlace">
                                        <ParentTableRelation>
                                            <telerik:GridRelationFields DetailKeyField="jbctnrid" MasterKeyField="id" />
                                        </ParentTableRelation>
                                        <Columns>
                                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Width="30px">
                                                <ItemTemplate>
                                                    <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="EditTripBtn"
                                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                                        CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                                    <a id="InkDelette" href='<%#DataBinder.Eval(Container,"DataItem.JBTripId")%>' onclick="return confirm('Confirm delete?')"
                                                        onserverclick="DeleteJBCtnrTrip" runat="server">
                                                        <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete Trips"
                                                            align="middle" runat="server"></a>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                                        Width="15" Height="15" AlternateText="Update" CommandName="UpdateTrip" BackColor="Transparent"
                                                        BorderWidth="0"></asp:ImageButton>
                                                    <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                                        Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                                        BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                                                </EditItemTemplate>
                                                <ItemStyle Wrap="False"></ItemStyle>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="id" UniqueName="id" SortExpression="id" HeaderText="id" Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="jbcttrid" UniqueName="jbctnrid" SortExpression="jbctnrid" HeaderText="jbctnrid"
                                                Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn HeaderText="FromDateTime">
                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "frexpdate", "{0:dd/MMM/yyyy HH:mm:ss}")%>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDateTimePicker ID="FrdatetxtDatePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm:ss" DateInput-Display="true" Skin="Sunset">
                                                        <Calendar runat="server">
                                                            <SpecialDays>
                                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                            </SpecialDays>
                                                        </Calendar>
                                                    </telerik:RadDateTimePicker>
                                                    <asp:RequiredFieldValidator ID="FrdateReqVal" runat="server" ControlToValidate="FrdatetxtDatePicker"
                                                        ErrorMessage="*" CssClass="errorLabel" />
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn HeaderText="ToDateTime">
                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "ToExpDate", "{0:dd/MMM/yyyy HH:mm:ss}")%>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDateTimePicker ID="TodatetxtDatePicker" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy HH:mm:ss"
                                                        DateInput-DisplayDateFormat="dd/MMM/yyyy HH:mm:ss" DateInput-Display="true" Skin="Sunset">
                                                        <Calendar runat="server">
                                                            <SpecialDays>
                                                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                                                            </SpecialDays>
                                                        </Calendar>
                                                    </telerik:RadDateTimePicker>
                                                    <asp:RequiredFieldValidator ID="TodateReqVal" runat="server" ControlToValidate="TodatetxtDatePicker"
                                                        ErrorMessage="*" CssClass="errorLabel" />
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="TripTypeDescr" HeaderText="TripType">
                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "TripTypeDescr") %>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDropDownList ID="TripTypeDDL" runat="server" Skin="WebBlue" DataSource='<%# TripTypeDS %>' DataTextField="descr" DataValueField="item"
                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TripTypeDS, DataBinder.Eval(Container.DataItem, "TripTypeDescr").ToString())%>'>
                                                    </telerik:RadDropDownList>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="ToPostalCode" HeaderText="Postal Code">
                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                <ItemStyle Wrap="False"></ItemStyle>
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "ToPostalCode")%>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="PostalCodeTxt" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "ToPostalCode") %>'>
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="FrAddr" HeaderText="FromAddress">
                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                <ItemStyle Wrap="False"></ItemStyle>
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "FrAddr")%>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="FrAddressTxt" Skin="WebBlue" TextMode="MultiLine"
                                                        Text='<%# DataBinder.Eval(Container.DataItem, "FrAddr") %>'>
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="ToAddr" HeaderText="ToAddress">
                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                <ItemStyle Wrap="False"></ItemStyle>
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "ToAddr")%>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="ToAddressTxt" Skin="WebBlue" TextMode="MultiLine"
                                                        Text='<%# DataBinder.Eval(Container.DataItem, "ToAddr") %>'>
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn SortExpression="vehno" UniqueName="vehno" HeaderText="Vehicle">
                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "vehnodescr") %>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDropDownList ID="VehicleDDL" runat="server" Skin="WebBlue" DataSource='<%# VehicleDS %>' DataTextField="descr" DataValueField="vehno"
                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(VehicleDS, DataBinder.Eval(Container.DataItem, "vehno").ToString())%>'>
                                                    </telerik:RadDropDownList>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn SortExpression="perid" UniqueName="perid" HeaderText="Driver">
                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "PerName") %>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDropDownList ID="DriverDDL" runat="server" Skin="WebBlue" DataSource='<%# DriverDS %>' DataTextField="name" DataValueField="id"
                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(DriverDS, DataBinder.Eval(Container.DataItem, "PerId").ToString())%>'>
                                                    </telerik:RadDropDownList>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="Remarks" HeaderText="Remarks">
                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                <ItemStyle Wrap="False"></ItemStyle>
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "remarks")%>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadTextBox runat="server" ID="RemarksTxt" Skin="WebBlue" Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'>
                                                    </telerik:RadTextBox>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="statusdescr" HeaderText="Status">
                                                <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                <ItemStyle Wrap="False"></ItemStyle>
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem, "statusdescr")%>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <telerik:RadDropDownList ID="StatusDDL" runat="server" Skin="WebBlue" DataSource='<%# StatusDS %>' DataTextField="descr" DataValueField="item"
                                                        SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(StatusDS,DataBinder.Eval(Container.DataItem, "statusdescr").ToString())%>'>
                                                    </telerik:RadDropDownList>
                                                </EditItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="status" Display="false" />
                                            <telerik:GridBoundColumn DataField="route" Display="false" />
                                            <telerik:GridBoundColumn DataField="JBId" Display="false" />
                                        </Columns>
                                    </telerik:GridTableView>
                                </DetailTables>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
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
    </form>
</body>
</html>
