<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripPlanningV5Incentive.aspx.cs" Inherits="iWMS.Web.Job.TripPlanningV5.TripPlanningV5Incentive" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE>
<html>
<head id="Head1" runat="server">
    <title>Trip Planning V5 Incentive</title>
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
        <table style="z-index: 0" id="Table" border="0" cellspacing="2" cellpadding="2" width="100%">
            <tr>
                <td>
                    <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Conditional">
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
                                <HeaderStyle Wrap="false"></HeaderStyle>
                                <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
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
        </table>
    </form>
</body>
</html>
