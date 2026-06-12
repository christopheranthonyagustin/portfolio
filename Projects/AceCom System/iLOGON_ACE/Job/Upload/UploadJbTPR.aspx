<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadJbTPR.aspx.cs" Inherits="iWMS.Web.Job.Upload.UploadJbTPR" %>

<%@ Register Src="../../Control/iFormCtl.ascx" TagName="iform" TagPrefix="iwms" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>UploadJbTPR</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <link href="../../css/iWMS.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1
        {
            width: 15%;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" runat="server" style="z-index: 0">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table id="FormTable" border="0" cellspacing="0" cellpadding="0" width="100%" runat="server">
        <tr>
            <td colspan="2">
                <asp:Label ID="headerLbl1" runat="server" CssClass="pagetitle">Upload Transport Instructions :</asp:Label><br>
                <br>
            </td>
            <td width="40%">
            </td>
            <td width="40%">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <iwms:iform ID="formCtl" runat="server"></iwms:iform>
            </td>
            <td rowspan="7" valign="top">
                <asp:Label ID="lblErrLog" runat="server" CssClass="BlackText" ForeColor="#FF0000"
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="excelLbl" runat="server">File Location:</asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="excelFile" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style1">
            </td>
            <td>
                <asp:Label ID="lblnote" Text="Note : Only Microsoft Excel files can be Uploaded."
                    runat="server"></asp:Label><br />
                <br />
                <asp:Button ID="excelSend" Text=" SEND TO SERVER " runat="server" OnClick="excelSend_Click" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="excelssLbl" runat="server" Visible="false">Spreadsheet Name:</asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="excelssDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged="excelssDDL_SelectedIndexChanged"
                    Visible="false" />
                <br />
                <asp:Button ID="excelssBtn" Text="Get WorkSheet" runat="server" CssClass="formbtn"
                    Visible="false" />
                <asp:Label ID="warningLbl" CssClass="BlackText" runat="server" Visible="false">Please close excel file (if still open) before clicking Get Worksheet</asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                <asp:Button ID="retrieveBtn" Text=" RETRIEVE " runat="server" CssClass="formbtn"
                    OnClick="retrieveBtn_Click" />
                <asp:RegularExpressionValidator ID="excelVal" runat="server" ControlToValidate="excelFile"
                    ErrorMessage="This is not a valid file type" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.xls|.XLS)$"
                    Visible="False" />
                <br />
                <asp:Label ID="lblErrRetrieve" CssClass="BlackText" runat="server" Visible="False"
                    ForeColor="#ff0000"></asp:Label><br>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                <asp:Button ID="uploadBtn" CssClass="formbtn" Text=" UPLOAD " runat="server" OnClick="uploadBtn_Click" />
                <br />
                <asp:Label ID="lblErrUpload" CssClass="BlackText" runat="server" Visible="False"
                    ForeColor="#FF0000">Please fill in all information before clicking upload.</asp:Label>
                <br />
                <br />
            </td>
        </tr>
    </table>
    <br />
    <div id="div-datagrid" style="height: 92%">
        <asp:DataGrid ID="ResultDG" runat="server" CellPadding="2" BorderStyle="None" UseAccessibleHeader="True"
            AutoGenerateColumns="False">
            <AlternatingItemStyle CssClass="DGAlternateItem"></AlternatingItemStyle>
            <ItemStyle CssClass="DGItem"></ItemStyle>
            <HeaderStyle Wrap="False"></HeaderStyle>
            <Columns>
                <asp:BoundColumn DataField="InvoiceNo" HeaderText="Invoice No">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="CustomerCode" HeaderText="Customer Code">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="CustomerName" HeaderText="Customer Name">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Remarks" HeaderText="Remarks">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="SystemDeliveryDate" HeaderText="System Delivery Date"
                    DataFormatString="{0:dd/MM/yy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="SystemCollectionDate" HeaderText="System Collection Date"
                    DataFormatString="{0:dd/MM/yy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="PoNo" HeaderText="Po No">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="NoOfPackages" HeaderText="No Of Packages">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="NoOfPallet" HeaderText="No Of Pallet" DataFormatString="{0:#,0.##}"
                    Visible="False">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="DeliveryDate" HeaderText="Delivery Date" DataFormatString="{0:dd/MM/yy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
                <asp:BoundColumn DataField="CollectionDate" HeaderText="Collection Date" DataFormatString="{0:dd/MM/yyyy}">
                    <HeaderStyle Wrap="False"></HeaderStyle>
                    <ItemStyle Wrap="False"></ItemStyle>
                </asp:BoundColumn>
            </Columns>
        </asp:DataGrid>
    </div>
    </form>
</body>
</html>
