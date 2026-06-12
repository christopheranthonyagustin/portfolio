<%@ Page Language="c#" CodeBehind="ReleaseOrder5.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Outbound.ReleaseOrder.ReleaseOrder5" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>ReleaseOrder</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        html .RadAutoCompleteBox_Default .racTokenList
        {
            width:150px;
        }
    </style>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <telerik:RadAutoCompleteBox ID="SkuCodeRadComp2" runat="server" InputType="Text"
        AllowCustomEntry="false" DataTextField="code3" DataValueField="id" Visible="false">
        <TextSettings SelectionMode="Single" />
    </telerik:RadAutoCompleteBox>
    <div id="demo">
        <telerik:RadGrid ID="ResultRadGrid" runat="server" AllowPaging="True" AllowSorting="True"
            OnItemDataBound="ResultRadGrid_ItemDataBound" AutoGenerateColumns="False" ShowStatusBar="true"
            Skin="Office2007" OnPreRender="ResultRadGrid_PreRender" OnNeedDataSource="ResultRadGrid_NeedDataSource"
            OnUpdateCommand="ResultRadGrid_UpdateCommand" OnInsertCommand="ResultRadGrid_InsertCommand"
            OnDeleteCommand="ResultRadGrid_DeleteCommand" PageSize="16">
            <MasterTableView Width="100%" CommandItemDisplay="Top" DataKeyNames="id">
                <EditFormSettings>
                    <PopUpSettings Modal="false" />
                </EditFormSettings>
                <Columns>
                    <telerik:GridEditCommandColumn UniqueName="EditCommandColumn">
                    </telerik:GridEditCommandColumn>
                    <telerik:GridBoundColumn UniqueName="id" HeaderText="id" DataField="id" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="acid" HeaderText="acid" DataField="acid" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="skuid" HeaderText="skuid" DataField="skuid"
                        Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="skucode3" HeaderText="SKU/CustomsLot" DataField="skucode3">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="lot4" HeaderText="CustomsLot" DataField="lot4">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="uomqty" HeaderText="Qty" DataField="uomqty"
                        DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="uomdescr" HeaderText="UOM" DataField="uomdescr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="SpecialInstruction" HeaderText="SpecialInstruction"
                        DataField="SpecialInstruction">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Remarks" HeaderText="Remarks" DataField="Remarks">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="adddate" HeaderText="AddDate" DataField="adddate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="adduser" HeaderText="AddUser" DataField="adduser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="editdate" HeaderText="EditDate" DataField="editdate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="edituser" HeaderText="EditUser" DataField="edituser">
                    </telerik:GridBoundColumn>
                </Columns>
                <EditFormSettings EditFormType="Template">
                    <EditColumn UniqueName="eccGuestLecture">
                    </EditColumn>
                    <FormTemplate>
                        <table id="Table2" cellspacing="2">
                            <tr valign="top">
                                <td>
                                    <asp:Label ID="AccountLbl" runat="server">Account</asp:Label><br />
                                    <asp:DropDownList ID="AccountDdl" runat="server" DataTextField="code" DataValueField="acid" AutoPostBack="true"
                                        Width="150px" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CurrentUser.AccountDS,DataBinder.Eval(Container.DataItem, "accode").ToString())%>'
                                        OnSelectedIndexChanged="AccountDdl_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="skuLbl" runat="server">SKU</asp:Label><br />
                                    <telerik:RadAutoCompleteBox ID="SkuCodeRadComp" runat="server" InputType="Text" AllowCustomEntry="false"
                                        AutoPostBack="true" DataTextField="code3" DataValueField="id" OnInit="SkuCodeRadComp_Init"
                                        Value='<%# DataBinder.Eval(Container.DataItem, "skucode3") %>' DropDownWidth="400px"
                                        OnTextChanged="SkuCodeRadComp_TextChanged">
                                        <TextSettings SelectionMode="Single" />
                                    </telerik:RadAutoCompleteBox>
                                    <asp:RequiredFieldValidator ID="SkuCodeReqVal" runat="server" ErrorMessage="*" ControlToValidate="SkuCodeRadComp"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:Label ID="lot4Lbl" runat="server">CustomLot</asp:Label><br />
                                    <%--<telerik:RadComboBox runat="server" ID="RadComboBox2" DataTextField="lot4" DataValueField="lotid" AllowCustomText="true"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "lot4") %>' Filter="Contains">
                                    </telerik:RadComboBox>--%>
                                    <telerik:RadAutoCompleteBox ID="Lot4RadComp" runat="server" InputType="Text" AllowCustomEntry="true"
                                        AutoPostBack="true" DataTextField="lot4" DataValueField="lotid" OnInit="Lot4RadComp_Init" Width="150px"
                                        OnTextChanged="Lot4RadComp_TextChanged">
                                        <TextSettings SelectionMode="Single" />
                                    </telerik:RadAutoCompleteBox>
                                    <asp:RequiredFieldValidator ID="Lot4ReqVal" runat="server" ErrorMessage="*" ControlToValidate="Lot4RadComp"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:Label ID="qtyLbl" runat="server">Qty</asp:Label><br />
                                    <asp:TextBox Width="80px" ID="QtyTxt" runat="server" AutoPostBack="true" selectedValue='<%# DataBinder.Eval(Container.DataItem, "uom") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QtyTxtReqVal" runat="server" ControlToValidate="QtyTxt"
                                        ErrorMessage="*" />
                                    <asp:CompareValidator ID="QtyTxtCompVal" runat="server" ControlToValidate="QtyTxt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                                    <asp:CompareValidator ID="QtyTxtZeroVal" runat="server" ControlToValidate="QtyTxt"
                                        EnableClientScript="True" ErrorMessage="#" Operator="GreaterThan" ValueToCompare="0" />
                                </td>
                                <td>
                                    <asp:Label ID="uomLbl" runat="server">UOM</asp:Label><br />
                                    <asp:DropDownList Width="80px" ID="UOMDdl" DataTextField="descr" DataValueField="uom"
                                        runat="server" AutoPostBack="true" selecte='<%# DataBinder.Eval(Container.DataItem, "uom") %>'/>
                                </td>
                                <td>
                                    <asp:Label ID="specialInstLbl" runat="server">SpecialInstruction</asp:Label><br />
                                     <asp:TextBox Width="200px" ID="InstTxt" runat="server" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "SpecialInstruction") %>'></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="remLbl" runat="server">Remarks</asp:Label><br />
                                    <asp:TextBox Width="200px" ID="RemarksTxt" runat="server" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "remarks") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Button ID="btnUpdate" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>'
                                        runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'>
                                    </asp:Button>&nbsp;
                                    <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
                                        CommandName="Cancel"></asp:Button>
                                </td>
                            </tr>
                        </table>
                    </FormTemplate>
                </EditFormSettings>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
