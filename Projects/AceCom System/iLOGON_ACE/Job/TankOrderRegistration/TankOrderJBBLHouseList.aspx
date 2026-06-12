<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TankOrderJBBLHouseList.aspx.cs" Inherits="iWMS.Web.Job.TankOrderRegistration.TankOrderJBBLHouseList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head id="Head1" runat="server">
    <title> Choose-a-Tank pop-up</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">
    <base target="_self">
    <meta http-equiv="Pragma" content="no-cache" />

    
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
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    
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
                    <HeaderStyle Wrap="False" HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <asp:CheckBox ID="SelectALLCB" runat="server" Checked="true" onclick="selectAll(this)" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkObjective" runat="server" Checked="true"/>                    
                    </ItemTemplate>
                    <ItemStyle Wrap="false" />
                </telerik:GridTemplateColumn>                
                <telerik:GridBoundColumn HeaderText="JbID" DataField="jbid" Display="false">                  
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="BLNo" DataField="blno" AllowFiltering="false">
                </telerik:GridBoundColumn> 
                <telerik:GridBoundColumn HeaderText="BLType" DataField="bltype">                
                </telerik:GridBoundColumn>     
                <telerik:GridBoundColumn HeaderText="BLSurrendedIn" DataField="blsurrendedin"  Display="false" >                
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn HeaderText="FreightType" DataField="freighttype" Display="false">               
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn HeaderText="ShippingTerms" DataField="shippingterms" Display="false" >                
                 </telerik:GridBoundColumn> 
                <telerik:GridBoundColumn HeaderText="MBLNo" DataField="mblno" Display="false">                
                </telerik:GridBoundColumn>     
                <telerik:GridBoundColumn HeaderText="Shipper" DataField="exporteraddr" Display="false" >                
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn HeaderText="Consignee" DataField="consigneeaddr" Display="false">
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn HeaderText="VesselVoyage" DataField="vessel" Display="false" >
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn HeaderText="POL" DataField="pol" Display="false" >
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn HeaderText="POD" DataField="pod" Display="false" >
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn HeaderText="FinalDestination" DataField="finaldestination" Display="false" >  
                </telerik:GridBoundColumn>    
                <telerik:GridBoundColumn HeaderText="Marks&Nos" DataField="marksandnumbers" AllowFiltering="true">
                </telerik:GridBoundColumn>               
                <telerik:GridBoundColumn HeaderText="NoOfContainers" DataField="noofpackages" AllowFiltering="true" Display="false">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn HeaderText="DescriptionOfGoods" DataField="DescriptionOfGoods" AllowFiltering="true" Display="false">
                </telerik:GridBoundColumn>
                 <telerik:GridBoundColumn HeaderText="NetWt" DataField="netwt" DataFormatString="{0:#,0.00}" Display="false">
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="GrossWt" DataField="GrossWt" DataFormatString="{0:#,0.00}" Display="false">
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="Measurement" DataField="Measurement" DataFormatString="{0:#,0.00}" Display="false">
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn HeaderText="TotalPackages" DataField="totalpackages"  DataFormatString="{0:#,0.00}" Display="false">
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn> 
                 <telerik:GridBoundColumn HeaderText="NoOfOriginalBL" DataField="nooforiginalbl" DataFormatString="{0:#,0.00}" Display="false">
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn HeaderText="PODREFreeDays" DataField="podrefreedays" DataFormatString="{0:#,0.00}" Display="false">
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn>  
                <telerik:GridBoundColumn HeaderText="DemurrageRateDaily" DataField="demurrageratedaily"  DataFormatString="{0:#,0.00}" Display="false">
                    <ItemStyle HorizontalAlign="Right" />
                </telerik:GridBoundColumn> 
                <telerik:GridBoundColumn HeaderText="DemurrageRateCurrCode" DataField="DemurrageRateCurrCode" Display="false" >      
                </telerik:GridBoundColumn>                 
                 <telerik:GridBoundColumn HeaderText="DataOfIssue" DataField="dateofissue" 
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Display="false">
                </telerik:GridBoundColumn>             
                <telerik:GridBoundColumn HeaderText="AddDate" DataField="adddate" AllowFiltering="true"
                    ColumnGroupName="adddate" SortExpression="adddate" UniqueName="adddate" Reorderable="true"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="AddUser" DataField="adduser" AllowFiltering="true"
                    ColumnGroupName="adduser" SortExpression="adduser" UniqueName="adduser" Reorderable="true"  Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="EditDate" DataField="editdate" AllowFiltering="true"
                    ColumnGroupName="editdate" SortExpression="editdate" UniqueName="editdate" Reorderable="true"
                    DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"  Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn HeaderText="EditUser" DataField="edituser" AllowFiltering="true"
                    ColumnGroupName="edituser" SortExpression="edituser" UniqueName="edituser" Reorderable="true" Display="false" >
                </telerik:GridBoundColumn> 
                <%--<telerik:GridBoundColumn HeaderText="GoodsVol" DataField="goodsvol" AllowFiltering="false" DataFormatString="{0:#,0.00}">
                </telerik:GridBoundColumn> --%>                      
            </Columns>
        </MasterTableView>
    </telerik:radgrid>
    <br /><br /><br />
    
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
        <td>&nbsp;&nbsp;&nbsp;</td>
        <td>&nbsp;&nbsp;&nbsp;</td>
        <td>&nbsp;&nbsp;&nbsp;</td>
            <td>
                <telerik:radbutton id="OkBtn" runat="server" text="Ok" visible="true"
                    cssclass="detailButton" onclick="OkBtn_Click" skin="WebBlue">
                </telerik:radbutton>  
                 &nbsp;
                <telerik:radbutton id="CancelBtn" runat="server" text="Cancel" visible="true"
                    cssclass="detailButton" onclick="CancelBtn_Click" skin="WebBlue">
                </telerik:radbutton> 
                
            </td>
      </tr>
     </table>
    </form>
</body>
</html>

