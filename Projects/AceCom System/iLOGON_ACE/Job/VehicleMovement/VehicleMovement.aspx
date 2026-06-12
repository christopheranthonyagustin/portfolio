<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VehicleMovement.aspx.cs"
    Inherits="iWMS.Web.Job.VehicleMovement.VehicleMovement" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VehicleMovement</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="../../css/iWMS.css">

    <script language="javascript" src="../../js/fullscreen.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table width="100%">
        <tr class="graytitle">
            <td width="70%" align="right">
                <asp:Label ID="colindexLbl" runat="server" Visible="false"></asp:Label>
                <a id="ExportExcelLnk" runat="server" onserverclick="ExportExcel">
                    <img id="excelImg" border="0" alt="Export to Excel" align="absMiddle" src="../../Image/excel.gif"
                        height="20" runat="server">
                </a>
            </td>
        </tr>
    </table>
    <div id="div-datagrid" style="height: 85%">
        <%--<asp:datagrid id="ResultDG" runat="server" AutoGenerateColumns="false" BorderStyle="None" GridLines="Both"
			CellPadding="2" UseAccessibleHeader="True" ItemStyle-Wrap="False" OnItemDataBound="ResultDG_ItemDataBound" OnItemCommand="ResultDG_ItemCommand" >
			<AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
			<ItemStyle CssClass="DGItem"></ItemStyle>
			<Columns>			 
			  <asp:TemplateColumn>
			    <ItemTemplate>
			      <asp:ImageButton ID="extJobImgBtn" runat="server" AlternateText="Extend Job" 
			        ToolTip="Extend Job 1 More Mth" ImageUrl="~/Image/CalExt.png" CommandName="Edit" CausesValidation="true"/>
			    </ItemTemplate>
			  </asp:TemplateColumn>
			  <asp:BoundColumn HeaderText="RegisteredEntity" DataField="registerentity" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="VehNo" DataField="vehno" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="VehDescr" DataField="vehdescr" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="VehMfgYr" DataField="vehyearmfg" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="VehMake" DataField="vehmake" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="VehModel" DataField="vehmodel" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="VehChassisNo" DataField="vehchassisno" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="LMCertFrDate" DataField="LMFrDate" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="LMCertToDate" DataField="LMToDate" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="NEALicense" DataField="NEALicense" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="Personnel" DataField="Personnel"></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="JobNo" DataField="JobNo" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="CustRef" DataField="exref1" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="Account" DataField="accode" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="CommenceOn" DataField="firstdate" DataFormatString="{0:dd/MMM/yyyy}" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="CommenceTill" DataField="lastdate" DataFormatString="{0:dd/MMM/yyyy}" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="FrAddr" DataField="FrAddr" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="ToAddr" DataField="ToAddr" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="Boom/Jib" DataField="Boom/Jib" ></asp:BoundColumn>
			  <asp:BoundColumn HeaderText="JobDescr" DataField="JobDescr" ></asp:BoundColumn>
			</Columns>
		</asp:datagrid>--%>
        <asp:GridView ID="GridView1" runat="server" BorderStyle="None" AutoGenerateColumns="False"
            Width="100%" GridLines="Both" ShowHeader="true" CellPadding="2" UseAccessibleHeader="true"
            RowStyle-Wrap="false" OnRowDataBound="ResultDG_ItemDataBound">
            <AlternatingRowStyle CssClass="DGAlternateItem"></AlternatingRowStyle>
            <RowStyle CssClass="DGItem"></RowStyle>
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="extJobImgBtn" runat="server" AlternateText="Extend Job" ToolTip="Extend Job 1 More Mth"
                            ImageUrl="~/Image/CalExt.png" CommandName="Select" OnClick="imgBtn_Clicked" OnClientClick="return confirm('Confirm to extend job');" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="RegisteredEntity">
                    <ItemTemplate>
                        <asp:Label ID="regentLbl" runat="server" Text='<%# Eval("registerentity") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VehNo">
                    <ItemTemplate>
                        <asp:Label ID="vehnoLbl" runat="server" Text='<%# Eval("vehno") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VehDescr">
                    <ItemTemplate>
                        <asp:Label ID="vehdescrLbl" runat="server" Text='<%# Eval("vehdescr") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VehMfgYr">
                    <ItemTemplate>
                        <asp:Label ID="vehmfgyrLbl" runat="server" Text='<%# Eval("vehyearmfg") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VehMake">
                    <ItemTemplate>
                        <asp:Label ID="vehmakeLbl" runat="server" Text='<%# Eval("vehmake") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VehModel">
                    <ItemTemplate>
                        <asp:Label ID="vehmodelLbl" runat="server" Text='<%# Eval("vehmodel") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VehChassisNo">
                    <ItemTemplate>
                        <asp:Label ID="vehchassisnoLbl" runat="server" Text='<%# Eval("vehchassisno") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LMCertFrDate">
                    <ItemTemplate>
                        <asp:Label ID="lmfrmLbl" runat="server" Text='<%# Eval("LMFrDate") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LMCertToDate">
                    <ItemTemplate>
                        <asp:Label ID="lmtoLbl" runat="server" Text='<%# Eval("LMToDate") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="NEALicense">
                    <ItemTemplate>
                        <asp:Label ID="neaLbl" runat="server" Text='<%# Eval("NEALicense") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Personnel">
                    <ItemTemplate>
                        <asp:Label ID="perLbl" runat="server" Text='<%# Eval("Personnel") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="JobNo">
                    <ItemTemplate>
                        <asp:Label ID="jbLbl" runat="server" Text='<%# Eval("JobNo") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CustRef">
                    <ItemTemplate>
                        <asp:Label ID="exref1" runat="server" Text='<%# Eval("exref1") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Account">
                    <ItemTemplate>
                        <asp:Label ID="accLbl" runat="server" Text='<%# Eval("accode") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CommenceOn">
                    <ItemTemplate>
                        <asp:Label ID="startLbl" runat="server" Text='<%# Eval("firstdate") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CommenceTill">
                    <ItemTemplate>
                        <asp:Label ID="endLbl" runat="server" Text='<%# Eval("lastdate") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FrAddr">
                    <ItemTemplate>
                        <asp:Label ID="frLbl" runat="server" Text='<%# Eval("FrAddr") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ToAddr">
                    <ItemTemplate>
                        <asp:Label ID="toLbl" runat="server" Text='<%# Eval("ToAddr") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Boom/Jib">
                    <ItemTemplate>
                        <asp:Label ID="bmjbLbl" runat="server" Text='<%# Eval("Boom/Jib") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="JobDescr">
                    <ItemTemplate>
                        <asp:Label ID="jbdescrLbl" runat="server" Text='<%# Eval("JobDescr") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
