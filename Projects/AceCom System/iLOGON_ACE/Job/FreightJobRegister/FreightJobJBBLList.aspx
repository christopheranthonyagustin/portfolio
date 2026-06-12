<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightJobJBBLList.aspx.cs" Inherits="iWMS.Web.Job.FreightJobRegister.FreightJobJBBLList" %>

<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>CostingSheetDetlList</title>
    <link href="../../css/iWMStelerik.css" type="text/css" rel="stylesheet" />
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
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
        <tr>
            <td class="pagetitle">
                &nbsp;
                <telerik:radbutton id="AddDetailBtn" runat="server" text="NewHouse" visible="true"
                    cssclass="detailButton" onclick="AddDetailBtn_Click" skin="WebBlue">
                </telerik:radbutton> 
                &nbsp;
                <telerik:radbutton id="SwitchHBLBtn" runat="server" text="SwitchHBL" visible="true"
                    cssclass="detailButton" onclick="SwitchHBLBtn_Click" skin="WebBlue">
                </telerik:radbutton>
                 &nbsp;
                <telerik:radbutton id="AddMasterBtn" runat="server" text="NewMaster" visible="true"
                    cssclass="detailButton" onclick="AddMasterBtn_Click" skin="WebBlue">
                </telerik:radbutton>      
                &nbsp;
                <telerik:radbutton id="BLDraftBtn" runat="server" text="BLDraft" visible="true"
                    cssclass="detailButton" onclick="BLDraftBtn_Click" skin="WebBlue">
                </telerik:radbutton>   
                &nbsp;
                <telerik:radbutton id="BLBtn" runat="server" text="BL" visible="true"
                    cssclass="detailButton" onclick="BLBtn_Click" skin="WebBlue">
                </telerik:radbutton> 
                &nbsp;
                <telerik:radbutton id="ExportExcelBLBtn" runat="server" text="ExportExcelBL" visible="true"
                    cssclass="detailButton" onclick="ExportExcelBLBtn_Click" skin="WebBlue">
                </telerik:radbutton> 
                &nbsp;
                <telerik:radbutton id="shipAdvBtn" runat="server" text="ShippingAdvice" visible="true"
                    cssclass="detailButton" onclick="shipAdvBtn_Click" skin="WebBlue">
                </telerik:radbutton> 
                &nbsp;
                <telerik:radbutton id="ArrNotBtn" runat="server" text="ArrivalNotice" visible="true"
                    cssclass="detailButton" onclick="ArrNotBtn_Click" skin="WebBlue">
                </telerik:radbutton>             
            </td>
        </tr>
    </table>
    <br />
    <telerik:radgrid id="ResultDG" runat="server" autogeneratecolumns="false" gridlines="None"
        onneeddatasource="ResultDG_NeedDataSource" allowpaging="false" allowsorting="true"
        allowfilteringbycolumn="true" skin="Office2007" onitemdatabound="ResultDG_ItemDataBound">
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
                        <a id="ldEdit" href='<%#DataBinder.Eval(Container,"DataItem.id")%>' onserverclick="JBBL_Edit"
                            runat="server">
                            <img id="Img4" src="..\..\image\pencil.gif" width="15" height="15" border="0" alt="Edit"
                                title="Edit" runat="server" /></a> 
                                <%--<a id="lnkCopy" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                    onserverclick="BLDetail_Copy" runat="server">
                                    <img id="copyImg" src="..\..\image\copy.png" width="15" height="15" border="0" alt="Copy"
                                        title="Copy" runat="server" /></a> --%>
                                        <%--<a id="lnkDelete" href='<%#DataBinder.Eval(Container,"DataItem.id")%>'
                                            onclick="return confirm('Confirm delete?')" onserverclick="QuDetail_Delete" runat="server">
                                            <img id="delImg" src="..\..\image\bin.gif" width="15" height="15" border="0" alt="Delete Detail"
                                                title="Delete Detail" runat="server" />--%></a>
                        <%--<asp:Label ID="DetailLbl" runat="server" Visible="false"></asp:Label>--%>
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
                <telerik:GridBoundColumn HeaderText="BLNo" DataField="blno" AllowFiltering="true"
                    ColumnGroupName="blno" SortExpression="blno" UniqueName="blno"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="BLType" DataField="bltype" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="NoOfPackages" DataField="noofpackages" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="BLType" DataField="bltypedescr" AllowFiltering="true"
                    ColumnGroupName="bltypedescr" SortExpression="bltypedescr" UniqueName="bltypedescr"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="jbId" DataField="jbid" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Marks&Nos" DataField="marksandnumbers" AllowFiltering="true"
                    ColumnGroupName="marksandnumbers" SortExpression="marksandnumbers" UniqueName="marksandnumbers"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="DescriptionOfGoods" DataField="DescriptionOfGoods" AllowFiltering="true"
                    ColumnGroupName="DescriptionOfGoods" SortExpression="DescriptionOfGoods" UniqueName="DescriptionOfGoods"
                    Reorderable="true">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn HeaderText="NetWt" DataField="netwt" AllowFiltering="false"
                    Reorderable="true" DataFormatString="{0:#,0.00}">
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="GrossWt" DataField="GrossWt" AllowFiltering="false"
                    Reorderable="true" DataFormatString="{0:#,0.00}">
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Measurement" DataField="Measurement" AllowFiltering="false"                    
                    Reorderable="true" DataFormatString="{0:#,0.00}">
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="SwitchFrom" DataField="SwitchFromHBLNo" AllowFiltering="true"
                    ColumnGroupName="SwitchFromHBLNo" SortExpression="SwitchFromHBLNo" UniqueName="SwitchFromHBLNo"
                    Reorderable="true">
                </telerik:GridBoundColumn>                
                <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                    ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                    ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                    ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                    ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn Display="False" DataField="pricebreakoption" SortExpression="pricebreakoption" />
            </Columns>
        </MasterTableView>
    </telerik:radgrid>
    <%--Message popup area start--%>
    <asp:Button runat="server" ID="btnMessagePopupTargetButton" Style="display: none;" />
    <ajaxtoolkit:modalpopupextender id="mpeMessagePopup" runat="server" popupcontrolid="pnlMessageBox"
        targetcontrolid="btnMessagePopupTargetButton" okcontrolid="btnOk" cancelcontrolid="btnCancel"
        backgroundcssclass="MessageBoxPopupBackground">
    </ajaxtoolkit:modalpopupextender>
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

