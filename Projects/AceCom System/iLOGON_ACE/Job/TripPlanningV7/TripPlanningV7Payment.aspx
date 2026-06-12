<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV7Payment.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV7.TripPlanningV7Payment" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE>
<html>
<head id="Head1" runat="server">
    <title>Trip Planning V7 Payment</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/row.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function closeWin(url) {
            GetRadWindow().BrowserWindow.location.href = url;
            GetRadWindow().close();
        }

        function close() {
            GetRadWindow().close();
        }
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

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>
        <script type="text/javascript">
            function OnClientClose(sender, args) {
                document.location.href = document.location.href;
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table cellspacing="2" cellpadding="2" width="100%">
            <tr style="height: 5px">
            </tr>
            <tr>
                <td style="width: 5px"></td>
                <td>
                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;
                    <asp:Button ID="AddBtn" CssClass="white" runat="server" OnClick="AddBtn_Click" Visible="True" Text="Add" 
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;
                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;
                    <asp:Button ID="EmailBtn" CssClass="white" runat="server" OnClick="EmailBtn_Click" Visible="True" Text="Email" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;&nbsp;&nbsp;                
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>

                    <br />
                    <br />
                    <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                        <ContentTemplate>
                            <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <table style="z-index: 0" id="Table" border="0" cellspacing="2" cellpadding="2" width="80%">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel" runat="server">
                        <ContentTemplate>
                            <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="false" GridLines="None"
                                AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG1_NeedDataSource"
                                OnItemDataBound="ResultDG1_ItemDataBound" Width="50%">
                                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                                    <Selecting AllowRowSelect="true" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="true"></AlternatingItemStyle>
                                <ItemStyle Wrap="true"></ItemStyle>
                                <HeaderStyle Wrap="false"></HeaderStyle>
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
                                        <telerik:GridTemplateColumn HeaderText="Remarks" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                            <ItemTemplate>
                                                <telerik:RadTextBox ID="RemarksTxt" runat="server" Width="150px" Skin="WebBlue" TextMode="MultiLine">
                                                </telerik:RadTextBox>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                            <br />
                            <br />
                            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false"
                                OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" Skin="Office2007" OnItemCommand="ResultDG_ItemCommand"
                                OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemDataBound="ResultDG_ItemDataBound" GroupPanelPosition="Top">
                                <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <SortingSettings EnableSkinSortStyles="false" />
                                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <HeaderStyle Wrap="false"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="ID" CommandItemDisplay="Top" Name="CBAdd" EditMode="InPlace" HorizontalAlign="Center">
                                    <CommandItemSettings ShowRefreshButton="false" />
                                    <Columns>
                                        <telerik:GridTemplateColumn UniqueName="icon">
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                            <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkObjective" runat="server" />
                                                <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                                    Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
                                                    BorderWidth="0"></asp:ImageButton>
                                                <asp:ImageButton runat="server" Visible="True" ID="AttachmentBtn" ImageUrl="../../image/attached.jpg"
                                                    Width="15" Height="15" AlternateText="Attachment" OnClick="AttachmentBtn_Click" BackColor="Transparent"
                                                    BorderWidth="0"></asp:ImageButton>
                                                <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                    onserverclick="ResultDG_Delete" runat="server">
                                                    <img id="delImg" src="../../image/bin.gif" width="15" height="15" border="0" alt="Delete"
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
                                                <asp:TextBox ID="CBIDTxt" runat="server" Visible="false" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Date" HeaderText="Date">
                                            <HeaderTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblPaymentNo" runat="server" Text="PaymentNo" Width="150px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblVendor" runat="server" Text="Vendor" Width="150px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "number")%>
                                                <br />
                                                <%# DataBinder.Eval(Container.DataItem, "vdname")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <telerik:RadTextBox runat="server" ID="PaymentNotxt" Skin="Office2007" Rows="2" Width="150px"
                                                                Enabled="false">
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <telerik:RadComboBox ID="CashBookListDS" runat="server" DefaultMessage="Select a Vendor"
                                                                DropDownHeight="150px" Skin="WebBlue" DataSource='<%# CashBookListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(CashBookListDS,DataBinder.Eval(Container.DataItem, "vdid").ToString())%>'
                                                                DataTextField="descr" DataValueField="item" RenderMode="Lightweight" Filter="Contains"
                                                                CausesValidation="false">
                                                            </telerik:RadComboBox>
                                                            <asp:TextBox ID="VendorTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "vdname") %>' />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Vendor" HeaderText="Vdoc">
                                            <HeaderTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblVdocNo" runat="server" Text="VendorDocNo" Width="150px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblVdocDate" runat="server" Text="VendorDocDate" Width="150px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "CBHExRef1")%>
                                                <br />
                                                <%# DataBinder.Eval(Container.DataItem, "CBHExDate1", "{0:dd/MMM/yyyy}")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <telerik:RadTextBox runat="server" ID="CBvendorDoc" Skin="Office2007" Rows="2" Width="150px">
                                                            </telerik:RadTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <telerik:RadDatePicker runat="server" ID="exdate1" Skin="Office2007" Rows="2" Width="150px"
                                                                DateInput-DateFormat="dd/MMM/yyyy">
                                                            </telerik:RadDatePicker>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Date" HeaderText="Date">
                                            <HeaderTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblChargeCode" runat="server" Text="ChargeCode" Width="150px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblCdescr" runat="server" Text="ChargeDescr" Width="150px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "chargecode" )%>
                                                <br />
                                                <%# DataBinder.Eval(Container.DataItem, "ChargeDescr")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <telerik:RadComboBox ID="ChargeList" runat="server" DefaultMessage="Select a Charge"
                                                                DropDownHeight="150px" Skin="WebBlue" DataSource='<%# chargeListDS%>' DataTextField="descr"
                                                                DataValueField="item" OnSelectedIndexChanged="ChargeList_SelectedIndexChanged"
                                                                RenderMode="Lightweight" Filter="Contains" AutoPostBack="true" CausesValidation="false">
                                                            </telerik:RadComboBox>
                                                            <asp:RequiredFieldValidator ID="ChargeListReqVal" runat="server" ControlToValidate="ChargeList"
                                                                ErrorMessage="*" ForeColor="Red"/>
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
                                        <telerik:GridTemplateColumn UniqueName="QtyUOM" HeaderText="QtyUOM">
                                            <HeaderTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblQty" runat="server" Text="Qty" Width="100px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblUnitRate" runat="server" Text="UnitRate" Width="100px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblamt" runat="server" Text="Amount" Width="100px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
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
                                                                EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" ForeColor="Red"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <telerik:RadTextBox runat="server" ID="RateTxt" Skin="Office2007" Width="100px" AutoPostBack="true"
                                                                OnTextChanged="QtyRate_TextChanged">
                                                            </telerik:RadTextBox>
                                                            <asp:RequiredFieldValidator ID="RateTxtReqVal" runat="server" ControlToValidate="RateTxt"
                                                                ErrorMessage="*" ForeColor="Red"/>
                                                            <asp:CompareValidator ID="RateTxtCompVal" runat="server" ControlToValidate="RateTxt"
                                                                EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red"/>
                                                            <asp:CompareValidator ID="RateTxtZeroVal" runat="server" ControlToValidate="RateTxt"
                                                                EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" ForeColor="Red"/>
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
                                        <telerik:GridTemplateColumn UniqueName="TaxTypestatus" HeaderText="TaxTypestatus">
                                            <HeaderTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblTaxType" runat="server" Text="TaxType" Width="100px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblStatus" runat="server" Text="Status" Width="100px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "taxtypedescr")%>
                                                <br />
                                                <%# DataBinder.Eval(Container.DataItem, "cbheadstatusdescr")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <telerik:RadDropDownList ID="TaxTypeList" runat="server" DefaultMessage="Select a TaxType"
                                                                Width="120px" DropDownHeight="150px" Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taxTypeListDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>'
                                                                DataSource='<%# taxTypeListDS%>' DataTextField="descr" DataValueField="item"
                                                                OnSelectedIndexChanged="TaxType_SelectedIndexChanged" AutoPostBack="true">
                                                            </telerik:RadDropDownList>
                                                            <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxTypeList"
                                                                ErrorMessage="*" ForeColor="Red"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <telerik:RadDropDownList ID="StatusListDS" runat="server" DefaultMessage="Select a Status"
                                                                Enabled="false" Width="120px" DropDownHeight="150px" Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(StatusListDS,DataBinder.Eval(Container.DataItem, "cbheadstatus").ToString())%>'
                                                                DataSource='<%# StatusListDS%>' DataTextField="descr" DataValueField="item">
                                                            </telerik:RadDropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Cjob" HeaderText="Cjob">
                                            <HeaderTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblContainerNo" runat="server" Text="ContainerNo" Width="150px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblJobNo" runat="server" Text="JobNo" Width="150px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblVeh" runat="server" Text="Vehicle" Width="150px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblPer" runat="server" Text="Driver" Width="150px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
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
                                                            <telerik:RadTextBox runat="server" ID="containernoTxt" ReadOnly="true" Skin="Office2007"
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
                                        <telerik:GridTemplateColumn UniqueName="BRemark" HeaderText="BRemark">
                                            <HeaderTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblBank" runat="server" Text="Bank" Width="200px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblrmk" runat="server" Text="Remarks" Width="200px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="200px" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "BankDescr")%>
                                                <br />
                                                <%# DataBinder.Eval(Container.DataItem, "Rem1")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <telerik:RadDropDownList ID="BankListDS" runat="server" DefaultMessage="Select a Bank Code"
                                                                Width="120px" DropDownHeight="150px" Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(BankListDS,DataBinder.Eval(Container.DataItem, "bankcode").ToString())%>'
                                                                DataSource='<%# BankListDS%>' DataTextField="descr" DataValueField="item">
                                                            </telerik:RadDropDownList>
                                                            <asp:RequiredFieldValidator ID="BankListReqVal" runat="server" ControlToValidate="BankListDS"
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
                                        <telerik:GridTemplateColumn HeaderText="RecoverableType" UniqueName="RecoverableTypeDescr">
                                            <HeaderTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblBank" runat="server" Text="RecoverableType" Width="200px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblrmk" runat="server" Text="RecoverableRemarks" Width="200px" Style="text-align: center"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                            <HeaderStyle Wrap="false" HorizontalAlign="Center" Width="250px" />
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="250px" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "recoverabletype")%>
                                                <br />
                                                <%# DataBinder.Eval(Container.DataItem, "recoverableremarks")%>
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
                                        <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="False" />
                                        <telerik:GridBoundColumn DataField="cbid" UniqueName="cbid" Display="False" />
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>

                            <asp:HiddenField ID="HiddenField" runat="server" />
                            <telerik:RadWindow ID="AttcIconRadWindow" runat="server" VisibleOnPageLoad="true" Title="Attc @ TripPlanningV7" Width="800px" Height="600px"
                                NavigateUrl='<%# "TripPlanningV7Attc.aspx?JBId="+ HiddenField.Value %>' Left="100px" Top="20px"
                                Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" Visible="false" Behaviors="Move, Close">
                            </telerik:RadWindow>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <%--Message popup area start--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
            TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
            BackgroundCssClass="MessageBoxPopupBackground" Y="200">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;">
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