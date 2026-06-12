<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvCountV3Detl.aspx.cs" Inherits="iWMS.Web.Audit.InvCountV3.InvCountV3Detl" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>InvCountV3Detl</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMSTelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">   
        <script src="../../js/Script.js" type="text/javascript"></script>
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
    </script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager" runat="server" />
    <table cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td>
                <div class="pagetitle">
                    <asp:Label ID="IcIdLbl" runat="server"></asp:Label></div>
            </td>
            <td>
                <asp:Button ID="AddDetailBtn" class="white" runat="server" OnClick="AddDetailBtn_Click" Visible="False" Text="Select" 
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="ButtonExcel" class="green" runat="server" OnClick="ButtonExcel_Click" Text="Excel" 
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;   
                <asp:Button ID="UpdateBtn" class="white" runat="server" OnClick="UpdateBtn_Click" Text="Update" Visible="False"  
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                 &nbsp;
                <asp:Button ID="RecountBtn" class="white" runat="server" OnClick="RecountBtn_Click" Text="Recount"
                     OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />                
                 &nbsp;
                <asp:Button ID="CountSheetBtn" class="blue" runat="server" OnClick="CountSheetBtn_Click" Text="CountSheet" 
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                 &nbsp;
             </td>
             <td>
                LineId<br />
                <telerik:RadTextBox ID="ICDetlIdTxt" runat="server" Width="150px">
                </telerik:RadTextBox>
                <asp:CompareValidator ID="CountQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" "
                    ErrorMessage="#" ControlToValidate="ICDetlIdTxt" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            </td>
            <td>
                RecountNo<br />
                <telerik:RadTextBox ID="ReCntNoTxt" runat="server" Width="150px">
                </telerik:RadTextBox>
                <asp:CompareValidator ID="ReCntNoVal" runat="server" CssClass="errorLabelBig" ForeColor=" "
                    ErrorMessage="#" ControlToValidate="ReCntNoTxt" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>             
            </td>
            <td>
            <br />
                <asp:Button ID="SearchBtn" class="white" runat="server" OnClick="SearchBtn_Click" Text="Search" 
                    OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
            </td>
        </tr>
    </table>              
    <br />
    <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None" Width="100%" Height="100%" 
        AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
        AllowPaging="true" Skin="Metro" OnNeedDataSource="ResultDG_NeedDataSource"
        OnPreRender="ResultDG_PreRender" OnPageIndexChanged="ResultDG_PageIndexChanged"
        OnItemDataBound="ResultDG_ItemDataBound">
        <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true" AllowExpandCollapse="true">
            <Selecting AllowRowSelect="true"></Selecting>
            <Scrolling UseStaticHeaders="true" />
        </ClientSettings>
        <ExportSettings ExportOnlyData="true" IgnorePaging="true" OpenInNewWindow="true"
            FileName="InventoryCount">
            <Excel Format="Html" />
        </ExportSettings>
        <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
        <ItemStyle Wrap="false"></ItemStyle>
        <HeaderStyle Wrap="false"></HeaderStyle>
        <MasterTableView AllowMultiColumnSorting="true" PageSize="100" DataKeyNames="id" AllowFilteringByColumn="false" HeaderStyle-CssClass="RGridHeader_CUSTOM" HeaderStyle-ForeColor="White">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <Columns>
                <telerik:GridTemplateColumn AllowFiltering="false" Reorderable="false">
                    <HeaderTemplate>
                        <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                    </HeaderTemplate>
                    <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:CheckBox ID="lineChkbx" runat="server" />                       
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="status" Display="False">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="id" Display="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="id" SortExpression="id" HeaderText="LineId"
                    AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="loccode" SortExpression="loccode" HeaderText="Location">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tuno1" SortExpression="tuno2" HeaderText="TUNo1">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tuno2" SortExpression="tuno2" HeaderText="TUNo2">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderText="CountQty" AllowFiltering="false">
                    <ItemTemplate>
                        <asp:TextBox ID="CountQtyTxt" runat="server" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem, "counteduomqty") %>'></asp:TextBox>
                        <asp:CompareValidator ID="CountQtyVal" runat="server" CssClass="errorLabelBig" ForeColor=" "
                            ErrorMessage="#" ControlToValidate="CountQtyTxt" Operator="GreaterThanEqual" ValueToCompare="0" Type="Integer"></asp:CompareValidator>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="skucode" SortExpression="skucode" HeaderText="Sku">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skudescr" SortExpression="skudescr" HeaderText="SkuDescr">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skugroupdescr" SortExpression="skugroupdescr"
                    HeaderText="SkuGroup" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="recntno" SortExpression="recntno" HeaderText="Recount" ItemStyle-HorizontalAlign="Center">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lotid" SortExpression="lotid" HeaderText="LotID">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="skupckqty" SortExpression="skupckqty" HeaderText="skupckqty" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="onhanduomqty" SortExpression="onhanduomqty" HeaderText="OnHandQty"
                    AllowFiltering="false" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,###,###.###}">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="varuomqty" SortExpression="varuomqty" HeaderText="Variance"
                    AllowFiltering="false" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#,###,###.###}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="rcdate" SortExpression="rcdate" HeaderText="RcDate"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn DataField="loccountcycleinitdate" SortExpression="loccountcycleinitdate" HeaderText="TagDate"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot1" SortExpression="lot1" HeaderText="Lot1"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot2" SortExpression="lot2" HeaderText="Lot2"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot3" SortExpression="lot3" HeaderText="Lot3"
                    DataFormatString="{0:dd/MMM/yyyy}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot4" SortExpression="lot4" HeaderText="Lot4">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot5" SortExpression="lot5" HeaderText="Lot5">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot6" SortExpression="lot6" HeaderText="Lot6">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot7" SortExpression="lot7" HeaderText="Lot7">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="lot8" SortExpression="lot8" HeaderText="Lot8">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot9" DataField="lot9" SortExpression="lot9">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot10" DataField="lot10" SortExpression="lot10">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot11" DataField="lot11" SortExpression="lot11">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot12" DataField="lot12" SortExpression="lot12">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot13" DataField="lot13" SortExpression="lot13">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot14" DataField="lot14" SortExpression="lot14">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot15" DataField="lot15" SortExpression="lot15">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot16" DataField="lot16" SortExpression="lot16">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot17" DataField="lot17" SortExpression="lot17">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot18" DataField="lot18" SortExpression="lot18">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot19" DataField="lot19" SortExpression="lot19">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot20" DataField="lot20" SortExpression="lot20">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot21" DataField="lot21" SortExpression="lot21">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot22" DataField="lot22" SortExpression="lot22">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot23" DataField="lot23" SortExpression="lot23">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot24" DataField="lot24" SortExpression="lot24">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot25" DataField="lot25" SortExpression="lot25">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot26" DataField="lot26" SortExpression="lot26">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot27" DataField="lot27" SortExpression="lot27">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot28" DataField="lot28" SortExpression="lot28">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot29" DataField="lot29" SortExpression="lot29">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot30" DataField="lot30" SortExpression="lot30">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot31" DataField="lot31" SortExpression="lot31">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot32" DataField="lot32" SortExpression="lot32">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot33" DataField="lot33" SortExpression="lot33">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot34" DataField="lot34" SortExpression="lot34">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot35" DataField="lot35" SortExpression="lot35">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot36" DataField="lot36" SortExpression="lot36">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot37" DataField="lot37" SortExpression="lot37">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot38" DataField="lot38" SortExpression="lot38">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot39" DataField="lot39" SortExpression="lot39">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot40" DataField="lot40" SortExpression="lot40">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot41" DataField="lot41" SortExpression="lot41">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot42" DataField="lot42" SortExpression="lot42">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot43" DataField="lot43" SortExpression="lot43">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot44" DataField="lot44" SortExpression="lot44">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot45" DataField="lot45" SortExpression="lot45">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot46" DataField="lot46" SortExpression="lot46">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot47" DataField="lot47" SortExpression="lot47">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot48" DataField="lot48" SortExpression="lot48">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot49" DataField="lot49" SortExpression="lot49">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot50" DataField="lot50" SortExpression="lot50">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot51" DataField="lot51" SortExpression="lot51">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot52" DataField="lot52" SortExpression="lot52">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot53" DataField="lot53" SortExpression="lot53">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot54" DataField="lot54" SortExpression="lot54">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot55" DataField="lot55" SortExpression="lot55">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot56" DataField="lot56" SortExpression="lot56">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot57" DataField="lot57" SortExpression="lot57">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot58" DataField="lot58" SortExpression="lot58">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot59" DataField="lot59" SortExpression="lot59">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Lot60" DataField="lot60" SortExpression="lot60">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                    AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" HeaderText="EditUser"
                    AllowFiltering="false">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <%--Message popup area start--%>
    <%--Message popup 2 area start For Confirm Message Box--%>
    <asp:Button runat="server" ID="PopupTargetButton" Style="display: none;" />
    <ajaxToolkit:ModalPopupExtender ID="ConfrimMessagePopup" runat="server" PopupControlID="ConfrimMessagePanel"
        TargetControlID="PopupTargetButton" BackgroundCssClass="MessageBoxPopupBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel runat="server" ID="ConfrimMessagePanel" BackColor="White" Width="420"
        Style="display: none; border: 2px solid #780606;" DefaultButton="btnOk">
        <div class="popupHeader" style="width: 420px;">
            <asp:Label ID="ConfrimMsg" Text="Information" runat="server" Style="size: 15px"></asp:Label>
            <asp:LinkButton ID="ConfirmCancelBtn" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
        </div>
        <div id="Div1" runat="server" style="max-height: 500px; width: 420px; overflow: hidden;">
            <div style="float: left; width: 380px; margin: 20px;">
                <table id="ConfirmTb" runat="server" style="padding: 0; border-spacing: 0; border-collapse: collapse;
                    width: 100%;">
                    <tr>
                        <td style="text-align: left; vertical-align: top; width: 11%;">
                            <asp:Literal ID="ltrConfirmImge" runat="server"></asp:Literal>
                        </td>
                        <td style="width: 2%;">
                        </td>
                        <td style="text-align: left; vertical-align: top; width: 87%;">
                            <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                <asp:Label ID="popupConfrimMsgType" runat="server" Text=""></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; vertical-align: top;" colspan="3">
                            <div style="margin-right: 0px; float: right; width: auto;">
                                <asp:Button ID="ConfirmCancel" runat="server" Text="Cancel" OnClick="ConfirmCancelBtn_Click" />
                                &nbsp;&nbsp;&nbsp;<asp:Button ID="ConfirmYesBtn" runat="server" Text="  OK  " OnClick="ConfirmYesBtn_Click" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
    <%--Message popup 2 area end--%>
        <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
        <ajaxtoolkit:modalpopupextender id="mpeMessagePopup" runat="server" popupcontrolid="pnlMessageBox"
            targetcontrolid="btnMessagePopupTargetButton" okcontrolid="btnOk" cancelcontrolid="btnCancel"
            backgroundcssclass="MessageBoxPopupBackground">
        </ajaxtoolkit:modalpopupextender>
        <asp:Panel runat="server" ID="pnlMessageBox" BackColor="White" Width="420" Style="display: none;
            border: 2px solid #780606;">
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
                                    <asp:LinkButton ID="btnOk" runat="server" Style="text-decoration: none;">OK</asp:LinkButton>
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
