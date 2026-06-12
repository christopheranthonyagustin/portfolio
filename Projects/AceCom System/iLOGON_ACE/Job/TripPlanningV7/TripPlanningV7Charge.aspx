<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV7Charge.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV7.TripPlanningV7Charge" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE>
<html>
<head id="Head1" runat="server">
    <title>Trip Planning V7 Charge</title>
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
            <tr>
                <td style="width: 5px"></td>
                <td>
                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;
                    <asp:Button ID="AddBtn" CssClass="white" runat="server" OnClick="AddBtn_Click" Visible="True" Text="Add" 
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;
                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;&nbsp;&nbsp;       
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="pagetitle"></asp:Label>
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
        <table style="z-index: 0" id="Table" border="0" cellspacing="2" cellpadding="2" width="100%">
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
                                        <telerik:GridTemplateColumn HeaderText="ID" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center" Display="false">
                                            <ItemTemplate>
                                                <asp:Label ID="ChargeIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "chargeid") %>'></asp:Label>
                                                <asp:Label ID="TaxTypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "taxtype") %>'></asp:Label>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="ChargeCode" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="ChargeCodeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "chargecode") %>'></asp:Label>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="Description" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                            <ItemTemplate>
                                                <telerik:RadTextBox ID="DescrTxt" runat="server" Width="150px" Skin="WebBlue" TextMode="MultiLine" Text='<%# DataBinder.Eval(Container.DataItem, "chargedescr") %>'>
                                                </telerik:RadTextBox>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="Quantity" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                            <ItemTemplate>
                                                <telerik:RadTextBox ID="QtyTxt" runat="server" Width="150px" Skin="WebBlue"></telerik:RadTextBox>
                                                <asp:CompareValidator ID="QtyTxtCompVal" runat="server" ControlToValidate="QtyTxt"
                                                    EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Integer" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="UnitRate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" AllowFiltering="false">
                                            <ItemTemplate>
                                                <telerik:RadTextBox ID="UnitRateTxt" runat="server" Width="150px" Skin="WebBlue"></telerik:RadTextBox>
                                                <asp:CompareValidator ID="UnitRateTxtCompVal" runat="server" ControlToValidate="UnitRateTxt"
                                                    EnableClientScript="True" ErrorMessage="#" ForeColor="Red" Operator="DataTypeCheck" Type="Double" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                            <br />
                            <br />
                            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" Width="100%"
                                OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" Skin="Office2007" OnItemCommand="ResultDG_ItemCommand"
                                OnUpdateCommand="ResultDG_UpdateCommand" OnEditCommand="ResultDG_EditCommand" OnItemDataBound="ResultDG_ItemDataBound" GroupPanelPosition="Top">
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
                                                <a id="InkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onclick="return confirm('Confirm delete?')"
                                                    onserverclick="InkDelete_ServerClick" runat="server">
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
                                                <asp:TextBox ID="JBChargeIDTxt" runat="server" Visible="false" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="chargeid" HeaderText="Charge">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblCharge" runat="server" Text="Charge" Width="150px" Style="text-align: center"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "jbcchargecode")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadComboBox ID="ChargeCombo" runat="server"
                                                    DropDownHeight="150px" Skin="WebBlue" DataSource='<%# ChargeListDS%>' SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(ChargeListDS,DataBinder.Eval(Container.DataItem, "chargeid").ToString())%>'
                                                    DataTextField="ChargeCode" DataValueField="ChargeId" RenderMode="Lightweight" Filter="Contains"
                                                    CausesValidation="false" OnSelectedIndexChanged="ChargeCombo_SelectedIndexChanged" AutoPostBack="true">
                                                    <ItemTemplate>
                                                        <p><%# DataBinder.Eval(Container.DataItem, "ChargeCode") %> - <%# DataBinder.Eval(Container.DataItem, "ChargeDescr") %></p>
                                                    </ItemTemplate>
                                                </telerik:RadComboBox>
                                                <asp:RequiredFieldValidator ID="ChargeReqVal" runat="server" ControlToValidate="ChargeCombo"
                                                    ErrorMessage="*" ForeColor="Red" />
                                                <asp:TextBox ID="ChargeCodeTxt" runat="server" Visible="false" Value='<%# DataBinder.Eval(Container.DataItem, "chargeid") %>' />

                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="jbcchargedescr" HeaderText="Vdoc">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblChargedescr" runat="server" Text="Description" Width="150px" Style="text-align: center"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "jbcchargedescr")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="ChargedescrTxt" Skin="Office2007"></telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Qty" HeaderText="Quantity">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblQty" runat="server" Text="Quantity" Width="150px" Style="text-align: center"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "Qty" )%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="QtyTxt" Skin="Office2007">
                                                </telerik:RadTextBox>
                                                <asp:RequiredFieldValidator ID="QtyReqVal" runat="server" ControlToValidate="QtyTxt"
                                                    ErrorMessage="*" ForeColor="Red" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="UnitRate" HeaderText="UnitRate">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblUnitRate" runat="server" Text="UnitRate" Width="100px" Style="text-align: center"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "unitrate" )%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="RateTxt" Skin="Office2007" Width="100px" AutoPostBack="true">
                                                </telerik:RadTextBox>
                                                <asp:RequiredFieldValidator ID="RateReqVal" runat="server" ControlToValidate="RateTxt"
                                                    ErrorMessage="*" ForeColor="Red" />
                                                <asp:CompareValidator ID="RateTxtCompVal" runat="server" ControlToValidate="RateTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="DataTypeCheck" Type="Double" ForeColor="Red" />
                                                <asp:CompareValidator ID="RateTxtZeroVal" runat="server" ControlToValidate="RateTxt"
                                                    EnableClientScript="true" ErrorMessage="#" Operator="GreaterThanEqual" ValueToCompare="0" ForeColor="Red" />

                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="TaxType" HeaderText="TaxType">
                                            <HeaderTemplate>

                                                <asp:Label ID="lblTaxType" runat="server" Text="TaxType" Width="100px" Style="text-align: center"></asp:Label>

                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "taxtype")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDropDownList ID="TaxTypeList" runat="server" DefaultMessage="Select a TaxType"
                                                    Width="120px" DropDownHeight="150px" Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(taxTypeListDS,DataBinder.Eval(Container.DataItem, "taxtype").ToString())%>'
                                                    DataSource='<%# taxTypeListDS%>' DataTextField="taxtype" DataValueField="taxtype"
                                                    AutoPostBack="true">
                                                </telerik:RadDropDownList>
                                                <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="TaxTypeList"
                                                    ErrorMessage="*" ForeColor="Red" />

                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Uom" HeaderText="Uom">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblTaxType" runat="server" Text="Uom" Width="100px" Style="text-align: center"></asp:Label>

                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "Uom")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDropDownList ID="UomList" runat="server" DefaultMessage="Select a TaxType"
                                                    Width="120px" DropDownHeight="150px" Skin="WebBlue" SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(UomDS,DataBinder.Eval(Container.DataItem, "Uom").ToString())%>'
                                                    DataSource='<%# UomDS%>' DataTextField="descr" DataValueField="item"
                                                    AutoPostBack="true">
                                                </telerik:RadDropDownList>
                                                <asp:RequiredFieldValidator ID="UomReqVal" runat="server" ControlToValidate="UomList"
                                                    ErrorMessage="*" ForeColor="Red" />
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="Remarks" HeaderText="Remarks">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblRemarks" runat="server" Text="Remarks" Width="150px" Style="text-align: center"></asp:Label>

                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "Remarks")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="RemrksTxt" Skin="Office2007"
                                                    Width="150px" TextMode="MultiLine">
                                                </telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn UniqueName="AddUser" HeaderText="AddUser">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblAdduser" runat="server" Text="AddUser" Width="200px" Style="text-align: center"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "AddUser")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadTextBox runat="server" ID="AddUserTxt" Skin="Office2007"
                                                    ReadOnly="true">
                                                </telerik:RadTextBox>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridTemplateColumn HeaderText="Adddate" UniqueName="Adddate">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblAdddate" runat="server" Text="Adddate" Width="200px" Style="text-align: center"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "Adddate", "{0:dd/MMM/yyyy}")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <telerik:RadDatePicker runat="server" ID="AdddateTxt" Skin="Office2007"
                                                    DateInput-DateFormat="dd/MMM/yyyy" ReadOnly="true">
                                                </telerik:RadDatePicker>
                                            </EditItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
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