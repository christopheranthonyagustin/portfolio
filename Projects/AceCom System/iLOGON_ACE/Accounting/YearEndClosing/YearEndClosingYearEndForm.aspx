<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YearEndClosingYearEndForm.aspx.cs" Inherits="iWMS.Web.Accounting.YearEndClosing.YearEndClosingYearEndForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FinancialYearPeriodForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
     <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
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
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Main" Value="0" runat="server">
                </telerik:RadTab>
                <telerik:RadTab Text="Log" Value="50" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">

                <br />
                <asp:Button ID="UpdateDtn" runat="server" CssClass="white" Text="Update"
                    OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                <br />
                <br />
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <br />
                 <asp:Button ID="CloseBtn" CssClass="LongLabelWhite" runat="server" OnClick="CloseBtn_Click" Text="Close &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Period&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
            OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <br />
                 <br />
                <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false" ClientSettings-AllowColumnsReorder="true"
            AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
            OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="PeriodId" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False"></ItemStyle>
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="entcode" ItemStyle-Wrap="false" SortExpression="entname"
                        HeaderText="Entity">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="code" ItemStyle-Wrap="false" SortExpression="code"
                        HeaderText="Code">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" ItemStyle-Wrap="false" SortExpression="statusdescr"
                        HeaderText="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="GLDRamtUnposted" ItemStyle-Wrap="false" SortExpression="GLDRamtUnposted" ItemStyle-HorizontalAlign="Right"
                        HeaderText="GLDRamtUnposted">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="GLCRamtUnposted" ItemStyle-Wrap="false" SortExpression="GLCRamtUnposted" ItemStyle-HorizontalAlign="Right"
                        HeaderText="GLCRamtUnposted">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ARDRAmtUnposted" ItemStyle-Wrap="false" SortExpression="ARDRAmtUnposted" ItemStyle-HorizontalAlign="Right"
                        HeaderText="ARDRAmtUnposted">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ARCRAmtUnposted" ItemStyle-Wrap="false" SortExpression="ARCRAmtUnposted" ItemStyle-HorizontalAlign="Right"
                        HeaderText="ARCRAmtUnposted">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="APDRAmtUnposted" ItemStyle-Wrap="false" SortExpression="APDRAmtUnposted" ItemStyle-HorizontalAlign="Right"
                        HeaderText="APDRAmtUnposted">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="APCRAmtUnposted" ItemStyle-Wrap="false" SortExpression="APCRAmtUnposted" ItemStyle-HorizontalAlign="Right"
                        HeaderText="APCRAmtUnposted">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CHDRAmtUnposted" ItemStyle-Wrap="false" SortExpression="CHDRAmtUnposted" ItemStyle-HorizontalAlign="Right"
                        HeaderText="CHDRAmtUnposted">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CHCRAmtUnposted" ItemStyle-Wrap="false" SortExpression="CHCRAmtUnposted" ItemStyle-HorizontalAlign="Right"
                        HeaderText="CHCRAmtUnposted">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="StatusColourCode" ItemStyle-Wrap="false" SortExpression="StatusColourCode"
                        HeaderText="StatusColourCode" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EntId" ItemStyle-Wrap="false" SortExpression="EntId"
                        HeaderText="EntId" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="700px" ID="LogRadPageView">
            </telerik:RadPageView>
        </telerik:RadMultiPage>

    </form>
</body>
</html>