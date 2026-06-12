<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV7ContainerTrucking.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV7.TripPlanningV7ContainerTrucking" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Trip Planning V7 Container Trucking</title>
    <base target="_self" />
    <meta http-equiv="Pragma" content="no-cache" />
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script type="text/javascript" src="../../js/Script.js"></script>
    <base target="_self" />
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
    </script>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function RadAlertAndClose() {
                function callbackFn(arg) //the value indicates how the dialog was closed
                {
                    GetRadWindow().close();
                }
                var SMSMessage = '<%=Session["SMSMessage"]%>';
            radalert(SMSMessage, 400, 210, 'SMS Alert', callbackFn);
        }
        </script>
    </telerik:RadCodeBlock>
</head>
<body onload="javascript:window.focus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" Modal="true" VisibleOnPageLoad="true">
        </telerik:RadWindowManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting>
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadWindowManager1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
            width="100%">
            <tr>
                <td>
                    <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="AddBtn" class="white" runat="server" OnClick="AddBtn_Click"
                        OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    <asp:Button ID="Button1" class="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel" CausesValidation="false"
                        OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;&nbsp;
                    <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                    &nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" />
                    <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:CheckBox ID="SMSCheckBox" ToolTip="SMS" runat="server" Enabled="false" />
                    <asp:Label ID="SMSLabel" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SMS" ForeColor="Black"></asp:Label>
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                     <asp:CheckBox ID="AssignCheckBox" ToolTip="Assign" runat="server" AutoPostBack="true"/>
                    <asp:Label ID="AssignLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="Assign" ForeColor="Black"></asp:Label>
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:CheckBox ID="CompleteChk" ToolTip="Complete" runat="server"/>
                    <asp:Label ID="CompleteLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="Complete" ForeColor="Black"></asp:Label>
                </td>
                <td align="left">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:CheckBox ID="NewContainerChk" ToolTip="NewContainer" runat="server" Visible="false" OnCheckedChanged="NewContainerChk_CheckedChanged" AutoPostBack="true" />
                            <asp:Label ID="NewContainerLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="NewContainer" ForeColor="Black" Visible="false"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <table style="z-index: 0" id="Table1" border="0" cellspacing="2" cellpadding="2"
            width="100%">
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
                                    </td>
                                </tr>
                                <caption>
                                    <br />
                                    <br />
                                    <tr>
                                        <td>
                                            <asp:Label ID="Countlbl" runat="server" Style="color: red; font-size: medium; font-weight: bold"></asp:Label>
                                            <asp:Label ID="TripNoLbl" runat="server" CssClass="Pagetitle" Font-Bold="true" Font-Size="Large" ForeColor="Red" Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                </caption>
                            </table>
                            <br />
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
                                                <%--                                                <asp:TextBox runat="server" ID="amt"  TextMode="MultiLine" Rows="1" Text='<%# DataBinder.Eval(Container.DataItem, "INCTAmt") %>'></asp:TextBox>--%>
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
                                                <%--                                                <asp:TextBox runat="server" ID="Rem" TextMode="MultiLine" Height="20px" Text='<%# DataBinder.Eval(Container.DataItem, "INCTRemarks") %>'></asp:TextBox>--%>
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
                    <iWMS:MsgPopup ID="MsgPopup1" runat="server"></iWMS:MsgPopup>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
