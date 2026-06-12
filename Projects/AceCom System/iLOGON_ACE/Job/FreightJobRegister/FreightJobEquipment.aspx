<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightJobEquipment.aspx.cs" Inherits="iWMS.Web.Job.FreightJobRegister.FreightJobEquipment" %>

<%@ Register TagPrefix="iWMS" TagName="iForm" Src="../../Control/iFormCtl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title>FreightJobEquipment</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />    
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
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
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0" width="100%" id="btntable" runat="server">
            <tr>
                <td>
                    <asp:Panel ID="CtrlPanel" runat="server">
                        <asp:Button ID="AddDetailBtn" runat="server" Text="New" OnClick="AddDetailBtn_Click" Visible="false"
                           CssClass="white" ToolTip="NewLine Container(s)"></asp:Button>
                        &nbsp;                    
                        <asp:Button ID="MassDeleteBtn" runat="server" Text="Delete" OnClick="MassDeleteBtn_Click" Visible="false" OnClientClick="return confirm('Confirm to delete the selected Container(s)?')"
                        CssClass="white" ToolTip="Delete Container(s)"></asp:Button>
                        &nbsp;
                        <asp:ImageButton ID="cancelBtn" runat="server" OnClick="Cancel_RadButtonClicked" Visible="false"
                       ToolTip="Cancel" BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle"
                       ImageUrl="../../image/CancelImage.png" OnClientClick="return confirm('Confirm to SwitchOut selected Tank(s)?')" />
                        &nbsp;
                        <asp:ImageButton ID="SplitBtn" runat="server" OnClick="Split_RadButtonClicked" Visible="false"
                        ToolTip="Split" BackColor="Transparent" BorderWidth="0" ImageAlign="AbsMiddle"
                        ImageUrl="../../image/split.png" OnClientClick="return confirm('Confirm to SwitchOut selected Tank(s)?')" />
                        &nbsp;
                    <telerik:RadButton ID="PopulatePOLDepotBtn" runat="server" OnClick="PopulatePOLDepotBtn_Click"
                        Text="PopulateTankPOLDepot" Skin="WebBlue">
                    </telerik:RadButton>
                        &nbsp;
                    <asp:Button ID="TankReleaseShipmentBtn" runat="server" Text="Release" OnClick="TankReleaseShipmentBtn_Click" 
                       CssClass="white" ToolTip="Release Shipment"></asp:Button>
                        &nbsp;
                    <asp:Button ID="ReverseTankShipmentBtn" runat="server" Text="Reverse" OnClick="ReverseTankShipmentBtn_Click" 
                       CssClass="white" ToolTip="Reverse Shipment"></asp:Button>
                        &nbsp;
                    <asp:Button ID="SwitchPODDepotBtn" runat="server" Text="SwitchDepot" OnClick="SwitchPODDepotBtn_Click" 
                       CssClass="white" ToolTip="Switch POD Depot"></asp:Button>
                      &nbsp;
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="AddPanel" runat="server" Visible="False">
                        <table border="0" cellspacing="1" cellpadding="1" width="100%">
                            <tr>
                                <td>&nbsp;
                                <telerik:RadButton ID="SaveBtn" runat="server" OnClick="SaveBtn_Click" Text="Save"
                                    Skin="WebBlue">
                                </telerik:RadButton>
                                    &nbsp;
                                <telerik:RadButton ID="SaveNextBtn" runat="server" OnClick="SaveNextBtn_Click" Text="Save &amp; Next"
                                    Skin="WebBlue">
                                </telerik:RadButton>
                                    &nbsp;
                                <telerik:RadButton ID="ClosePanelBtn" runat="server" OnClick="ClosePanelBtn_Click"
                                    Text="- Hide" Skin="WebBlue" CausesValidation="false">
                                </telerik:RadButton>
                                    &nbsp;
                                <telerik:RadButton ID="FreightSearchBtn" runat="server" OnClick="FreightSearchBtn_Click" Text="FreightSearch"
                                    Skin="WebBlue">
                                </telerik:RadButton>
                                    &nbsp;&nbsp;
                                <asp:Label ID="GridLineLbl" runat="server" CssClass="pagetitle"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td><br />
                                    <iWMS:iForm ID="formCtl" runat="server"></iWMS:iForm>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" BorderStyle="Solid" Skin="Metro"
            AllowSorting="true" OnItemDataBound="ResultDG_ItemDataBound">
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Scrolling ScrollHeight="400px" AllowScroll="true" />
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <ExportSettings ExportOnlyData="true" IgnorePaging="true">
            </ExportSettings>
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false" CssClass="RGridHeader_CUSTOM" ForeColor="White"></HeaderStyle>
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <HeaderTemplate>
                            <input id="cbSelectAll" name="cbSelectAll" type="checkbox" onclick="selectAll(this)">
                        </HeaderTemplate>
                        <ItemStyle Wrap="false" />
                        <ItemTemplate>
                            <asp:CheckBox ID="lineChkbx" runat="server" />
                            <a id="lnkEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' runat="server"
                                onserverclick="JBCtnrDetail_Edit">
                                <img id="editImg" border="0" alt="Edit" title="Edit" src="../../image/pencil.gif"
                                    width="15" height="15" runat="server" /></a> <a id="lnkDelete" onclick="return confirm('Confirm delete?')"
                                        href='<%#DataBinder.Eval(Container,"DataItem.id")%>' runat="server" onserverclick="JBCtnrDetail_Delete">
                                        <img id="delImg" border="0" alt="Delete Container" src="../../image/bin.gif"
                                            width="15" height="15" runat="server" /></a>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="jbid" DataField="jbid" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Type" DataField="icmseqptypedescr" AllowFiltering="true"
                        SortExpression="icmseqptypedescr" UniqueName="icmseqptypedescr" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ContainerNo" DataField="ctnrno" AllowFiltering="true"
                        SortExpression="ctnrno" UniqueName="ctnrno" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="TareWt" DataField="ctnrwt" AllowFiltering="true"
                        SortExpression="ctnrwt" UniqueName="ctnrwt" Reorderable="true" DataFormatString="{0:#,0.##}">
                        <ItemStyle HorizontalAlign="Right" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POLTankRequirement" DataField="EqpSpecialInstruction" AllowFiltering="true"
                        SortExpression="EqpSpecialInstruction" UniqueName="EqpSpecialInstruction" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="Surveyor" DataField="SurveyorName" AllowFiltering="true"
                        SortExpression="SurveyorName" UniqueName="SurveyorName" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="LastCommodity" DataField="LastCommodity" AllowFiltering="true"
                        SortExpression="LastCommodity" UniqueName="LastCommodity" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="SurveyDate" DataField="SurveyDate" AllowFiltering="true"
                        SortExpression="SurveyDate" UniqueName="SurveyDate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="ReleaseDate" DataField="ExpGateOutDate" AllowFiltering="true"
                        SortExpression="ExpGateOutDate" UniqueName="ExpGateOutDate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POLDepot" DataField="POLCEDepotName" AllowFiltering="true"
                        SortExpression="POLCEDepotName" UniqueName="POLCEDepotName" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PODDepot" DataField="PODREDepotName" AllowFiltering="true"
                        SortExpression="PODREDepotName" UniqueName="PODREDepotName" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="DepotInRemarks" DataField="Eqpremarks" AllowFiltering="true"
                        SortExpression="Eqpremarks" UniqueName="Eqpremarks" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                        SortExpression="adddate" UniqueName="adddate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                        SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                        SortExpression="editdate" UniqueName="editdate" Reorderable="true" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                        SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Display="False" DataField="id" />
                    <telerik:GridBoundColumn Display="False" DataField="blid" />
                    <telerik:GridBoundColumn Display="False" DataField="status" />
                    <telerik:GridBoundColumn Display="False" DataField="statuscolor" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
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
            <div id="Div1" runat="server" style="max-height: 500px; width: 420px; overflow: hidden;">
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
        <%--Message popup 2 area end--%>
        <%--Message popup 3 area start For SP Returned Message--%>
        <asp:Button runat="server" ID="PopupTargetBtn3" Style="display: none;" />
        <ajaxToolkit:ModalPopupExtender ID="SPReturnedMsgPopup" runat="server" PopupControlID="SPReturnedMsgPanel"
            TargetControlID="PopupTargetBtn3" BackgroundCssClass="MessageBoxPopupBackground" OkControlID="SPReturnedMsgOkBtn" CancelControlID="LinkButton1">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel runat="server" ID="SPReturnedMsgPanel" BackColor="White" Width="420"
            Style="display: none; border: 2px solid #780606;" DefaultButton="btnOk">
            <div class="popupHeader" style="width: 420px;">
                <asp:Label ID="SPReturnedMsgHeading" Text="Information" runat="server" Style="size: 15px"></asp:Label>
                <asp:LinkButton ID="LinkButton1" runat="server" Style="float: right; margin-right: 15px;">X</asp:LinkButton>
            </div>
            <div id="Div2" runat="server" style="max-height: 500px; width: 420px; overflow: hidden;">
                <div style="float: left; width: 380px; margin: 20px;">
                    <table id="Table1" runat="server" style="padding: 0; border-spacing: 0; border-collapse: collapse; width: 100%;">
                        <tr>
                            <td style="text-align: left; vertical-align: top; width: 11%;">
                                <asp:Literal ID="SPReturnedMsgImage" runat="server"></asp:Literal>
                            </td>
                            <td style="width: 2%;"></td>
                            <td style="text-align: left; vertical-align: top; width: 87%;">
                                <p style="margin: 0px; padding: 0px; color: #5F0202;">
                                    <asp:Label ID="SPReturnedMsgType" runat="server" Text=""></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; vertical-align: top;" colspan="3">
                                <div style="margin-right: 0px; float: right; width: auto;">
                                    <asp:Button ID="SPReturnedMsgOkBtn" runat="server" Text="OK" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </asp:Panel>
        <%--Message popup 3 area end--%>
    </form>
</body>
</html>