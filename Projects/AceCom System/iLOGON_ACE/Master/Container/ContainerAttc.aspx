<%@ Page Language="c#" CodeBehind="ContainerAttc.aspx.cs" AutoEventWireup="True" Inherits="iWMS.Web.Master.Container.ContainerAttc" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head runat="server">
    <title>SkuImage</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
     <link rel="stylesheet" type="text/css" href="../../css/iWMS.css" />
    <script src="../../js/Script.js" type="text/javascript"></script>
    <meta http-equiv="Pragma" content="no-cache">    
   
    <style type="text/css">
        .style1
        {
            width: 294px;
        }
    </style>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" method="post" enctype="multipart/form-data" runat="server">
    <asp:ScriptManager ID="ToolkitScriptManager1" runat="server" />
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td>
                <br />
                <asp:Button ID="ImageSubmit" CssClass="white" runat="server" OnClick="ImageSubmit_ServerClick" 
                                    Text="Add" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <asp:Button ID="BackButton" CssClass="white" runat="server" OnClick="BackButton_Click" 
                                    Text="Hide" CausesValidation="False" OnClientClick="disableBtn(this.id)" UseSubmitBehavior="false" />
                <br>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="NoImageLbl" runat="server" Visible="False" CssClass="errorLabelBig">No Image Available</asp:Label><br>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="FileUploadPanel" runat="server">
                    <table border="0" cellspacing="2" cellpadding="2" width="100%">
                        <tr>
                            <td class="style1">
                                Type<br />
                                <telerik:RadDropDownList ID="Type" runat="server" Enabled="True" DataTextField="Descr"
                                    DataValueField="item" Width="138px" Skin="WebBlue">
                                </telerik:RadDropDownList>
                                <asp:RequiredFieldValidator ID="TypeReq" runat="server" ControlToValidate="Type"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                Status<br />
                                <telerik:RadDropDownList ID="ImageStatus" runat="server" Enabled="true" DataTextField="Descr"
                                    DataValueField="item" Width="138px" Skin="WebBlue">
                                </telerik:RadDropDownList>
                            </td>
                        </tr>
                         <tr>
                        <td class="style1">
                                FromDate<br />                                                          
                                 <telerik:RadDatePicker ID="FrmDateTxt" runat="server" Enabled="True"
                                   DateInput-DateFormat="dd/MMM/yyyy" 
                                 DateInput-DisplayDateFormat="dd/MMM/yyyy"  DateInput-Display="true" >                                
                                 </telerik:RadDatePicker>
                          </td>                           
                            <td>
                                ToDate<br />                             
                                 <telerik:RadDatePicker ID="ToDateTxt" runat="server" Enabled="True" DateInput-DateFormat="dd/MMM/yyyy" 
                                 DateInput-DisplayDateFormat="dd/MMM/yyyy"  DateInput-Display="true" >
                                 </telerik:RadDatePicker>
                            </td>
                          </tr>
                        <tr>
                            <td class="style1">
                                Remarks1<br />
                                <telerik:RadTextBox ID ="Remarks1" runat ="server" Height="80px" Width="155px" Rows="3" TextMode="MultiLine" ></telerik:RadTextBox>
                               <%-- <asp:TextBox ID="Remarks1" runat="server" Height="90px" Width="249px" TextMode="MultiLine"></asp:TextBox>--%>
                                
                            </td>
                             <td>
                                Remarks2<br />
                                <telerik:RadTextBox ID ="Remarks2" runat ="server" Rows="3" Height="80px" Width="155px" TextMode="MultiLine" ></telerik:RadTextBox>
                               <%-- <asp:TextBox ID="Remarks2" runat="server" Height="90px" Width="249px" TextMode="MultiLine"></asp:TextBox>--%>
                             </td> 
                        </tr>   
                        <tr>
                            <td class="style1">
                                AttachmentName<br />
                                <telerik:RadTextBox ID="ImageName" runat="server">
                                </telerik:RadTextBox>
                                &nbsp;
                                <telerik:RadLabel ID="MessageLbl" runat="server" CssClass="errorLabel">
                                </telerik:RadLabel>
                            </td>
                            <td>
                                <telerik:RadLabel ID="FileLbl" runat="server" Text="File">
                                </telerik:RadLabel>
                                <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1" MultipleFileSelection="Automatic" />
                            </td>
                        </tr>
                        <input id="ImageNameNA" runat="server" name="ImageName" visible="false" />
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>