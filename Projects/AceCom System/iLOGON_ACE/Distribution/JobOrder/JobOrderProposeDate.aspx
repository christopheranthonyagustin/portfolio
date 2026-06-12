<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobOrderProposeDate.aspx.cs" Inherits="iWMS.Web.Distribution.JobOrder.JobOrderProposeDate" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Propose Date @ Job Order</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
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
    </script>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />        
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="90%" ID="ProposeDateRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit" OnClick="EditBtn_Click"
                                OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="ConfirmBtn" runat="server" CssClass="white" Text="Confirm" OnClick="ConfirmBtn_Click"
                                OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <iWMS:ModalPopup ID="ModalPopup1" runat="server"></iWMS:ModalPopup>
                         </td>
                    </tr>
                    <tr>
                </table>
                <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                    AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
                    AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource">
                    <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <SortingSettings EnableSkinSortStyles="false" />
                    <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                    <ItemStyle Wrap="false"></ItemStyle>
                    <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
                    <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="JobOrderId">
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <Columns>
                            <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" ItemStyle-Height="30px" ItemStyle-Width="30px">
                                <HeaderTemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>

                             <telerik:GridBoundColumn DataField="JobOrderNo" UniqueName="JobOrderNo" SortExpression="JobOrderNo" ShowFilterIcon="true"
                                HeaderText="Job No"> 
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="FromExpectedDate" UniqueName="FromExpectedDate" SortExpression="FromExpectedDate" ShowFilterIcon="true"
                                HeaderText="FromExpDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"> 
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="ToExpectedDate" UniqueName="ToExpectedDate" SortExpression="ToExpectedDate" ShowFilterIcon="true"
                                HeaderText="ToExpDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="FromCSDate" UniqueName="FromCSDate" SortExpression="FromCSDate" ShowFilterIcon="true"
                                HeaderText="FromCSDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            
                            <telerik:GridBoundColumn DataField="ToCSDate" UniqueName="ToCSDate" SortExpression="ToCSDate" ShowFilterIcon="true"
                                HeaderText="ToCSDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="FromOPSDate" UniqueName="FromOPSDate" SortExpression="FromOPSDate" ShowFilterIcon="true"
                                HeaderText="FromOpsDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>                            

                            <telerik:GridBoundColumn DataField="ToOPSDate" UniqueName="ToOPSDate" SortExpression="ToOPSDate" ShowFilterIcon="true"
                                HeaderText="ToOpsDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                            </telerik:GridBoundColumn>
                            
                            <telerik:GridBoundColumn DataField="CustomerReference" UniqueName="CustomerReference" SortExpression="CustomerReference" ShowFilterIcon="true"
                                HeaderText="Customer Reference">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="JobOrderStatusDescr" UniqueName="JobOrderStatusDescr" SortExpression="JobOrderStatusDescr" ShowFilterIcon="true" AllowFiltering="true"
                                HeaderText="Status">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="JobOrderStatus" Display="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="JobOrderId" Display="false">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </telerik:RadPageView>
        </telerik:RadMultiPage>       
    </form>
</body>
</html>
