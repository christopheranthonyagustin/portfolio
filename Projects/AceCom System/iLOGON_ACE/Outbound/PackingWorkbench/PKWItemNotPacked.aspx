<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PKWItemNotPacked.aspx.cs" Inherits="iWMS.Web.Outbound.PackingWorkbench.PKWItemNotPacked" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Item Not Packed @ Packing Workbench</title>
    <link rel="icon" sizes="190x130" href="../../Image/URLLogo.png" />
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" content="C#" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>
    <link rel="stylesheet" href="../../css/iWMS.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
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
        function GetRadWindow() {
            var oWindow = null; if (window.radWindow)
                oWindow = window.radWindow; else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow; return oWindow;
        }

        function close() {
            GetRadWindow().close();
        }

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:radmultipage runat="server" id="RadMultiPage1" selectedindex="0" cssclass="outerMultiPage">
            <telerik:radpageview runat="server" height="580px" id="ItemNotPackedRadPageView">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click"
                                Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="NewCartonCandidateBtn" runat="server" CssClass="LongLabelWhite" Text="New Carton Candidate" CausesValidation="false" OnClick="NewCartonCandidateBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="SplitQuantityBtn" runat="server" CssClass="LongLabelWhite" Text="Split Quantity" CausesValidation="false" OnClick="SplitQuantityBtn_Click"
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                        <td>
                            <asp:Button ID="UnallocateBtn" CssClass="LongLabelWhite" runat="server" OnClick="UnallocateBtn_Click" Text="Unallocate" 
                                OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                        </td>
                    </tr>
                </table>
                <br />
                <telerik:radgrid id="ResultDG" runat="server" autogeneratecolumns="true" gridlines="None"
                    allowsorting="true" allowfilteringbycolumn="false" enablelinqexpressions="false"
                    allowpaging="true" skin="Metro" onneeddatasource="ResultDG_NeedDataSource" oncolumncreated="ResultDG_ColumnCreated">
                    <clientsettings columnsreordermethod="Reorder" allowcolumnsreorder="true" reordercolumnsonclient="true">
                        <selecting allowrowselect="true" />
                        <scrolling allowscroll="true" usestaticheaders="true" scrollheight="450" />
                    </clientsettings>
                    <sortingsettings enableskinsortstyles="false" />
                    <alternatingitemstyle wrap="true"></alternatingitemstyle>
                    <itemstyle wrap="true"></itemstyle>
                    <headerstyle wrap="false" cssclass="RGridHeader_CUSTOM" forecolor="White"></headerstyle>
                    <mastertableview allowmulticolumnsorting="true" pagesize="50" headerstyle-cssclass="RGridHeader_CUSTOM" headerstyle-forecolor="White" datakeynames="LotId">
                        <pagerstyle mode="NextPrevNumericAndAdvanced" />
                        <columns>
                            <telerik:gridtemplatecolumn reorderable="false" uniquename="icon" allowfiltering="false" headerstyle-width="50px" itemstyle-width="50px">
                                <headertemplate>
                                    <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                </headertemplate>
                                <itemtemplate>
                                    <asp:CheckBox ID="chkObjective" runat="server" />
                                </itemtemplate>
                            </telerik:gridtemplatecolumn>
                            <telerik:gridboundcolumn datafield="LotId" display="false">
                            </telerik:gridboundcolumn>
                            <telerik:gridboundcolumn datafield="SKU" display="false">
                            </telerik:gridboundcolumn>
                            <telerik:gridboundcolumn datafield="Picked" display="false">
                            </telerik:gridboundcolumn>                            
                        </columns>
                    </mastertableview>
                </telerik:radgrid>
            </telerik:radpageview>
        </telerik:radmultipage>
    </form>
</body>
</html>
