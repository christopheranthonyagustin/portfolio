<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormattedReportWriterLine.aspx.cs" Inherits="iWMS.Web.Accounting.FormattedReportWriter.FormattedReportWriterLine" %>

<%@ Register TagPrefix="iWMS" TagName="MsgPopup" Src="../../Control/UserMsgModalPopup.ascx" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>FormattedReportWriterForm</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
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
    </script>
    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
        }
    </script>
    <style type="text/css">
        body {
            overflow: hidden;
        }

        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td {
            border-left: solid 1px gray !important;
            border-bottom: solid 1px gray !important;
        }
    </style>
</head>
<body onload='displayRow("table1");' bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" RenderSelectedPageOnly="true">
            <telerik:RadPageView runat="server" ID="HeaderRadPageView">
                <br />
                <asp:Panel ID="FRDetlPanel" runat="server" Visible="false">
                    &nbsp;
                    <asp:Button ID="AddFRDetlBtn" runat="server" CssClass="white" Text="Add" Visible="false"
                        OnClick="AddFRDetlBtn_Click" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                    &nbsp;
                    <asp:Button ID="CancelFRDetlBtn" runat="server" CssClass="white" Text="Cancel" Visible="false"
                        OnClick="CancelFRDetlBtn_Click" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" CausesValidation="false" />
                    <br />
                    <iWMS:iForm ID="formCtlFRDetl" runat="server"></iWMS:iForm>
                </asp:Panel>
                &nbsp;
                <asp:Button ID="CreateNewBtn" runat="server" CssClass="white" Text="New"
                    OnClick="CreateNewBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="EditBtn" runat="server" CssClass="white" Text="Edit"
                    OnClick="EditBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="DeleteBtn" runat="server" CssClass="white" Text="Delete"
                    OnClick="DeleteBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="ActiveBtn" runat="server" CssClass="white" Text="Active"
                    OnClick="ActiveBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;
                <asp:Button ID="InActiveBtn" runat="server" CssClass="white" Text="Inactive"
                    OnClick="InActiveBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />&nbsp;                                    
                <asp:Button ID="reseqBtn" runat="server" CssClass="white" Text="Resequence"
                    OnClick="ReSeqBtn_Click" OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false" />
                <br />
                <br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" AllowPaging="false" AllowSorting="true"
                            AllowFilteringByColumn="false" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound">
                            <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false">
                                <Selecting AllowRowSelect="True" />
                                <Scrolling AllowScroll="True" ScrollHeight="600px" EnableVirtualScrollPaging="False" UseStaticHeaders="True" SaveScrollPosition="True" />
                            </ClientSettings>
                            <SortingSettings EnableSkinSortStyles="false" />
                            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                            <ItemStyle Wrap="false"></ItemStyle>
                            <HeaderStyle Wrap="false"></HeaderStyle>
                            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" EditMode="InPlace" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                                <Columns>
                                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                                        <ItemStyle Wrap="False" Width="90px"></ItemStyle>
                                        <HeaderStyle Width="90px" />
                                        <HeaderTemplate>
                                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkObjective" runat="server" />&nbsp;&nbsp;
                                        <asp:ImageButton runat="server" Visible="True" ImageAlign="AbsMiddle" ID="TradePartnerEdit"
                                            ImageUrl="../../image/pencil.gif" Width="15" Height="15" AlternateText="Edit"
                                            OnClick="ldEdit_Click" BackColor="Transparent" BorderWidth="0"></asp:ImageButton>
                                            &nbsp;
                                        <asp:ImageButton runat="server" ID="TradePartnerldAdd" ImageUrl="..\..\image\add.png" Width="15"
                                            Height="15" BorderWidth="0" BackColor="Transparent" AlternateText="Add"
                                            OnClick="ldAdd_Click" CausesValidation="False"></asp:ImageButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="SeqNo" HeaderText="SeqNo" ItemStyle-Width="70px" HeaderStyle-Width="70px"
                                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("SeqNo")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="LineType" HeaderText="LineType" ItemStyle-Width="110px" HeaderStyle-Width="110px"
                                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("LineTypeDescr")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="GLAccCodeRange" HeaderText="GLAccCodeRange <br/> LabelTextCode" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("RangeGridColumn")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="Option" HeaderText="GLAccCodePrintOption <br/> LineOperation <br/> LabelTextDescr" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("PrintOptionGridColumn")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="UnderlineType" HeaderText="BoldFont <br/> UnderlineType <br/> BlankLines"
                                        ItemStyle-Width="170px" HeaderStyle-Width="170px">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("BoldFontGridColumn")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="FromMemory" HeaderText="Print From <br/> Memory" ItemStyle-Width="110px" HeaderStyle-Width="110px"
                                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Larger" ItemStyle-Font-Bold="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("FrMemoryno")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn UniqueName="ToMemory" HeaderText="Add To <br/> Memory" ItemStyle-Width="110px" HeaderStyle-Width="110px"
                                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Larger" ItemStyle-Font-Bold="true">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("ToMemoryno")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn HeaderText="Notes" DataField="Notes" SortExpression="Notes" UniqueName="Notes"
                                        AllowFiltering="true" ReadOnly="True" Reorderable="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn UniqueName="date" HeaderText="ModifiedOn">
                                        <ItemTemplate>
                                            <%# string.Format("{0:}",Eval("ModifiedOn")) %>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridBoundColumn DataField="StatusColourCode" UniqueName="StatusColourCode" Display="false" />
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <iWMS:MsgPopup ID="MsgPopup" runat="server"></iWMS:MsgPopup>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>

