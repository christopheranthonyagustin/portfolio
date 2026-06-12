<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DDPV2Order.aspx.cs" Inherits="iWMS.Web.Job.DailyDeliveriesPlanningV2.DDPV2Order" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Booking @ Daily Deliveries Planning V2</title>
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript">
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow; return oWindow;
        }

        function Close() {
            GetRadWindow().close();
        }

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Modal="true" VisibleOnPageLoad="true">
        </telerik:RadWindowManager>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7" RenderMode="Lightweight">
            <Tabs>
                <telerik:RadTab Id="GeneralTab" Text="General" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="AttachmentTab" Text="Attachment" Value="100" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="IncentiveTab" Text="Incentive" Value="200" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Id="QRCodeTab" Text="QRCode" Value="300" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <br />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="GeneralRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Panel ID="ButtonPanel" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev"
                                                CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            &nbsp;
                                            <asp:Button ID="AddBtn" CssClass="white" runat="server" OnClick="AddBtn_Click"
                                                OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                            &nbsp;
                                            <asp:Button ID="CancelBtn" CssClass="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel" CausesValidation="false"
                                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            &nbsp;
                                            <asp:Button ID="QuotationBtn" CssClass="blue" runat="server" Text="Quotation" OnClick="QuotationBtn_Click" CausesValidation="false"
                                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                            &nbsp;
                                            <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click"
                                                Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Panel ID="ChkPanel" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" />
                                            <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td style="padding-left: 60px">
                                            <asp:CheckBox ID="SMSchkObjective" ToolTip="SMS" runat="server" />
                                            <asp:Label ID="SMSchkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SMS" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td style="padding-left: 20px">
                                            <asp:CheckBox ID="AssignCheckBox" ToolTip="Assign" runat="server" />
                                            <asp:Label ID="AssignLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="Assign" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td style="padding-left: 30px">
                                            <asp:CheckBox ID="CompleteChk" ToolTip="Complete" runat="server" />
                                            <asp:Label ID="CompleteLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="Complete" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td style="padding-left: 60px">
                                            <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:UpdatePanel runat="server" ID="UpdatePanel">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                                <iWMS:iForm ID="formCtl_JBCtnr" runat="server"></iWMS:iForm>
                                                <iWMS:iForm ID="formCtl_JBCtnrTrip" runat="server"></iWMS:iForm>
                                                <iWMS:iForm ID="formCtl_SpecialInstruction" runat="server"></iWMS:iForm>
                                            </td>
                                        </tr>
                                        <br />
                                        <br />
                                        <tr>
                                            <td>
                                                <asp:Label ID="Countlbl" runat="server" Style="color: red; font-size: medium; font-weight: bold"></asp:Label>
                                                <asp:Label ID="TripNoLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle" Visible="false"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
                                    <telerik:RadGrid ID="ResultDG1" runat="server" AutoGenerateColumns="false" GridLines="None"
                                        AllowSorting="true" AllowFilteringByColumn="false" EnableLinqExpressions="false"
                                        AllowPaging="false" Skin="Office2007" OnNeedDataSource="ResultDG1_NeedDataSource" Width="50%">
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
                                                <telerik:GridTemplateColumn HeaderText="Type" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="TypeLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "IncentiveType") %>'></asp:Label>
                                                        <asp:Label ID="INCTDTIdLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "INCTDTId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn HeaderText="Type" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="TypeDescrLbl" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "IncentiveTypeDescr") %>'></asp:Label>
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
                                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" Width="700px"
                                        OnNeedDataSource="ResultDG_NeedDataSource" AllowSorting="true" Skin="Office2007" OnItemCommand="ResultDG_ItemCommand"
                                        OnUpdateCommand="ResultDG_Update" OnEditCommand="ResultDG_Edit" OnItemDataBound="ResultDG_ItemDataBound" GroupPanelPosition="Top">
                                        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                            <Selecting AllowRowSelect="True" />
                                        </ClientSettings>
                                        <SortingSettings EnableSkinSortStyles="false" />
                                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                                        <ItemStyle Wrap="false"></ItemStyle>
                                        <HeaderStyle Wrap="false"></HeaderStyle>
                                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" CommandItemDisplay="Top" Name="IncentiveAdd" EditMode="InPlace">
                                            <CommandItemSettings ShowRefreshButton="false" />
                                            <Columns>
                                                <telerik:GridTemplateColumn UniqueName="icon">
                                                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                                        <asp:ImageButton runat="server" Visible="True" ID="Edit" ImageUrl="../../image/pencil.gif"
                                                            Width="15" Height="15" AlternateText="Edit" CommandName="Edit" BackColor="Transparent"
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
                                                    </EditItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn DataField="INCTMethodDescr" SortExpression="INCTMethodDescr" ItemStyle-Wrap="false"
                                                    HeaderText="Method" ReadOnly="true">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridTemplateColumn HeaderText="Type" UniqueName="type">
                                                    <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
                                                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <%# DataBinder.Eval(Container.DataItem, "INCTTypeDescr")  %>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <telerik:RadDropDownList ID="IncentiveTypeList" runat="server" Width="120px" DropDownHeight="150px" Skin="Sunset"
                                                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(INCTTypeListDS,DataBinder.Eval(Container.DataItem, "INCTType").ToString())%>'
                                                            DataSource='<%# INCTTypeListDS%>' DataTextField="IncentiveTypedescr" DataValueField="IncentiveType" OnSelectedIndexChanged="IncentiveTypeIndex_Changed" AutoPostBack="true">
                                                        </telerik:RadDropDownList>
                                                        <telerik:RadDropDownList ID="EditINCTDTIdList" runat="server" Width="120px" DropDownHeight="150px" Skin="Sunset" Visible="false"
                                                            SelectedIndex='<%#iWMS.BusinessFacade.ListingSystem.GetSelectedIndex(INCTTypeListDS,DataBinder.Eval(Container.DataItem, "INCTDTId").ToString())%>'
                                                            DataSource='<%# INCTTypeListDS%>' DataTextField="INCTDTId" DataValueField="INCTDTId" AutoPostBack="true">
                                                        </telerik:RadDropDownList>
                                                        <asp:RequiredFieldValidator ID="TaxTypeReqVal" runat="server" ControlToValidate="IncentiveTypeList"
                                                            ErrorMessage="*" ForeColor="Red" />
                                                    </EditItemTemplate>
                                                </telerik:GridTemplateColumn>

                                                <telerik:GridTemplateColumn HeaderText="Amount" UniqueName="Amt">
                                                    <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
                                                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <%# DataBinder.Eval(Container.DataItem, "INCTAmt")  %>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <telerik:RadTextBox runat="server" ID="amt" Text='<%# DataBinder.Eval(Container.DataItem, "INCTAmt") %>'
                                                            TextMode="MultiLine" Rows="1" Width="150px">
                                                        </telerik:RadTextBox>
                                                        <asp:CompareValidator ID="amtCompVal" runat="server" ControlToValidate="amt"
                                                            EnableClientScript="true" ErrorMessage="*" ForeColor="Red" Operator="DataTypeCheck" Type="Double" />
                                                    </EditItemTemplate>
                                                </telerik:GridTemplateColumn>

                                                <telerik:GridTemplateColumn HeaderText="Remarks" UniqueName="REM">
                                                    <ItemStyle Wrap="true" VerticalAlign="Middle"></ItemStyle>
                                                    <HeaderStyle Wrap="false" HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <%# DataBinder.Eval(Container.DataItem, "INCTRemarks")  %>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <telerik:RadTextBox runat="server" ID="Rem" Text='<%# DataBinder.Eval(Container.DataItem, "INCTRemarks") %>'
                                                            TextMode="MultiLine" Rows="2" Width="150px">
                                                        </telerik:RadTextBox>
                                                    </EditItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="sno" HeaderText="AddUser <br/> AddDate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" HeaderStyle-Width="100px">
                                                    <ItemTemplate>
                                                        <%# string.Format("{0:} <br/> {1:dd/MMM/yyyy hh:mm:ss}", Eval("adduser"), Eval("adddate")) %>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <%# string.Format("{0:} <br/> {1:dd/MMM/yyyy hh:mm:ss}", Eval("adduser"), Eval("adddate")) %>
                                                    </EditItemTemplate>
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridTemplateColumn UniqueName="sno" HeaderText="EditUser <br/> EditDate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" HeaderStyle-Width="100px">
                                                    <ItemTemplate>
                                                        <%# string.Format("{0:} <br/> {1:dd/MMM/yyyy hh:mm:ss}", Eval("edituser"), Eval("editdate")) %>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <%# string.Format("{0:} <br/> {1:dd/MMM/yyyy hh:mm:ss}", Eval("edituser"), Eval("editdate")) %>
                                                    </EditItemTemplate>
                                                </telerik:GridTemplateColumn>
                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr align="right" style="padding-top: 24%">
                        <td style="padding-top: 24%"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="MessageLbl" runat="server" CssClass="errorLabel" Style="z-index: 0"
                                Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="AttachmentRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="IncentiveRadPageView" Height="700px" />
            <telerik:RadPageView runat="server" ID="QRCodeRadPageView" Height="700px" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
