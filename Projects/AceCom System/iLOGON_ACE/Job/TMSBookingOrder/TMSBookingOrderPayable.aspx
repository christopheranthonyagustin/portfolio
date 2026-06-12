<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TMSBookingOrderPayable.aspx.cs" Inherits="iWMS.Web.Job.TMSBookingOrder.TMSBookingOrderPayable" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>TMSBookingOrderPayable</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMSTelerik.css">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <style type="text/css">
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                var masterTable = $find("<%= ResultDG.ClientID %>").get_masterTableView();
                masterTable.rebind();
            }
        </script>
    </telerik:RadCodeBlock>
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

        function ChargeList_SelectedIndexChange(sender, args) {
            var newValue = sender.get_selectedItem().get_attributes().getAttribute('chargedescr');
            var currentRow = $telerik.$(sender.get_element()).closest("tr")[0];
            $telerik.findControl(currentRow, 'CBDETLCHARGETxt').set_value(newValue);
        }
    </script>
    <style type="text/css">
        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }

        .ResultDG {
            overflow: scroll;
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <%-- Added by EDHO tix #12072 pt.3 --%>
        <table border="0" cellspacing="0" cellpadding="0" width="100%" height="40">
            <tr>
                <td align="left">
                    <asp:Button ID="GenerateBtn" CssClass="green" runat="server"
                        OnClick="GenerateBtn_Click" Text="Generate" UseSubmitBehavior="false" />
                    &nbsp;
                <asp:Button ID="AddBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                    OnClick="AddBtn_Click" Text="Add" />
                    &nbsp;
                <asp:Button ID="CancelBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                    OnClick="CancelBtn_Click" Text="Cancel" />
                    &nbsp;
                    <asp:Button ID="CopyBtn" runat="server" CssClass="white" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"
                        OnClick="CopyBtn_Click" Text="Copy" />
                </td>
                <td align="right">
                    <asp:Label ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;                 
                </td>
            </tr>
        </table>
        <%-- --%>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" Width="100%"
            Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="true"
            OnUpdateCommand="ResultDG_Update" OnItemDataBound="ResultDG_ItemDataBound" OnPageIndexChanged="ResultDG_PageIndexChanged"
            OnEditCommand="ResultDG_Edit" OnItemCommand="ResultDG_ItemCommand" GroupPanelPosition="Top"
            OnItemCreated="ResultDG_ItemCreated">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" EnableDragToSelectRows="false"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="cbdid" PageSize="150"
                EditMode="InPlace" AllowAutomaticUpdates="true">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="ChkIcon" AllowFiltering="false">
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
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
                                DataTextField="descr" DataValueField="item" RenderMode="Lightweight" Filter="Contains" OnItemDataBound="ChargeList_ItemDataBound" OnClientSelectedIndexChanged="ChargeList_SelectedIndexChange">
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
                    <telerik:GridTemplateColumn UniqueName="taxtypedescr" HeaderText="TaxType" Display="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "taxtype")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="TaxtypeTxt" Text='<%# DataBinder.Eval(Container.DataItem, "taxtype") %>'>
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="taxfcamt" HeaderText="TaxAmount" Display="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "taxfcamt", "{0:#,0.00}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="TaxFcAmtTxt" Text='<%# DataBinder.Eval(Container.DataItem, "taxfcamt") %>'>
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="taxlcamt" HeaderText="TaxLcAmt" Display="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "taxlcamt", "{0:#,0.00}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox runat="server" ID="TaxLcAmtTxt" Skin="Office2007" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem, "taxlcamt") %>'>
                            </telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="lcamt" HeaderText="LcAmt" Display="false">
                        <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container.DataItem, "lcamt", "{0:#,0.00}")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <telerik:RadTextBox ID="LcAmtTxt" Skin="Office2007" runat="server"></telerik:RadTextBox>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn UniqueName="cbid" DataField="id" Display="false"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </form>
</body>
</html>
