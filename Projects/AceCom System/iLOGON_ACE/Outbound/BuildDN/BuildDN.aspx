<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuildDN.aspx.cs" Inherits="iWMS.Web.Outbound.BuildDN.BuildDN" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>BuildDN</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../css/iWMStelerik.css" />
    <base target="_self" />

    <script type="text/javascript" src="../../js/row.js"></script>
    <script type="text/javascript" src="../../js/Script.js"></script>

    <style type="text/css">
        .style1
        {
            width: 540px;
        }
        .popupHeader
        {
            padding: 5px 0px 0px 0px;
            width: 420px;
            font-family: tahoma;
            font-weight: bold;
            height: 25px;
            text-decoration: none;
            background-color: #859DD4;
        }
        .popupHeader span
        {
            color: #fff;
            text-decoration: none;
            line-height: 15px;
            text-decoration: none;
            float: left;
            margin-left: 10px;
        }
        .popupHeader a
        {
            color: #fff !important;
            text-decoration: none !important;
            line-height: 15px;
            text-decoration: none;
            float: right;
            margin-right: 10px;
        }
    </style>
</head>
<body onload='displayRow("table1");'>
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table>
        <tr>
            <td>
                &nbsp;
                <%--  <telerik:RadButton ID="BDNBtn" runat="server" Text=" Build DN " CssClass="detailButton"
                    Skin="WebBlue" OnClick="BDNBtn_Click" CausesValidation="false">
                </telerik:RadButton>--%>
                <%--<asp:ImageButton ID="BDNBtn" runat="server" ImageUrl="../../Image/Build.png" BackColor="Transparent"
                    BorderWidth="0" Style="z-index: 0" CausesValidation="false" OnClientClick="disableBtn(this.id,true)" ImageAlign="AbsMiddle"
                    OnClick="BDNBtn_Click" />--%>
                <asp:Button ID="BDNBtn" CssClass="white" runat="server" OnClick="BDNBtn_Click" Text="Build" OnClientClick="disableBtn(this.id,true)" UseSubmitBehavior="false"/>
                &nbsp;
                <asp:ImageButton ID="PrintBtn" runat="server" ImageUrl="../../Image/Print.png" Visible="false"
                    BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                    OnClick="PrintBtn_Click" />
            </td>
        </tr>
        <tr>
            <td valign="top">
                <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                    Visible="False"></asp:Label>
                <div class="NewModuleTitle">
                    Scan Count : <asp:Label Style="z-index: 0" ID="CntLabel" runat="server" labelclass="NewModuleTitle"></asp:Label>
                </div>
            </td>
        </tr>
    </table>
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
        AllowPaging="false" AllowSorting="true" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound"
        OnNeedDataSource="ResultDG_NeedDataSource" AllowAutomaticInserts="True" Width="100%">
        <ClientSettings AllowColumnsReorder="false" ReorderColumnsOnClient="false" AllowExpandCollapse="true">
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <SortingSettings EnableSkinSortStyles="false" />
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <PagerStyle Mode="NextPrevNumericAndAdvanced" />
        <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="sivno" Name="ParentGrid"
            EditMode="InPlace" Width="100%" HierarchyLoadMode="Client">
            <Columns>
                <telerik:GridBoundColumn HeaderText="isid" DataField="isid" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="ptid" DataField="ptid" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="acid" DataField="acid" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="SIVNo" DataField="sivno" AllowFiltering="true"
                    ColumnGroupName="sivno" SortExpression="sivno" UniqueName="sivno" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Issue Number" DataField="isno" AllowFiltering="true"
                    ColumnGroupName="isno" SortExpression="isno" UniqueName="isno" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="NoOfSIV" DataField="NoOfSIV" AllowFiltering="true"
                    ColumnGroupName="NoOfSIV" SortExpression="NoOfSIV" UniqueName="NoOfSIV" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="STONo" DataField="ishpono" AllowFiltering="true"
                    ColumnGroupName="ishpono" SortExpression="ispono" UniqueName="ihspono" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="DocNo" DataField="ishexref2" AllowFiltering="true"
                    ColumnGroupName="ishexref2" SortExpression="ishexref2" UniqueName="ihsexref2" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="MONo" DataField="ishexref4" AllowFiltering="true"
                    ColumnGroupName="ishexref4" SortExpression="ishexref4" UniqueName="ishexref4" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="UnitSLOC" DataField="shtocode" AllowFiltering="true"
                    ColumnGroupName="shtocode" SortExpression="shtocode" UniqueName="shtocode" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="MRZone" DataField="route" AllowFiltering="true"
                    ColumnGroupName="route" SortExpression="route" UniqueName="route" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Sku" DataField="skucode" AllowFiltering="true"
                    ColumnGroupName="skucode" SortExpression="skucode" UniqueName="skucode" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="PackedQty" DataField="packedqty" AllowFiltering="true"
                    ColumnGroupName="packedqty" Display="false" SortExpression="packedqty" UniqueName="packedqty"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Status" DataField="statusdescr" AllowFiltering="true"
                    ColumnGroupName="statusdescr" SortExpression="statusdescr" UniqueName="statusdescr"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="Add Date"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <table>
    <tr>
            <td valign="top">
            <br />
            <br />
               <telerik:RadTextBox ID="BuildDNNoTxt" runat="server" TextMode="MultiLine" Visible="false" 
               Width="300px" Height="150px"
               ></telerik:RadTextBox>
            </td>
        </tr>
    </table>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="mpeMessagePopup" runat="server" PopupControlID="pnlMessageBox"
        TargetControlID="btnMessagePopupTargetButton" OkControlID="btnOk" CancelControlID="btnCancel"
        BackgroundCssClass="MessageBoxPopupBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
        border: 2px solid #780606;" DefaultButton="btnOk">
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
                        <td style="width: 2%;">
                        </td>
                        <td style="text-align: left; vertical-align: top; width: 87%;">
                            <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                <asp:Label runat="server" ID="lblMessagePopupText"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">
                                <asp:Button ID="btnOk" runat="server" Text="OK" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <%--Message popup area end--%>
    </form>
</body>
</html>
