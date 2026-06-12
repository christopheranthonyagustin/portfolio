<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV3BySkuCandSearch.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV3.InvCountV3BySkuCandSearch" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>InvCountV3BySkuCandSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link href="../../css/style.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>
    <link href="../../css/BusyBox.css" type="text/css" rel="stylesheet">
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

    <style type="text/css">
        .style1 {
            width: 540px;
        }

        .popupHeader {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }

            .popupHeader span {
                color: #fff;
                text-decoration: none;
                line-height: 15px;
                text-decoration: none;
                float: left;
                margin-left: 10px;
            }

            .popupHeader a {
                color: #fff !important;
                text-decoration: none !important;
                line-height: 15px;
                text-decoration: none;
                float: right;
                margin-right: 10px;
            }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel ID="PopulateBtnPanel" runat="server">
                    <table cellspacing="0" cellpadding="0" border="0" width="60%">
                        <tr>
                            <td>
                                <div class="pagetitle">Step 2 of 2</div>
                            </td>
                            <td align="right">
                                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>&nbsp;                   
                                <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search" Visible="false" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />&nbsp;                                   
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="UpdPnl2" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="PopulateBtn" class="white" runat="server" OnClick="PopulateBtn_Click" Text="Populate" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                        &nbsp;&nbsp;
                                 <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click" Text="Hide" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="ReteriveBtnPanel" runat="server">
                    <table cellspacing="0" cellpadding="0" border="0" width="60%">
                        <tr>
                            <td>
                                <br />
                                <div class="pagetitle">Step 1 of 2</div>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="RetrieveUpnl" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="ReteriveBtn" class="white" runat="server" OnClick="ReteriveBtn_Click" Text="Retrieve" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:UpdateProgress ID="updateProgress" runat="server">
                    <ProgressTemplate>
                        <div class="busybiz">
                        </div>
                        <div>
                            <a class="loader"></a>
                            <a id="text">Processing</a>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <br />
                <asp:Panel ID="ReterivePanel" runat="server">
                    <table cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <td valign="top">
                                <div style="width:100%;height:50%;border:1px solid #000;">
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </div>                                
                            </td>
                        </tr>
                        <tr style="height: 5px"></tr>
                        <tr>
                            <td valign="top">
                                <div style="width:100%;height:50%;border:1px solid #000;">
                                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                                </div>                              
                            </td>                           
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:Panel ID="ResultPanel" runat="server">
                    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                        OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound" OnPreRender="ResultDG_PreRender"
                        AllowPaging="false" AllowSorting="true" Skin="Metro" Height="100%">
                        <GroupingSettings CaseSensitive="false" />
                        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                            <Selecting AllowRowSelect="true"></Selecting>
                            <Scrolling AllowScroll="True" UseStaticHeaders="true" />
                        </ClientSettings>
                        <SortingSettings EnableSkinSortStyles="false" />
                        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                        <ItemStyle Wrap="false"></ItemStyle>
                        <HeaderStyle Wrap="false"></HeaderStyle>
                        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="slltid" Name="ParentGrid" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
                            <Columns>
                                <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false" HeaderStyle-Width ="80px">
                                    <ItemStyle Wrap="False"></ItemStyle>
                                    <HeaderTemplate>
                                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkObjective" runat="server" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="S/N" HeaderStyle-Width ="80px">
                                    <ItemTemplate>
                                        <asp:Label ID="numberLabel" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle />
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="slltid" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="icid" SortExpression="icid" HeaderText="LineId"
                                    AllowFiltering="false" Display="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="countcycle" SortExpression="countcycle" HeaderText="CountCycle">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="cat" SortExpression="cat" HeaderText="LocCat">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="noofsku" SortExpression="noofsku" HeaderText="NoOfSKU">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno1" HeaderText="TUNo1">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="selectedslltids" SortExpression="selectedslltids" HeaderText="slltids" Display="false">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>
                <%--Message popup area start--%>
                <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
                <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
                    TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
                    BackgroundCssClass="MessageBoxPopupBackground">
                </ajaxToolkit:ModalPopupExtender>
                <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none; border: 2px solid #780606;"
                    DefaultButton="btnOk">
                    <div class="popupHeader" style="width: 420px;">
                        <asp:Label ID="lblMessagePopupHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                        <asp:LinkButton ID="btnCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
                    </div>
                    <div style="max-height: 500px; width: 420px; overflow: hidden;">
                        <div style="float: left; width: 380px; margin: 20px;">
                            <table style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                                <tr>
                                    <td style="text-align: left; vertical-align: top; width: 11%;">
                                        <asp:Literal runat="server" ID="ltrMessagePopupImage"></asp:Literal>
                                    </td>
                                    <td style="width: 2%;"></td>
                                    <td style="text-align: left; vertical-align: top; width: 87%;">
                                        <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                            <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; vertical-align: top;" colspan="3">
                                        <div style="margin-right: 0px; float: right; width: auto;">
                                            <asp:Button ID="btnOk" runat="server" Text="OK" CssClass="white" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </asp:Panel>
                <%--Message popup area end--%>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdateProgress ID="RetrieveProgress" runat="server">
            <ProgressTemplate>
                <div class="busybiz" onclick="var btn = document.getElementById('buzy');btn.disabled = true;" id="buzy" runat="server">
                </div>
                <div id="LoaderPopup">
                    <a id="loader"></a>
                    <a id="text">We are processing your request ...</a>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </form>
</body>
</html>
