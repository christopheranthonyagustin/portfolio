<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostingSheetRegisterV2CleaningCostList.aspx.cs" Inherits="iWMS.Web.Sales.CostingSheetRegisterV2.CostingSheetRegisterV2CleaningCostList" %>

<<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Costing Sheet CleaningCost List</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />
    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>
    <style type="text/css">
        .graytitle
        {
            font-weight: bold;
        }
        .style2
        {
        }
        .style3
        {
            width: 12px;
        }
        .style4
        {
            width: 143px;
        }
        .stylewrap
        {
        	white-space: pre-line;
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
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <br />
    <table width="100%">
        <tr>
            <td align="right">
                 <telerik:radbutton id="PopulateToCSBtn" runat="server" text="PopulateToCS" visible="true"
                    cssclass="detailButton" onclick="PopulateToCSBtn_Click" skin="WebBlue">
                </telerik:radbutton>
            </td>
        </tr>
    </table>
    <br /><br />   
    <telerik:RadGrid id="ResultDG" runat="server" autogeneratecolumns="false" gridlines="None"
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
                    <HeaderStyle Wrap="False" HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <asp:CheckBox ID="SelectALLCB" runat="server" onclick="selectAll(this)" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" />                    
                    </ItemTemplate>
                    <ItemStyle Wrap="false" />
                </telerik:GridTemplateColumn>  
                <telerik:GridBoundColumn HeaderText="VQID" DataField="vqid" Display="false">                  
                </telerik:GridBoundColumn>   
                <telerik:GridBoundColumn HeaderText="VendorCode" DataField="VendorCode" AllowFiltering="false">                  
                </telerik:GridBoundColumn>            
                <telerik:GridBoundColumn HeaderText="QUNumber" DataField="QUNumber" AllowFiltering="false">                  
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="POL" DataField="POLDescr" AllowFiltering="false">
                </telerik:GridBoundColumn> 
                <telerik:GridBoundColumn HeaderText="POD" DataField="PODDescr" AllowFiltering="false">
                </telerik:GridBoundColumn>     
                <telerik:GridBoundColumn HeaderText="ShipperName" DataField="ShipperName" AllowFiltering="false">
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn HeaderText="Commodity" DataField="CommodityDescr" AllowFiltering="false">
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn HeaderText="DG" DataField="DG" AllowFiltering="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Charge" DataField="ChargeDescr" AllowFiltering="false">
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn HeaderText="EstUnitCost" DataField="EstUnitCost" AllowFiltering="false" DataFormatString="{0:#,0.00}">
                <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>                          
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    
     <%--Message popup area start--%>
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
