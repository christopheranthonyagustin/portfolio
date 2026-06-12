<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ARClearanceForm.aspx.cs" Inherits="iWMS.Web.Accounting.ARClearance.ARClearanceForm" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ARClearanceForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css">
    <script type="text/javascript" src="../../js/Script.js"></script>
    <script type="text/javascript" src="../../js/row.js"></script>
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

        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">

            // To calculate dynamic height for RadMultiPage2
            function pageLoad() {
                var ResultDGPage = $find("<%=ResultDG.ClientID %>");
                var ResultDGHeight = ResultDGPage.get_element().offsetHeight;
                var RadMultiPage2 = $find("<%=RadMultiPage2.ClientID %>");
                var ButtonTableHeight = document.getElementById("ButtonTable").offsetHeight;
                var TotalHeight = ResultDGHeight - (ButtonTableHeight - 100); // 100 is for <Br/> height
                RadMultiPage2.get_element().style.height = TotalHeight + "px";
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" AutoPostBack="true" OnTabClick="RadTabStrip1_TabClick"
            CausesValidation="false" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Id="MainTab" Text="Main" Value="0" runat="server"></telerik:RadTab>
                <telerik:RadTab Id="QRCodeTab" Text="QRCode" Value="100" runat="server"></telerik:RadTab>
                <telerik:RadTab Text="AR Applied" Value="10" runat="server"></telerik:RadTab>
                <telerik:RadTab Text="AR Outstanding" Value="50" runat="server"></telerik:RadTab>
                <telerik:RadTab Id="AttcTab" Text="Attc" Value="200" runat="server"></telerik:RadTab>
                <telerik:RadTab Id="LogTab" Text="Log" Value="300" runat="server"></telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <table>
            <tr>
                <td>
                    <br />
                    &nbsp;
                        <asp:Label ID="IdLbl" runat="server" CssClass="pagetitle"></asp:Label>
                </td>
                <td>
                    <br />
                    &nbsp;
                        <asp:Label ID="GridLineLbl" runat="server" Font-Bold="true" ForeColor="Red" Font-Size="Large" CssClass="Pagetitle"></asp:Label>
                    <asp:CheckBox ID="chkObjective" ToolTip="SaveOnPan" runat="server" Enabled="false" />
                    <asp:Label ID="chkLbl" runat="server" Font-Bold="true" Width="15px" Font-Size="Small" Text="SaveOnPan" ForeColor="Black"></asp:Label>
                </td>
            </tr>
        </table>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" Height="700px" ID="HeaderRadPageView">
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="PrevItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="PrevItemBtn_Click" Visible="True" Text="Prev" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="UpdateBtn" runat="server" CssClass="white" Text="Update" Enabled="false"
                                OnClick="UpdateBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                            &nbsp;
                            <asp:Button ID="NextItemBtn" CssClass="white" runat="server" BackColor="Pink" OnClick="NextItemBtn_Click" Visible="True" Text="Next" CausesValidation="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                            <br />
                            <br />
                            <asp:UpdatePanel ID="OuterUpdatePanel" runat="server">
                                <ContentTemplate>
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td valign="top" align="center">
                            <asp:PlaceHolder ID="CHHId_QRCode" runat="server" />
                        </td>
                    </tr>
                </table>
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2" AutoPostBack="true"
                    CausesValidation="false" Skin="Windows7" SelectedIndex="0">
                    <Tabs>
                        <telerik:RadTab Text="GLDistribution" Value="50" runat="server">
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" CssClass="outerMultiPage" SelectedIndex="0" RenderSelectedPageOnly="true">
                    <telerik:RadPageView runat="server" ID="GLDistributionRadPageView">
                        <br />
                        <table id="ButtonTable">
                            <tr>
                                <td>&nbsp;<asp:Button ID="NewBtn" runat="server" CssClass="white" Text="New" CausesValidation="false"
                                    OnClick="NewBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                </td>
                                <td>&nbsp;<asp:Button ID="AbsorbDifferenceBtn" runat="server" CssClass="LongLabelWhite" Text="Absorb Difference"
                                    OnClick="AbsorbDifferenceBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
                            AllowFilteringByColumn="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false" CssClass="DGAlternateItem"></AlternatingItemStyle>
                            <ItemStyle Wrap="false" CssClass="DGItem"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                        <ItemStyle Wrap="False"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="CHDetailEdit"
                                                ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit" CausesValidation="false"
                                                OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                            <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="delIng"
                                                ImageUrl="../../image/bin.gif" Width="15" Height="15" AlternateText="Delete" CausesValidation="false"
                                                OnClick="CHDetl_Delete" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridCalculatedColumn HeaderText="GLAccountCode <br/> Description" DataFields="GLAccCode, GLAccDescr"
                                        Expression='{0} + " <br/>" + {1}' SortExpression="entcode" Reorderable="true">
                                    </telerik:GridCalculatedColumn>
                                    <telerik:GridCalculatedColumn HeaderText="AdditionalDescr1 <br/> AdditionalDescr2" DataFields="AdditionalDescr1, AdditionalDescr2"
                                        Expression='{0} + " <br/>" + {1}' SortExpression="entcode" Reorderable="true">
                                    </telerik:GridCalculatedColumn>
                                    <telerik:GridBoundColumn HeaderText="Debit" DataField="DRAmt" SortExpression="DRAmt" UniqueName="DRAmt" HeaderStyle-HorizontalAlign="Center"
                                        AllowFiltering="true" ReadOnly="True" Reorderable="true" DataFormatString="{0:0.00}" ItemStyle-HorizontalAlign="Right">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Credit" DataField="CRAmt" SortExpression="CRAmt" UniqueName="CRAmt" HeaderStyle-HorizontalAlign="Center"
                                        AllowFiltering="true" ReadOnly="True" Reorderable="true" DataFormatString="{0:0.00}" ItemStyle-HorizontalAlign="Right">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Debit <br/> &nbsp;(Base)" DataField="DRBaseAmt" SortExpression="DRBaseAmt" UniqueName="DRBaseAmt" HeaderStyle-HorizontalAlign="Center"
                                        AllowFiltering="true" ReadOnly="True" Reorderable="true" DataFormatString="{0:0.00}" ItemStyle-HorizontalAlign="Right">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Credit <br/> &nbsp;(Base)" DataField="CRBaseAmt" SortExpression="CRBaseAmt" UniqueName="CRBaseAmt" HeaderStyle-HorizontalAlign="Center"
                                        AllowFiltering="true" ReadOnly="True" Reorderable="true" DataFormatString="{0:0.00}" ItemStyle-HorizontalAlign="Right">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="ModifiedOn" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:dd/MMM/yyyy HH:mm:ss}",Eval("ModifiedOn")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="IsSystemGenerated" Display="False">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="GLAccSubType" Display="False">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="QRCodeRadPageView" />
            <telerik:RadPageView runat="server" ID="ARAppliedRadPageView" />
            <telerik:RadPageView runat="server" ID="AROutstandingRadPageView"></telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="AttcRadPageView" />
            <telerik:RadPageView runat="server" ID="LogRadPageView" />
        </telerik:RadMultiPage>
    </form>
</body>
</html>
