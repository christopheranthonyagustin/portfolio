<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BOMRegisterSearch.aspx.cs"
    Inherits="iWMS.Web.VAS.BOMRegister.BOMRegisterSearch" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head runat="server">
    <title>BOMRegisterSearch</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../js/row.js"></script>
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

    <style type="text/css">
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
<body bottommargin="0" leftmargin="0" rightmargin="0" topmargin="0">
    <form id="form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <asp:Panel ID="BtnPanel" runat="server">
        <table border="0" cellspacing="1" cellpadding="1" width="100%">
            <tr>
                <td>
                    <br />
                    <asp:Button ID="NewSearchBtn" class="white" runat="server" OnClick="NewSearchBtn_Click" Text="NewSearch" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />                   
                    &nbsp;
                       <asp:Button ID="CreateNewBtn" class="white" runat="server" OnClick="CreateNewBtn_Click" Text="CreateNew" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />                    
                    &nbsp;
                       <asp:Button ID="CreateKitWOBtn" class="white" runat="server" OnClick="CreateKitWOBtn_Click" Text="Kit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />                    
                    &nbsp;
                       <asp:Button ID="CreateRotWOBtn" class="white" runat="server" OnClick="CreateRotWOBtn_Click" Text="Rotation" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 
                    &nbsp;
                     <%--  <asp:ImageButton ID="DuesOutBtn" runat="server" AutoPostBack="true" ImageUrl="../../Image/DuesOut.png"
                        Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                        OnClick="DuesOutBtn_Click"></asp:ImageButton>--%>
                        <asp:Button ID="DuesOutBtn" runat="server" Text="DuesOut" OnClick="DuesOutBtn_Click"  
                           OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" class="white"  />
                    &nbsp;
                       <asp:Button ID="CreateDekitBtn" class="white" runat="server" OnClick="CreateDekitBtn_Click" Text="Dekit" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />                         
                    &nbsp;
                       <asp:Button ID="CPLBtn" class="blue" runat="server" OnClick="CPLBtn_Click" Text="CPL" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />                     
                    &nbsp;
                       <asp:Button ID="CancelBtn" class="white" runat="server" OnClick="CancelBtn_Click" Text="Cancel" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 
                    &nbsp;
                       <asp:Button ID="LoanBtn" class="white" runat="server" OnClick="LoanBtn_Click" Text="Loan" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                    &nbsp;
                        <asp:Button ID="ReturnBtn" class="white" runat="server" OnClick="ReturnBtn_Click" Text="Return" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" /> 
                      &nbsp;
                     <br />
                       <asp:Button ID="IssueVoucherBtn" class="blue" runat="server" OnClick="IssueVoucherBtn_Click" Text="IV" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />   
                        &nbsp;
                       <asp:Button ID="ReceiptVoucherBtn" class="blue" runat="server" OnClick="ReceiptVoucherBtn_Click" Text="RV" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />                                       
                    <br />
                </td>
            </tr>
            <tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="SearchPanel" runat="server">
        <table border="0" cellspacing="1" cellpadding="1" width="100%">
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <asp:ImageButton ID="SearchBtn" runat="server" ImageUrl="../../Image/Search.png"
                        Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                        OnClick="SearchBtn_Click" />
                    &nbsp;
                    <asp:ImageButton ID="HideSearchBtn" runat="server" ImageUrl="../../Image/Hide.png"
                        Visible="true" BackColor="Transparent" BorderWidth="0" Style="z-index: 0" ImageAlign="AbsMiddle"
                        OnClick="HideSearchBtn_Click" />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="AddPanel" runat="server">
        <table border="0" cellspacing="1" cellpadding="1" width="100%">
            <tr>
                <td>
                    <br />
                    &nbsp;
                    <telerik:RadButton ID="AddBtn" runat="server" OnClick="AddBtn_Click" Text="     Add     "
                        Skin="WebBlue">
                    </telerik:RadButton>
                </td>
            </tr>
            <tr>
                <td>
                    <iWMS:iForm ID="formCtl2" runat="server"></iWMS:iForm>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <div id="div2" style="width: 100%; height: 100%">
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            Width="100%" Height="86%" OnNeedDataSource="ResultDG_NeedDataSource" OnItemDataBound="ResultDG_ItemDataBound"
            AllowPaging="false" AllowSorting="true" Skin="Office2007" AllowAutomaticInserts="True">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
                <Selecting AllowRowSelect="true"></Selecting>
                <Scrolling UseStaticHeaders="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid">
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
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="DetailLbl" runat="server" BackColor="Transparent"></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="BOMNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="SKU">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="Description">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="qty" SortExpression="qty" HeaderText="Qty" AllowFiltering="false"
                        ItemStyle-HorizontalAlign="Center" DataFormatString="{0:G2}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="uom" SortExpression="uom" HeaderText="UOM">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="wono" SortExpression="wono" HeaderText="WONo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EarliestExpiryDate" SortExpression="EarliestExpiryDate"
                        HeaderText="EarliestExpiryDate" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="daystoexpiry" SortExpression="daystoexpiry" HeaderText="DaysToExpiry">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="Type">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="vdname" SortExpression="vdname" HeaderText="VdName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                        DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="skuid">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="acid">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="id">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="status">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="statuscolor">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="false" DataField="WOStatus">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
        </telerik:RadWindowManager>
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
