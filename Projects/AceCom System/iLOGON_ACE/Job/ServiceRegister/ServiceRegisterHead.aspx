<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceRegisterHead.aspx.cs" Inherits="iWMS.Web.Job.ServiceRegister.ServiceRegisterHead" %>
<%@ Register TagPrefix="iWMS" TagName="iSubMenu" Src="../../Control/SubMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>ServiceRegisterHead</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/sub_global.js" type="text/javascript"></script>
    <script src="../../js/sub_menu.js" type="text/javascript"></script>
    <script src="../../js/Script.js" type="text/javascript"></script>

    <style type="text/css">
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

            .StatusBackground{
                background-color: black;
                opacity: 0.001;
            }
    </style>
    <style type="text/css">
        .style1
        {
            width: 95%;
        }
    </style>

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
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form2" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager2" runat="server" />
        <div id="div2" style="height: 92%">
            <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
                Visible="False"></asp:Label>
            <div id="div3" style="height: 80%">
                <asp:Label Style="z-index: 0" ID="Label1" runat="server" CssClass="errorLabel" Visible="False"></asp:Label>
                <br />
                <table style="width:100% ; height:30px">
             <tr>
               <td class="style1">
                <asp:Button ID="ReopenBtn" class="white" runat="server" OnClick="ReopenBtn_Click" Text="Reopen" 
                    OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                &nbsp;
                <asp:Button ID="ReopenCSBtn" class="white" runat="server" OnClick="ReopenCSBtn_Click" Text="ReopenCS" 
                    OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="false" />
                &nbsp;
                <asp:Button ID="VoidBtn" class="white" runat="server" OnClick="VoidBtn_Click" Text="Void" 
                    OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" />
                &nbsp;
                <asp:Button ID="CopyBtn" class="white" runat="server" OnClick="CopyBtn_Click" Text="Copy" 
                    OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                &nbsp;
                <asp:Button ID="NonBillablebtn" class="white" runat="server" Text="NonBill"  
                    OnClick="NonBillablebtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                &nbsp;
                <asp:Button ID="CloseBtn" class="white" runat="server" Text="Close" 
                    OnClick="Closebtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                &nbsp;
                <asp:Button ID="ChargeSheetBtn" class="blue" runat="server" Text="Charge" 
                    OnClick="ChargesSheetBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                &nbsp;
                <asp:Button ID="PreviewBtn" class="blue" runat="server" Text="Preview" 
                    OnClick="ChargePreviewBtn_Click" OnClientClick="disableBtn(this.id, false)" UseSubmitBehavior="false" Visible="true" />
                &nbsp; 
                <asp:Button ID="MergeBtn" class="white" runat="server" Text="Merge" 
                    OnClick="MergeBtn_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp; 
                <asp:Button ID="CancelBtn" class="white" runat="server" Text="Cancel" 
                    OnClick="CancelBtn_Click" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                &nbsp;&nbsp;&nbsp;
                </td>
                <td align="right">
                    <asp:Button ID="SwapBtn" class="CircleBtn" runat="server" Text="M" 
                        OnClick="SwapBtn_Click" OnClientClick="disableCirBtn(this.id)" UseSubmitBehavior="false"  Visible="true" />
                </td>
            </tr>
            </table>
            <br />
            <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
                AllowSorting="true" AllowFilteringByColumn="true" EnableLinqExpressions="false"
                AllowPaging="true" Skin="Office2007" OnNeedDataSource="ResultDG_NeedDataSource"
                OnPageIndexChanged="ResultDG_PageIndexChanged" OnItemDataBound="ResultDG_ItemDataBound">
                <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <SortingSettings EnableSkinSortStyles="false" />
                <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
                <ItemStyle Wrap="false"></ItemStyle>
                <HeaderStyle Wrap="false"></HeaderStyle>
                <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id" Name="ParentGrid">
                    <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                    <Columns>
                        <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                            <HeaderTemplate>
                                <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                            </HeaderTemplate>
                            <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkObjective" runat="server" />
                                <asp:ImageButton runat="server" Visible="True" ID="JobEdit" ImageUrl="..\..\image\pencil.gif"
                                    BorderWidth="0" BackColor="Transparent" Width="15" Height="15" AlternateText="Edit Job Register"
                                    OnClick="ldEdit_Click" CausesValidation="False"></asp:ImageButton>
                                <iWMS:iSubMenu ID="subMenuCtl" runat="server"></iWMS:iSubMenu>
                                <iWMS:iSubMenu ID="subMenuPrintCtl" runat="server"></iWMS:iSubMenu>
                                <asp:Label ID="DetailLbl" runat="server"></asp:Label>
                                <asp:Label ID="CODLbl" runat="server"></asp:Label>
                                <asp:Label ID="JbCfmLbl" runat="server" />
                                <asp:Label ID="NonBillCfmLbl" runat="server" />
                                <asp:Label ID="WisWrcPopCfmLbl" runat="server" />
                                <asp:Label ID="CSCfmLbl" runat="server" />
                            </ItemTemplate>
                            <ItemStyle Wrap="false" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn Display="False" DataField="id" HeaderText="id">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="acid" HeaderText="id">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="accode" SortExpression="accode" HeaderText="Account"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="number" SortExpression="number" HeaderText="JobNo"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="status">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statusdescr" SortExpression="statusdescr" HeaderText="Status"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exref1" SortExpression="exref1" HeaderText="CustRef"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="noofctnr">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="nooftrip">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ET" SortExpression="ET" HeaderText="E-T" AllowFiltering="false"
                            ItemStyle-Width="100px">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="noofperh">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn Display="False" DataField="noofperd">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MP" SortExpression="MP" HeaderText="M-P" AllowFiltering="false"
                            ItemStyle-Width="100px">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="drinvno" SortExpression="drinvno" HeaderText="InvNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CompleteDate" SortExpression="CompleteDate" HeaderText="ClosedDate" AllowFiltering="false" DataFormatString="{0:dd/MMM/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="expdate" SortExpression="expdate" HeaderText="ExpDate"
                            DataFormatString="{0:dd/MMM/yyyy}" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="cargopacktypedescr" SortExpression="cargopacktypedescr"
                            HeaderText="ShipmentType" ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="typedescr" SortExpression="typedescr" HeaderText="JobType" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="type" SortExpression="type" HeaderText="type"
                            Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="delvagentrefno" SortExpression="delvagentrefno"
                            HeaderText="delvagentrefno" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="permittypedescr" SortExpression="permittypedescr"
                            HeaderText="TptType" ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="billsizetypedescr" SortExpression="billsizetypedescr"
                            HeaderText="BillSizeType" ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="license" SortExpression="license" HeaderText="Descr"
                            ItemStyle-Wrap="false" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="outvessel" SortExpression="outvessel" HeaderText="Vsl"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="outvoyage" SortExpression="outvoyage" HeaderText="Voy"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ineta" SortExpression="ineta" HeaderText="ETA"
                            DataFormatString="{0:dd/MMM/yyyy HH:mm}" ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="fraddr" SortExpression="fraddr" HeaderText="From"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="toaddr" SortExpression="toaddr" HeaderText="To"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="eqpaddr" SortExpression="eqpaddr" HeaderText="Eqp"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="remarks" SortExpression="remarks" ItemStyle-Wrap="false"
                            HeaderText="Remarks">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="exref2" SortExpression="exref2" HeaderText="PortnetNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="releaseloc" ItemStyle-Wrap="false" SortExpression="releaseloc"
                            HeaderText="Site" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="permitno" ItemStyle-Wrap="false" SortExpression="permitno"
                            HeaderText="PermitNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="qucode" ItemStyle-Wrap="false" SortExpression="qucode"
                            HeaderText="QuotationNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="inedoasn" ItemStyle-Wrap="false" SortExpression="inedoasn"
                            HeaderText="ImportEdoAsn">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="outesnasn" ItemStyle-Wrap="false" SortExpression="outesnasn"
                            HeaderText="ExportEsnAsn">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adddate" SortExpression="adddate" HeaderText="AddDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="adduser" SortExpression="adduser" HeaderText="AddUser"
                            ItemStyle-Wrap="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="editdate" SortExpression="editdate" HeaderText="EditDate"
                            ItemStyle-Wrap="false" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="edituser" SortExpression="edituser" ItemStyle-Wrap="false"
                            HeaderText="EditUser">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isnonbillable" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="cargoPackTypeUSR02" Display="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="statuscolor" Display="False">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            </div>
        </div>
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
                                <asp:Literal runat="server" ID="ltrMsgImge"></asp:Literal>
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
                                    <asp:Button ID="btnOk" runat="server" Text="OK" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup area end--%>
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
            <div runat="server" style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table id="ConfirmTb" runat="server" style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal ID="ltrConfirmImge" runat="server"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
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
        <%--Message popup area end--%>
        <%--Status popup area start--%>
        <asp:Button runat="server" ID="btnStatusButton" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="mpeJobClosePopup" runat="server" PopupControlID="pnlStstusBox"
            TargetControlID="btnStatusButton" CancelControlID="btnStatusCancel" BackgroundCssClass="StatusBackground">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="pnlStstusBox" BackColor="LAVENDER" Width="225px" Style="display: none; border: 2px solid #859DD4;">
            <div class="popupHeader" style="width: 225px;">
                <asp:Label ID="Label2" Text="Close Job" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="btnStatusCancel" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div style="height: 240px; width: 225px;">
                <table style="margin-top: 10px; margin-left: 22px;" cellpadding="7px">
                    <tr>
                        <td>JobNo<br />
                            <telerik:RadTextBox ID="JobNotxt" runat="server" Width="155px" ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Account<br />
                            <telerik:RadTextBox ID="Accounttxt" runat="server" Width="155px" ReadOnly="true">
                            </telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>CloseCompleteDate
                      <telerik:RadDatePicker ID="CloseJobDateTxt" runat="server" Width="155"
                        DateInput-DateFormat="dd/MMM/yyyy" DateInput-DisplayDateFormat="dd/MMM/yyyy" PopupDirection="TopRight" Skin="Office2007" ZIndex="15000">
                        <Calendar runat="server">
                            <SpecialDays>
                                <telerik:RadCalendarDay Repeatable="Today" ItemStyle-BackColor="Bisque" />
                            </SpecialDays>
                        </Calendar>
                    </telerik:RadDatePicker>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="CloseImg" class="white" runat="server" OnClick="CancelImg_Click" Text="Close"
                                OnClientClick="disableBtn(this.id,false)" UseSubmitBehavior="false"  />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <%--Status popup area end--%>
    </form>
</body>
</html>
