<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ModalPopup.ascx.cs" Inherits="iWMS.Web.Control.ModalPopup" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function ShowModalPopup() {
        $('#Modalpopup').modal('show');
    }

    //Clear Data when Modal popup closed
    $(document).on('hidden.bs.modal', '#Modalpopup', function () {
        document.location.href = document.location.href
    })
</script>

<div class="modal fade" id="Modalpopup" tabindex="-1" role="dialog" aria-labelledby="HeaderLbl" aria-hidden="true" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog" id="PopupSizeDiv" runat="server">
        <div class="modal-content">
            <div class="modal-header">
                <asp:Label ID="HeaderLbl" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body" id="content">
                <iframe id="BodyFrame" runat="server" width="100%" frameborder="0"></iframe>
            </div>
            <div class="modal-footer">
                <button type="submit" class="white" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
