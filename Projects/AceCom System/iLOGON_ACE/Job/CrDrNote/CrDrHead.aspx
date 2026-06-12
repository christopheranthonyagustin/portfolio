<%@ Page Language="c#" CodeBehind="CrDrHead.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Job.CrDrNote.CrDrHead" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="ModalPopup" Src="../../Control/ModalPopup.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>CrDrHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/Script.js" language="javascript"></script>
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet" />
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
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

        function confirmation(msg) {
            var answer = confirm(msg)
            if (answer) {
                busyBox.Show();
                return true;
            } else {
                return false;
            }
        }
        //-->
    </script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <style type="text/css">
        .RadWindow {
            z-index: 8010 !important;
        }
    </style>
</head>

<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" CausesValidation="false"
            AutoPostBack="true" SelectedIndex="0" Skin="Windows7">
            <Tabs>
                <telerik:RadTab Text="Search Results" Value="0" readonly="readonly" runat="server">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <p>
            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                Visible="False"></asp:Label>
        </p>

        <table style="width: 100%; height: 30px">
            <tr>
                <td align="left">
                    <asp:Button ID="RefreshBtn" class="white" runat="server" OnClick="RefreshBtn_Click" Visible="true"
                         Text="Refresh" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />

                    <asp:Button ID="CrCfmImgBtn" CssClass="white" runat="server" OnClick="CrCfmImgBtn_Click" Visible="true"
                        Text="Post" OnClientClick="return confirmation('Confirm Mass Post Invoice?');" UseSubmitBehavior="true" ToolTip="PostInvoice" />

                    <asp:Button ID="CancelBtn" CssClass="white" runat="server" OnClick="CancelBtn_Click" Visible="true"
                        Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Move" />

                    <asp:Button ID="ApproveBtn" CssClass="white" runat="server" OnClick="ApproveBtn_Click"
                        Text="Approve" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Approve" />

                    <asp:Button ID="PrintInvImgBtn" runat="server" Text="CN/DN" OnClick="PrintInvImgBtn_Click"
                        CssClass="blue" ToolTip="MassInvoicePrint" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />

                    <asp:Button ID="ReopenBtn" CssClass="white" runat="server" OnClick="ReopenBtn_Click"
                        Text="Reopen" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" ToolTip="Reopen" />

                    <asp:Button ID="PostBtn" CssClass="white" runat="server" OnClick="PostBtn_Click"
                        Text="Post" UseSubmitBehavior="false" ToolTip="Post" OnClientClick="disableBtn(this.id,false)" />
                    &nbsp;
                    <asp:Button ID="ChangeAccountBtn" runat="server" CssClass="LongLabelWhite" ToolTip="Change Account" UseSubmitBehavior="false" 
                        CausesValidation="false" OnClick="ChangeAccountBtn_Click" Text="Change Account" OnClientClick="disableBtn(this.id)" />

                </td>
                <td align="right">
                    <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" OnClick="SwapBtn_Click" Text="M" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false" Visible="true" />
                </td>
                <td>
                    <iWMS:ModalPopup ID="ModalPopup" runat="server"></iWMS:ModalPopup>
               </td>
            </tr>
        </table>
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            EnableLinqExpressions="false" AllowPaging="true" Skin="Metro" AllowSorting="true"
            AllowFilteringByColumn="true" OnItemDataBound="ResultDG_ItemDataBound" OnNeedDataSource="ResultDG_NeedDataSource">
            <ClientSettings ColumnsReorderMethod="Reorder" AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" PageSize="50" DataKeyNames="id">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Wrap="false" HeaderStyle-Width="30px" ItemStyle-Wrap="false" ItemStyle-Width="30px">
                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="30px"></ItemStyle>
                        <HeaderTemplate>
                            <input id="SelectALLCB" type="checkbox" onclick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="SelectCB" runat="server" />
                        </ItemTemplate>
                        <ItemStyle Wrap="false" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Wrap="false" HeaderStyle-Width="70px" ItemStyle-Wrap="false" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <div style="display: inline-block;">
                                <asp:ImageButton runat="server" Visible="True" ID="InvoiceEdit" ImageUrl="../../image/pencil.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Invoice Register"
                                    OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                            </div>
                            <div style="display: inline-block;">
                                <iWMS:iSubMenu ID="subMenuCtl" runat="server" Visible="false"></iWMS:iSubMenu>
                            </div>
                            <div style="display: inline-block;">
                                <iWMS:iSubMenu ID="subMenuPrintCtl" runat="server"></iWMS:iSubMenu>
                            </div>
                            <asp:ImageButton runat="server" Visible="True" ID="AttcImgBtn" ImageUrl="..\..\image\attached.jpg" Width="15" Height="15" AlternateText="Show Attachment"
                                BorderWidth="0" BackColor="Transparent" OnClick="AttcImgBtn_Click" CausesValidation="False"></asp:ImageButton>
                            <asp:Label ID="DrCfmLbl" runat="server" />
                        </ItemTemplate>
                </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="acid" SortExpression="acid" HeaderText="Account" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="ID" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="entid" SortExpression="entid" HeaderText="EntID" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="cdno" SortExpression="cdno" HeaderText="ReferenceNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="cddate" SortExpression="cddate" HeaderText="CrDrDate" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="invno" SortExpression="invno" HeaderText="Invoice">
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="SRCNo" SortExpression="SRCNo" HeaderText="SRCNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="currcode" SortExpression="currcode" HeaderText="Currency">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="exchrate" SortExpression="exchrate" HeaderText="ExRate" DataFormatString="{0:#,0.##}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="smancodedescr" SortExpression="smancodedescr" HeaderText="SMan">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="paytermsdescr" SortExpression="paytermsdescr" HeaderText="PayTerms">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="cdtypedescr" SortExpression="cdtypedescr" HeaderText="Type">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="totinvamt" SortExpression="totinvamt" HeaderText="TotalAmt" ItemStyle-HorizontalAlign="Right">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="rem" SortExpression="rem" HeaderText="Remarks">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="period" SortExpression="period" HeaderText="Period">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="accode2" SortExpression="accode2" HeaderText="AccountCode2">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="approvedby" SortExpression="approvedby" HeaderText="ApprovedBy">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="approveddate" SortExpression="approveddate" HeaderText="ApprovedDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="status" SortExpression="status" HeaderText="Status" Display="False">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statuscolor" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="type" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <telerik:RadWindow ID="RadWindow" runat="server" VisibleOnPageLoad="true" Width="800px" Height="400px"
            Modal="true" VisibleStatusbar="false" OnClientClose="OnClientClose" CenterIfModal="true" Visible="false" Behaviors="Move, Close">
        </telerik:RadWindow>
    </form>

</body>
</html>
