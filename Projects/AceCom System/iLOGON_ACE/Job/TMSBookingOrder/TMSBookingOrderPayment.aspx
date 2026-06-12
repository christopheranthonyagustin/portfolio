<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderPayment.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderPayment" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE>
<html>
<head id="Head1" runat="server">
    <title>Payment @ TMS Booking Order</title>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }

        function SelectAll(invoker) {
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

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />

        <table>
            <tr>
                <td>
                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="AddBtn" CssClass="white" runat="server" OnClick="AddBtn_Click" Visible="True" Text="Add"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="EmailBtn" CssClass="white" runat="server" OnClick="EmailBtn_Click" Text="Email" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                     &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>

        <asp:Panel ID="ChargePanel" runat="server">
            <asp:UpdatePanel ID="ChargeUpdatePanel" runat="server">
                <ContentTemplate>
                    <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="false" GridLines="None"
                        AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                        AllowPaging="false" Skin="Metro" OnNeedDataSource="ResultDG1_NeedDataSource"
                        OnItemDataBound="ResultDG1_ItemDataBound" Width="50%">
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                            <Columns>
                                <telerik:GridTemplateColumn HeaderText="ChargeCode" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="ChargeIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="TaxTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "taxtype") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="ChargeCodeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "code") %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Description" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                    <ItemTemplate>
                                        <telerik:RadTextBox ID="DescrTxt" runat="server" Width="150px" Skin="WebBlue" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "descr") %>'>
                                        </telerik:RadTextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Amount" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                    <ItemTemplate>
                                        <telerik:RadTextBox ID="AmtTxt" runat="server" Width="150px" Skin="WebBlue"></telerik:RadTextBox>
                                        <asp:CompareValidator ID="AmtTxtCompVal" runat="server" ControlToValidate="AmtTxt"
                                            EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Double" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Bank" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                    <ItemTemplate>
                                        <telerik:RadDropDownList ID="BankDDL" runat="server" Width="140px" Skin="WebBlue" ExpandDirection="Up"
                                            DataSource='<%# BankListDS%>' DataTextField="descr" DataValueField="item">
                                        </telerik:RadDropDownList>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Vendor" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                    <ItemTemplate>
                                        <telerik:RadComboBox ID="VendorCBB" runat="server" Width="140px" Skin="Sunset" BackColor="#ded7c6" ExpandDirection="Up" Filter="Contains"
                                            DataSource='<%# VendorDS%>' DataTextField="descr" DataValueField="item" DropDownAutoWidth="Enabled">
                                        </telerik:RadComboBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                    <ItemTemplate>
                                        <telerik:RadTextBox ID="RemarksTxt" runat="server" Width="150px" Skin="WebBlue" TextMode="MultiLine">
                                        </telerik:RadTextBox>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <asp:Panel ID="ResultDGPanel" runat="server">
            <asp:UpdatePanel ID="ResultDGUpdatePanel" runat="server">
                <ContentTemplate>
                    <br />
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false"
                        OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" Skin="Metro" OnItemCommand="ResultDG_ItemCommand"
                        OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemDataBound="ResultDG_ItemDataBound" GroupPanelPosition="Top">
                        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                        <ItemStyle Wrap="true"></ItemStyle>
                        <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                        <MasterTableView DataKeyNames="Id" CommandItemDisplay="Top" EditMode="InPlace" HorizontalAlign="Center" HeaderStyle-CssClass="RGridHeader_CUSTOM">
                            <Columns>
                                <telerik:GridTemplateColumn UniqueName="icon">
                                    <HeaderTemplate>
                                        <input id="SelectAll" name="SelectAll" type="checkbox" onclick="SelectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                        <asp:ImageButton runat="server" ID="Edit" ImageUrl="../../image/pencil.gif"
                                            Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"></asp:ImageButton>
                                        <asp:ImageButton runat="server" ID="AttachmentBtn" ImageUrl="../../image/attached.jpg"
                                            Width="15" Height="15" AlternateText="Attachment" OnClick="AttachmentBtn_Click" BackColor="Transparent"></asp:ImageButton>
                                        <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                            onserverclick="ResultDG_Delete" runat="server">
                                            <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
                                                title="Delete" runat="server" /></a>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton runat="server" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                            Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"></asp:ImageButton>
                                        <asp:ImageButton runat="server" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                            Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                            CausesValidation="False"></asp:ImageButton>
                                        <asp:TextBox ID="IDTxt" runat="server" Visible="false" />
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="PaymentNo <br/> Vendor">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "number")%>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "vdname")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <telerik:RadTextBox runat="server" ID="PaymentNoTxt" Skin="Office2007" Rows="2" Width="150px"
                                                        Enabled="false">
                                                    </telerik:RadTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <telerik:RadComboBox ID="VendorCombo" runat="server" DefaultMessage="Select a Vendor"
                                                        DropDownHeight="150px" Skin="WebBlue" DataSource='<%# VendorDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(VendorDS,DataBinder.Eval(Container.DataItem, "vdid").ToString())%>'
                                                        DataTextField="descr" DataValueField="item" RenderMode="Lightweight" Filter="Contains"
                                                        CausesValidation="false">
                                                    </telerik:RadComboBox>
                                                    <asp:TextBox ID="VendorTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "vdname") %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="VendorDocNo <br/> VendorDocDate">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "CBHExRef1")%>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "CBHExDate1", "{0:dd/MMM/yyyy}")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <telerik:RadTextBox runat="server" ID="VendorDocNoTxt" Skin="Office2007" Rows="2" Width="150px">
                                                    </telerik:RadTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <telerik:RadDatePicker runat="server" ID="VendorDocDatePicker" Skin="Office2007" Rows="2" Width="150px"
                                                        DateInput-DateFormat="dd/MMM/yyyy">
                                                    </telerik:RadDatePicker>
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="ChargeCode <br/> ChargeDescr">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "chargecode" )%>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "ChargeDescr")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <telerik:RadComboBox ID="ChargeCodeCombo" runat="server" DefaultMessage="Select a Charge"
                                                        DropDownHeight="150px" Skin="WebBlue" DataSource='<%# ChargeListDS%>' DataTextField="Descr"
                                                        DataValueField="Item" OnSelectedIndexChanged="ChargeList_SelectedIndexChanged"
                                                        RenderMode="Lightweight" Filter="Contains" AutoPostBack="true" CausesValidation="false">
                                                    </telerik:RadComboBox>
                                                    <asp:RequiredFieldValidator ID="ChargeListReqVal" runat="server" ControlToValidate="ChargeCodeCombo"
                                                        ErrorMessage="*" ForeColor="Red" />
                                                    <asp:TextBox ID="ChargeCodeTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <telerik:RadTextBox runat="server" ID="ChargeDescrTxt" Skin="Office2007" TextMode="MultiLine"
                                                        Rows="2" Width="150px">
                                                    </telerik:RadTextBox>
                                                    <asp:RequiredFieldValidator ID="ChargeDescrTxtReqVal" runat="server" ControlToValidate="ChargeDescrTxt"
                                                        ErrorMessage="*" ForeColor="Red" />
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Qty <br/> UnitRate <br/> Amount">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "qty" )%>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "unitrate" )%>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "FcAmt")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <telerik:RadTextBox runat="server" ID="QtyTxt" Skin="Office2007" Rows="2" Width="100px"
                                                        AutoPostBack="true" OnTextChanged="QtyRate_TextChanged">
                                                    </telerik:RadTextBox>
                                                    <asp:RequiredFieldValidator ID="QtyTxtReqVal" runat="server" ControlToValidate="QtyTxt"
                                                        ErrorMessage="*" ForeColor="Red" />
                                                    <asp:CompareValidator ID="QtyTxtCompVal" runat="server" ControlToValidate="QtyTxt"
                                                        EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                                    <asp:CompareValidator ID="QtyTxtZeroVal" runat="server" ControlToValidate="QtyTxt"
                                                        EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" ForeColor="Red" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <telerik:RadTextBox runat="server" ID="RateTxt" Skin="Office2007" Width="100px" AutoPostBack="true"
                                                        OnTextChanged="QtyRate_TextChanged">
                                                    </telerik:RadTextBox>
                                                    <asp:RequiredFieldValidator ID="RateTxtReqVal" runat="server" ControlToValidate="RateTxt"
                                                        ErrorMessage="*" ForeColor="Red" />
                                                    <asp:CompareValidator ID="RateTxtCompVal" runat="server" ControlToValidate="RateTxt"
                                                        EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                                    <asp:CompareValidator ID="RateTxtZeroVal" runat="server" ControlToValidate="RateTxt"
                                                        EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" ForeColor="Red" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <telerik:RadTextBox runat="server" ID="FcAmtTxt" Skin="Office2007" Width="100px"
                                                        AutoPostBack="true" OnTextChanged="FCAmt_TextChanged">
                                                    </telerik:RadTextBox>
                                                    <asp:RequiredFieldValidator ID="FcAmtTxtReqVal" runat="server" ControlToValidate="FcAmtTxt"
                                                        ErrorMessage="*" />
                                                    <asp:CompareValidator ID="FcAmtTxtCompVal" runat="server" ControlToValidate="FcAmtTxt"
                                                        EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                                    <asp:CompareValidator ID="FcAmtTxtZeroVal" runat="server" ControlToValidate="FcAmtTxt"
                                                        EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" ForeColor="Red" />
                                                    <asp:Label ID="LcAmtTxt" runat="server" Visible="false" />
                                                    <asp:Label ID="TaxFcAmtTxt" runat="server" Visible="false" />
                                                    <asp:Label ID="TaxLcAmtTxt" runat="server" Visible="false" />
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="TaxType <br/> Status">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "taxtypedescr")%>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "cbheadstatusdescr")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <telerik:RadDropDownList ID="TaxTypeDDL" runat="server" DefaultMessage="Select a TaxType"
                                                        Width="120px" DropDownHeight="150px" Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(TaxTypeListDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>'
                                                        DataSource='<%# TaxTypeListDS%>' DataTextField="Descr" DataValueField="Item"
                                                        OnSelectedIndexChanged="TaxTypeDDL_SelectedIndexChanged" AutoPostBack="true">
                                                    </telerik:RadDropDownList>
                                                    <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxTypeDDL"
                                                        ErrorMessage="*" ForeColor="Red" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <telerik:RadDropDownList ID="StatusDDL" runat="server" DefaultMessage="Select a Status"
                                                        Enabled="false" Width="120px" DropDownHeight="150px" Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(StatusListDS,DataBinder.Eval(Container.DataItem, "cbheadstatus").ToString())%>'
                                                        DataSource='<%# StatusListDS%>' DataTextField="descr" DataValueField="item">
                                                    </telerik:RadDropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="ContainerNo <br/> JobNo <br/> Vehicle <br/>">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "CtnrNo")%>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "srcno")%>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "VehNo")%>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "pername")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <telerik:RadTextBox runat="server" ID="ContainerNoTxt" ReadOnly="true" Skin="Office2007"
                                                        Width="150px">
                                                    </telerik:RadTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <telerik:RadTextBox runat="server" ID="JobNoTxt" ReadOnly="true" Skin="Office2007"
                                                        Width="150px">
                                                    </telerik:RadTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <telerik:RadTextBox runat="server" ID="VehicleTxt" ReadOnly="true" Skin="Office2007">
                                                    </telerik:RadTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="PerIDLbl" runat="server" Visible="false"></asp:Label>
                                                    <telerik:RadTextBox runat="server" ID="PersonnelTxt" ReadOnly="true" Skin="Office2007"
                                                        Text='<%# DataBinder.Eval(Container.DataItem, "pername") %>'>
                                                    </telerik:RadTextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Bank <br/> Remarks">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "BankDescr")%>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "Rem1")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <telerik:RadDropDownList ID="BankDDL" runat="server" DefaultMessage="Select a Bank Code"
                                                        Width="120px" DropDownHeight="150px" Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BankListDS,DataBinder.Eval(Container.DataItem, "bankcode").ToString())%>'
                                                        DataSource='<%# BankListDS%>' DataTextField="descr" DataValueField="item">
                                                    </telerik:RadDropDownList>
                                                    <asp:RequiredFieldValidator ID="BankListReqVal" runat="server" ControlToValidate="BankDDL"
                                                        ErrorMessage="*" ForeColor="Red" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <telerik:RadTextBox runat="server" ID="Rem1Txt" Skin="Office2007" TextMode="MultiLine"
                                                        Rows="2" Width="200px">
                                                    </telerik:RadTextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="RecoverableType <br/> RecoverableRemarks">
                                    <ItemTemplate>
                                        <%# DataBinder.Eval(Container.DataItem, "RecoverableType")%>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "RecoverableRemarks")%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <telerik:RadDropDownList runat="server" ID="RecTypeDDL" Width="120px" DropDownHeight="150px"
                                                        Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(RecTypeListDS,DataBinder.Eval(Container.DataItem, "RecoverableType").ToString())%>'
                                                        DataSource='<%# RecTypeListDS%>' DataTextField="descr" DataValueField="item">
                                                    </telerik:RadDropDownList>
                                                    <asp:TextBox ID="RecTypeTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "RecoverableType") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <telerik:RadTextBox runat="server" ID="RecRemTxt" Skin="Office2007" TextMode="MultiLine"
                                                        Rows="2" Width="200px" Text='<%# DataBinder.Eval(Container.DataItem, "recoverableremarks") %>'>
                                                    </telerik:RadTextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="CBId" Display="False" />
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <asp:Panel ID="RadWindowPanel" runat="server">
            <asp:UpdatePanel ID="RadWindowUpdatePanel" runat="server">
                <ContentTemplate>
                    <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Title="Attc @ TMS Booking Order" Width="800px" Height="600px"
                        Modal="true" CenterIfModal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
                    </telerik:RadWindow>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

    </form>
</body>
</html>
