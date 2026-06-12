<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderLoadingInstruction.aspx.cs"
    Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderLoadingInstruction" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>TankOrderLoadingInstruction</title>

    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <script src="../../js/CastleBusyBox.js" language="javascript"></script>
    <link href="../../css/style.css" type="text/css" rel="stylesheet">

    <script type="text/javascript">
        function OnClientClose(sender, args) {
            document.location.href = document.location.href;
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

        .RadWindow {
            z-index: 8010 !important;
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
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
        <br />
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>

                    <asp:Button ID="NewLOIBtn" runat="server" Text="NewLOI" CssClass="white"
                        OnClick="NewLOIBtn_Click" ToolTip="Create New Loading Instruction"></asp:Button>

                    <asp:Button ID="JSBtn" runat="server" Text="JobSheet" CssClass="blue"
                        OnClick="JSBtn_Click" ToolTip="Print Job Sheet"></asp:Button>

                    <asp:Button ID="BookingConfirmation" runat="server" Text="Booking" CssClass="blue"
                        OnClick="BookingConfirmationBtn_Click" ToolTip="Print Booking Confirmation"></asp:Button>

                    <asp:Button ID="LOIBtn" runat="server" Text="LOI" Visible="true"
                        CssClass="blue" OnClick="LOIBtn_Click" ToolTip="Print Loading Instruction"></asp:Button>

                    <asp:Button ID="ROBtn" runat="server" Text="ReleaseOrd" Visible="true"
                        CssClass="blue" OnClick="ROBtn_Click" ToolTip="Print Release Order"></asp:Button>

                    <asp:Button ID="SYBtn" runat="server" Text="SurveyOrd" Visible="true"
                        CssClass="blue" OnClick="SYBtn_Click" ToolTip="Print Survey Order"></asp:Button>

                    <asp:Button ID="SOBtn" runat="server" Text="StoringOrd" Visible="true"
                        CssClass="blue" OnClick="SOBtn_Click" ToolTip="Print Storing Order"></asp:Button>

                    <asp:Button ID="PrintBtn" runat="server" Text="Print" Visible="true"
                        CssClass="blue" OnClick="PrintBtn_Click"></asp:Button>
                </td>

                <td>TankDocument                    
                        <br />
                    <telerik:RadDropDownList ID="SKUImageTypeDDL" runat="server" Skin="WebBlue"></telerik:RadDropDownList>
                </td>
                <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </td>
            </tr>
        </table>
        <asp:Label Style="z-index: 0" ID="MessageLbl" runat="server" CssClass="errorLabel"
            Visible="False"></asp:Label>
        <br />
        <telerik:RadGrid ID="ResultDG" runat="server" AutoGenerateColumns="false" GridLines="None"
            OnNeedDataSource="ResultDG_NeedDataSource" AllowPaging="false" AllowSorting="true"
            AllowFilteringByColumn="true" Skin="Office2007" OnItemDataBound="ResultDG_ItemDataBound">
            <GroupingSettings CaseSensitive="false" />
            <ClientSettings AllowColumnsReorder="true" ReorderColumnsOnClient="true">
                <Selecting AllowRowSelect="true"></Selecting>
            </ClientSettings>
            <SortingSettings EnableSkinSortStyles="false" />
            <AlternatingItemStyle Wrap="false"></AlternatingItemStyle>
            <ItemStyle Wrap="false"></ItemStyle>
            <HeaderStyle Wrap="false"></HeaderStyle>
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="true" DataKeyNames="id">
                <Columns>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <HeaderTemplate>
                            <asp:CheckBox ID="SelectALLCB" runat="server" onclick="selectAll(this)" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkObjective" runat="server" />
                            <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="JBLOI_Edit"
                                runat="server">
                                <img id="Img4" src="../../image/pencil.gif" width="15" height="15" border="0" alt="Edit"
                                    title="Edit" runat="server" /></a> <a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                        onserverclick="LOIDetail_Copy" runat="server">
                                        <img id="copyImg" src="../../image/copy.png" width="15" height="15" border="0" alt="Copy"
                                            title="Copy" runat="server" visible="false" /></a>
                            <a id="lnkDelete" onclick="return confirm('Confirm delete?')"
                                href='<%#DataBinder.Eval(Container,"DataItem.id")%>' runat="server" onserverclick="JBLOI_Delete">
                                <img id="delImg" border="0" alt="Delete Container" src="../../image/bin.gif"
                                    width="15" height="15" runat="server" /></a>
                        </ItemTemplate>
                        <ItemStyle Wrap="false" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn Reorderable="false" UniqueName="icon" AllowFiltering="false">
                        <HeaderTemplate>
                            S/N
                        </HeaderTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <%# (Container.ItemIndex + (ResultDG.CurrentPageIndex * ResultDG.PageSize) + 1).ToString()%>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" HorizontalAlign="Center"></ItemStyle>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn HeaderText="TankNo" DataField="ctnrno" AllowFiltering="true"
                        ColumnGroupName="ctnrno" SortExpression="ctnrno" UniqueName="ctnrno" Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POLDepot" DataField="polcedepotname" AllowFiltering="true"
                        ColumnGroupName="polcedepotname" SortExpression="polcedepotname" UniqueName="polcedepotname"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PODDepot" DataField="podredepotname" AllowFiltering="true"
                        ColumnGroupName="podredepotname" SortExpression="podredepotname" UniqueName="podredepotname"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POLPlant" DataField="polplantname" AllowFiltering="true"
                        ColumnGroupName="polplantname" SortExpression="polplantname" UniqueName="polplantname"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="POLHaulier" DataField="polhauliername" AllowFiltering="true"
                        ColumnGroupName="polhauliername" SortExpression="polhauliername" UniqueName="polhauliername"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PODPlant" DataField="podplantname" AllowFiltering="true"
                        ColumnGroupName="podplantname" SortExpression="podplantname" UniqueName="podplantname"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderText="PODHaulier" DataField="podhauliername" AllowFiltering="true"
                        ColumnGroupName="podhauliername" SortExpression="podhauliername" UniqueName="podhauliername"
                        Reorderable="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="jbid" Display="false" />
                    <telerik:GridBoundColumn DataField="POLCEDepotServicePt" Display="false" />
                    <telerik:GridBoundColumn DataField="PODREDepotServicePt" Display="false" />
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
    </form>
</body>
</html>
