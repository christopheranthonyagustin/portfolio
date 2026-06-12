<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransportPayableDetl.aspx.cs"
    Inherits="iWMS.Web.Job.TransporterCTNR.TransportPayableDetl" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>TransportPayableDetl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/Script.js" type="text/javascript"></script>
    <style type="text/css">
        .ResultDG {
            overflow: scroll;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table width="100%">
            <tr>
                <td>
                    <asp:Button ID="MassChangeBtn" CssClass="white" runat="server" OnClick="MassChangeBtn_Click" Text="Change"
                        OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" AllowMultiRowSelection="true"
            Width="100%" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
            OnUpdateCommand="ResultDG_Update" OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged"
            OnEditCommand="ResultDG_Edit" OnItemCommand="ResultDG_ItemCommand" GroupPanelPosition="Top"
            OnItemCreated="ResultDG_ItemCreated">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="cbdid" PageSize="150"
                EditMode="InPlace" AllowAutomaticUpdates="true">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="35px" ItemStyle-Width="35px">
                    </telerik:GridClientSelectColumn>
                    <telerik:GridTemplateColumn UniqueName="icon" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                AlternateText="Edit" CommandName="Edit" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Update" ImageUrl="../../image/floppy.gif"
                                Width="15" Height="15" AlternateText="Update" CommandName="Update" BackColor="Transparent"
                                BorderWidth="0"></asp:ImageButton>
                            <asp:ImageButton runat="server" Visible="True" ID="ResultDG_Cancel" ImageUrl="../../image/arrow6.gif"
                                Width="15" Height="15" AlternateText="Cancel" CommandName="Cancel" BackColor="Transparent"
                                BorderWidth="0" CausesValidation="False"></asp:ImageButton>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="Type" Display="false"
                        AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="number" UniqueName="number" Display="true" SortExpression="number"
                        AllowFiltering="false" HeaderText="ReferenceNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="trandate" HeaderText="Date" AllowFiltering="true"
                        DataField="trandate">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "trandate", "{0:dd/MMM/yyyy}")%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="Type"
                        AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="exref1" HeaderText="VendorDocNo" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "exref1")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="CBvendorDoc" Skin="Office2007" Rows="2" Width="150px">
                            </telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="CBvendorDocReqVal" runat="server" ControlToValidate="CBvendorDoc"
                                ErrorMessage="*" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="exdate1" HeaderText="VendorDocDate" AllowFiltering="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "exdate1", "{0:dd/MMM/yyyy}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDatePicker runat="server" ID="exdate1" Skin="Office2007" Rows="2" Width="150px"
                                DateInput-DateFormat="dd/MMM/yyyy">
                            </telerik:RadDatePicker>
                            <asp:RequiredFieldValidator ID="exdate1ReqVal" runat="server" ControlToValidate="exdate1"
                                ErrorMessage="*" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="cbdctnrno" SortExpression="cbdctnrno" HeaderText="CtnrNo"
                        AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="chargedescr" HeaderText="Charge" AllowFiltering="true"
                        DataField="chargedescr">
                        <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "chargedescr")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList ID="ChargeList" runat="server" DropDownHeight="150px" Skin="WebBlue"
                                Width="300px" DataSource='<%# ChargeListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ChargeListDS,DataBinder.Eval(Container.DataItem, "chargeid").ToString())%>'
                                DataTextField="descr" DataValueField="item" RenderMode="Lightweight" Filter="Contains">
                            </telerik:RadDropDownList>
                            <telerik:RadTextBox ID="ChargeDescrTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>' />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Charge" HeaderText="ChargeDescr" DataField="CBDETLCHARGE"
                        AllowFiltering="true">
                        <HeaderStyle Wrap="false" HorizontalAlign="left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "CBDETLCHARGE")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="CBDETLCHARGETxt" Skin="Office2007" Width="350px">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="cbdqty" HeaderText="Qty" AllowFiltering="false"
                        DataField="cbdqty">
                        <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "cbdqty", "{0:#,0.##}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="cbdqtyTxt" Skin="Office2007" Width="100px"
                                AutoPostBack="true" OnTextChanged="QtyRate_TextChanged">
                            </telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="QtyTxtReqVal" runat="server" ControlToValidate="cbdqtyTxt"
                                ErrorMessage="*" />
                            <asp:CompareValidator ID="QtyTxtCompVal" runat="server" ControlToValidate="cbdqtyTxt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="cbdunitrate" HeaderText="Rate" AllowFiltering="false"
                        DataField="cbdunitrate">
                        <HeaderStyle Wrap="false" HorizontalAlign="Left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "cbdunitrate", "{0:#,0.00}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="cbdunitrateTxt" Skin="Office2007" Width="100px"
                                AutoPostBack="true" OnTextChanged="QtyRate_TextChanged">
                            </telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RateTxtReqVal" runat="server" ControlToValidate="cbdunitrateTxt"
                                ErrorMessage="*" />
                            <asp:CompareValidator ID="RateTxtCompVal" runat="server" ControlToValidate="cbdunitrateTxt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="cbdfcamt" HeaderText="Amount" DataField="cbdfcamt"
                        AllowFiltering="true">
                        <HeaderStyle Wrap="false" HorizontalAlign="left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "cbdfcamt", "{0:#,0.00}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="FcAmtTxt" Skin="Office2007" Width="100px"
                                Enabled="false">
                            </telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="FcAmtTxtReqVal" runat="server" ControlToValidate="FcAmtTxt"
                                ErrorMessage="*" />
                            <asp:CompareValidator ID="FcAmtTxtCompVal" runat="server" ControlToValidate="FcAmtTxt"
                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="cbdrem1" HeaderText="Remark" DataField="cbdrem1"
                        AllowFiltering="true">
                        <HeaderStyle Wrap="false" HorizontalAlign="left" />
                        <ItemStyle Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "cbdrem1")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="RemarkTxt" Skin="Office2007" Width="350px">
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="RecoverableType" UniqueName="RecoverableTypeDescr"
                        DataField="RecoverableTypeDescr">
                        <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "RecoverableTypeDescr")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadDropDownList runat="server" ID="RecTypeDDL" Width="120px" DropDownHeight="150px"
                                Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(RecTypeListDS,DataBinder.Eval(Container.DataItem, "RecoverableType").ToString())%>'
                                DataSource='<%# RecTypeListDS%>' DataTextField="descr" DataValueField="item">
                            </telerik:RadDropDownList>
                            <asp:TextBox ID="RecTypeTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "RecoverableType") %>' />
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="RecoverableRemarks" UniqueName="recoverableremarks"
                        DataField="recoverableremarks">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "recoverableremarks")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="RecRemTxt" Text='<%# DataBinder.Eval(Container.DataItem, "recoverableremarks") %>'>
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="cbdvdname" SortExpression="cbdvdname" HeaderText="VendorName"
                        AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="cbdpercode" SortExpression="cbdpercode" HeaderText="Personnel"
                        AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="cbdvehno" SortExpression="cbdvehno" HeaderText="Vehicle"
                        AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="pino" SortExpression="pino" HeaderText="PINo"
                        AllowFiltering="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="piinvno" SortExpression="piinvno" HeaderText="PIInvno"
                        AllowFiltering="true">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
    </form>
</body>
</html>
