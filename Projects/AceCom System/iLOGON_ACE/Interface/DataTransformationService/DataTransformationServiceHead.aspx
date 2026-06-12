<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataTransformationServiceHead.aspx.cs" Inherits="iWMS.Web.Interface.DataTransformationService.DataTransformationServiceHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>Result @ DataTransformationMaster</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png">
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
        <script language="javascript" src="../../js/checkbox.js" type="text/javascript"></script>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
              <table cellspacing="2">
                    <tr>
                        <br />
                        <td>
                            <asp:Button ID="RefreshBtn" CssClass="white" runat="server" Text="Refresh"
                                OnClick="RefreshBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                           
                        </td>
                        <td>
                            <asp:Button ID="CloneBtn" CssClass="white" runat="server" Text="Clone"
                                OnClick="CloneBtn_Click" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                           
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="TransformationId">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Reorderable="false" AllowFiltering="false">
                                <ItemStyle Wrap="False"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ImageAlign="AbsMiddle" ID="EditImgBtn"
                                        ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                        OnClick="EditImgBtn_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            
                            <telerik:GridBoundColumn DataField="ACCode" UniqueName="ACCode" SortExpression="ACCode"
                                HeaderText="Account">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Code" UniqueName="Code" SortExpression="Code"
                                HeaderText="Code">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Name" UniqueName="Name" SortExpression="Name"
                                HeaderText="Name">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TransactionType" UniqueName="TransactionType" SortExpression="TransactionType"
                                HeaderText="Transaction Type">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SourceType" UniqueName="SourceType" SortExpression="SourceType"
                                HeaderText="Source Type">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FormatType" UniqueName="FormatType" SortExpression="FormatType"
                                HeaderText="Format Type">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Folder_Unprocessed" UniqueName="Folder_Unprocessed" SortExpression="Folder_Unprocessed"
                                HeaderText="Folder Unprocessed">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Folder_Processed" UniqueName="Folder_Processed" SortExpression="Folder_Processed"
                                HeaderText="Folder Processed">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Folder_Error" UniqueName="Folder_Error" SortExpression="Folder_Error"
                                HeaderText="Folder Error">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Folder_Ignored" UniqueName="Folder_Ignored" SortExpression="Folder_Ignored"
                                HeaderText="Folder Ignored">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="StatusDescr" UniqueName="StatusDescr" SortExpression="StatusDescr"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddDate" UniqueName="AddDate" SortExpression="AddDate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="AddUser" UniqueName="AddUser" SortExpression="AddUser" HeaderText="AddUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditDate" UniqueName="EditDate" SortExpression="EditDate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EditUser" UniqueName="EditUser" SortExpression="EditUser" HeaderText="EditUser">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StatusColourCode" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
         
        <table>
            <tr>
                <td>
                    <asp:Button ID="ConfirmCloneBtn" Text="" Style="display: none;" OnClick="ConfirmCloneBtn_Click" runat="server" /><%--Set Hidden button for changing from TT-popup to RadConfirm--%>
                </td>
            </tr>
        </table>
    </form>
     <telerik:RadCodeBlock runat="server">
        <script type="text/javascript">
            function ConfirmCloneBtnCallbackFn(arg) {
                if (arg) // User clicked OK Button in RadConfirm
                {
                    __doPostBack("<%=ConfirmCloneBtn.UniqueID %>", "");
                }
            }
        </script>
    </telerik:RadCodeBlock>
</body>
</html>
