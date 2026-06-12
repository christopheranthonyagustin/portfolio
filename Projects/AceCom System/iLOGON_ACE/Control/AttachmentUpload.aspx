<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttachmentUpload.aspx.cs" Inherits="iWMS.Web.Control.AttachmentUpload" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html>
<html>
<head>
    <title>File Upload</title>
    <link rel="stylesheet" href="../css/FontAwesome/css/all.min.css" />
    <link rel="stylesheet" href="../css/bootstrap_5.3.0.min.css" />
    <link rel="stylesheet" href="../css/ImageUpload.css" />
    <script type="text/javascript" src="../js/jquery_3.6.1.js"></script>
    <script type="text/javascript" src="../js/bootstrap_4.5.3.js"></script>
    <script type="text/javascript" src="../js/ImageUpload.js"></script>
</head>
<body>
    <form id="Form1" runat="server" method="post" enctype="multipart/form-data">
        <telerik:RadScriptManager ID="ScriptManager" runat="server"></telerik:RadScriptManager>
         <asp:Button ID="DownloadAllBtn" runat="server" CssClass="upload-button" OnClick="DownloadAllBtn_Click" CausesValidation="false" UseSubmitBehavior="false" Text="Download All" />
        <br />
        <div class="upload-container">
            <div class="file-upload-container">
                <div class="file-upload">
                    <div class="file-upload-icon">
                        <i class="fas fa-cloud-upload-alt"></i>
                    </div>
                    <asp:FileUpload ID="FilesInput" runat="server" CssClass="fileInputhidden" ClientIDMode="Static" multiple="multiple" />
                    <!-- Container for a new file input element -->
                    <div id="NewFileInputContainer"></div>
                    <label for="FilesInput" class="file-upload-label">
                        Drag & Drop files here or <span id="BrowseLnk" class="browse-link" runat="server">browse</span>
                    </label>
                </div>
            </div>

            <div class="upload-popup" style="display: none;">
                <div class="upload-popup-header">
                    <table>
                        <tr>
                            <td>
                                <a href="#" class="upload-popup-cancel-btn">Cancel</a>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <span class="selected-file-count">0 files selected</span>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <a href="#" class="upload-popup-add-btn">
                                    <img src="../Image/add.png" width="15" height="15" /></a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="upload-popup-content">
                    <div class="selected-images"></div>
                </div>
                <div class="upload-popup-footer">
                    <asp:Button ID="UploadBtn" runat="server" CssClass="upload-button" OnClientClick="disableBtn(this.id, false)" CausesValidation="false" UseSubmitBehavior="false" />
                    <input type="hidden" id="HiddenParentId" runat="server" />
                </div>
            </div>

            <div class="edit-popup" style="display: none;">
                <div class="edit-popup-header">
                    <table>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="EditHeaderLbl" CssClass="edit-header-label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <a href="#" class="edit-popup-cancel-btn" id="CancelEditImageBtn">Cancel</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="edit-popup-content">
                    <table>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label Text="Image Name" runat="server"></asp:Label>
                                            <br />
                                            <telerik:RadTextBox runat="server" Width="250" ID="ImageNameTxt" Skin="Bootstrap"></telerik:RadTextBox>
                                        </td>
                                        <td style="padding-left: 30px">
                                            <br />
                                            <asp:Label ID="OriginalImageName" runat="server" Font-Bold="true" Font-Size="14px" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td style="padding-top: 10px">
                                            <asp:Label Text="Type" runat="server"></asp:Label>
                                            <br />
                                            <telerik:RadDropDownList ID="FileTypeDDL" OnLoad="FileTypeDDL_Load" DataTextField="Descr" DataValueField="Item" runat="server" Width="250" Skin="Bootstrap"></telerik:RadDropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-top: 10px">
                                            <asp:Label Text="Created By" runat="server"></asp:Label>
                                            <br />
                                            <telerik:RadTextBox runat="server" Width="250" ID="CreatedByTxt" Skin="Bootstrap" Enabled="false"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 10px">
                                <asp:Label Text="Notes" runat="server"></asp:Label>
                                <br />
                                <telerik:RadTextBox runat="server" Width="400" ID="NotesTxt" Skin="Bootstrap" Height="120" Resize="Both" TextMode="MultiLine"></telerik:RadTextBox>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="edit-popup-footer">
                    <input type="button" id="SaveChangesBtn" value="Save Changes" class="upload-button" />
                </div>
            </div>
        </div>

        <div class="uploaded-image-container" id="UploadImageContainer" runat="server">
            <div class="container">
                <img src="../Image/NoImageAvailable.png" id="NoImageAvailableImg" runat="server" class="noimageavailable" />
                <div class="row" id="ImageRowDiv" runat="server">
                </div>
            </div>
        </div>

        <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-lg" role="document" style="height: 500px;">
                <!-- Set the desired height for the modal -->
                <div class="modal-content" style="height: 100%;">
                    <!-- Ensure the modal content takes up the entire height -->
                    <div class="modal-header">
                        <h5 class="modal-title" id="imageModalLabel">Image</h5>
                        <button type="button" class="close" data-dismiss="modal" onclick="ImagePopupClose();">&times;</button>
                    </div>
                    <div class="modal-body" style="overflow: auto; height: 100%;">
                        <!-- Allow the modal body to scroll when needed -->
                        <iframe id="modalIframe" class="img-fluid" style="max-width: none; width: 100%; height: 100%; display: none;"></iframe>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">

            $(document).ready(function () {
                const FilesInput = document.getElementById("FilesInput");
                const FileUploadLabel = document.querySelector(".file-upload-label");
                const UploadPopup = document.querySelector(".upload-popup");
                const UploadPopupCancelButton = document.querySelector(".upload-popup-cancel-btn");
                const SelectedFilesCount = document.querySelector(".selected-file-count");
                const UploadPopupAddButton = document.querySelector(".upload-popup-add-btn");
                const SelectedImages = document.querySelector(".selected-images");
                const UploadBtn = document.getElementById("UploadBtn");
                const FileUploadContainer = document.querySelector(".file-upload-container");
                const EditHeaderLbl = document.getElementById("EditHeaderLbl");
                const EditPopup = document.querySelector(".edit-popup");
                const UploadedImageContainer = document.querySelector(".uploaded-image-container");
                const FileUploadIcon = document.querySelector(".file-upload-icon");

                let SelectedFilesArray = [];
                const CustomFileNames = {};

                // Prevent the default behavior of the label when clicked
                FileUploadLabel.addEventListener("click", (e) => {
                    e.preventDefault();
                    FilesInput.click();
                });

                // Prevent the default behavior of the label when clicked
                FileUploadIcon.addEventListener("click", (e) => {
                    e.preventDefault();
                    FilesInput.click();
                });

                // Define the AllowDrop function in the global scope
                window.AllowDrop = function (event) {
                    event.preventDefault();
                    event.target.classList.add('drag-over');
                }

                // Event listener for the dragover event on the file-upload-container
                FileUploadContainer.addEventListener("dragover", AllowDrop);

                // Event listener for the drop event on the file-upload-container
                FileUploadContainer.addEventListener("drop", HandleDrop);

                function HandleDrop(event) {
                    event.preventDefault();
                    event.target.classList.remove('drag-over');

                    // Access the dropped files from the event's dataTransfer property
                    const files = Array.from(event.dataTransfer.files);
                    console.log("Dropped Files : " + files);
                    const type = "";
                    const notes = "";

                    // Check for duplicates
                    const duplicates = files.filter(newFile => {
                        return SelectedFilesArray.some(selectedFile => selectedFile.file.name === newFile.name);
                    });

                    if (duplicates.length > 0) {
                        // Show an alert to the user with the list of duplicate files
                        const duplicateNames = duplicates.map(file => file.name).join(", ");
                        alert(`[${duplicateNames}] are already selected.`);
                        FilesInput.value = ""; // Clear the input
                    } else {

                        // Create an array of objects with 'file' and 'type' properties
                        const filesWithTypes = files.map((file) => ({ file, type, notes, id: generateUniqueId() }));

                        // Concatenate the new array with the existing SelectedFilesArray
                        SelectedFilesArray = SelectedFilesArray.concat(filesWithTypes);

                        UpdateUploadPopup();
                    }
                }

                // Event listener for the "Cancel" button click
                UploadPopupCancelButton.addEventListener("click", () => {
                    SelectedFilesArray = [];
                    UpdateUploadPopup();
                });

                // Event listener for the "Add New Image" button click
                UploadPopupAddButton.addEventListener("click", () => {
                    FilesInput.click();
                });

                FilesInput.addEventListener("click", function () {
                    this.value = null; // Reset the input so that the change event is always triggered, even if the same file is selected
                });

                // Event listener for file input change
                FilesInput.addEventListener("change", () => {
                    const files = Array.from(FilesInput.files);
                    const type = "";
                    const notes = "";

                    // Check for duplicates
                    const duplicates = files.filter(newFile => {
                        return SelectedFilesArray.some(selectedFile => selectedFile.file.name === newFile.name);
                    });

                    if (duplicates.length > 0) {
                        // Show an alert to the user with the list of duplicate files
                        const duplicateNames = duplicates.map(file => file.name).join(", ");
                        alert(`[${duplicateNames}] are already selected.`);
                        FilesInput.value = ""; // Clear the input
                    } else {


                        // Create an array of objects with 'file' and 'type' properties
                        const filesWithTypes = files.map((file) => ({ file, type, notes, id: generateUniqueId() }));

                        // Concatenate the new array with the existing SelectedFilesArray
                        SelectedFilesArray = SelectedFilesArray.concat(filesWithTypes);

                        UpdateUploadPopup();
                    }
                });

                // Function to update the UploadPopup display
                function UpdateUploadPopup() {
                    const SelectedImageCount = SelectedFilesArray.length;
                    // Update the UploadPopup header
                    if (SelectedImageCount > 0) {
                        if (SelectedImageCount == 1) {
                            SelectedFilesCount.textContent = `${SelectedImageCount} file selected`;
                            UploadBtn.value = `Upload ${SelectedImageCount} file`;
                        }
                        else {
                            SelectedFilesCount.textContent = `${SelectedImageCount} files selected`;
                            UploadBtn.value = `Upload ${SelectedImageCount} files`;
                        }
                        UploadPopupAddButton.style.display = "block";

                    } else {
                        SelectedFilesCount.textContent = "0 file selected";
                        UploadPopupAddButton.style.display = "none";
                        UploadBtn.value = "Upload";
                    }

                    SelectedImages.innerHTML = "";
                    SelectedFilesArray.forEach((fileObject) => {
                        const uniqueId = fileObject.id;
                        let file = fileObject.file; // Access the 'file' property
                        let type = fileObject.type; // Access the 'type' property
                        let notes = fileObject.notes;

                        const CustomUpdatedImageName = CustomFileNames[file.name];
                        const SelectedImageItem = document.createElement("div");
                        SelectedImageItem.classList.add("selected-image-item");

                        const ThumbNailContainer = document.createElement("div");
                        ThumbNailContainer.classList.add("image-container");

                        if (IsImageFile(file)) {
                            const ImageThumbNail = document.createElement("img");
                            ImageThumbNail.src = URL.createObjectURL(file);
                            ThumbNailContainer.appendChild(ImageThumbNail);
                        } else {
                            const IconHTML = GetPlaceholderIcon(file);
                            ThumbNailContainer.innerHTML = IconHTML;
                        }

                        const ImageInfoContainer = document.createElement("div");
                        ImageInfoContainer.classList.add("image-info-container");

                        const CancelUploadedImage = document.createElement("span");
                        CancelUploadedImage.classList.add("cancel-img-button");
                        CancelUploadedImage.innerHTML = "&#10006;";
                        CancelUploadedImage.addEventListener("click", (e) => {
                            e.preventDefault();
                            const fileToRemove = file;
                            console.log(fileToRemove);
                            RemoveSelectedFile(fileToRemove);
                        });

                        const SelectedImageName = document.createElement("span");
                        SelectedImageName.classList.add("selected-image-info");
                        if (CustomUpdatedImageName == null || CustomUpdatedImageName == "") {
                            SelectedImageName.textContent = `${file.name}`;;
                        }
                        else {
                            SelectedImageName.textContent = CustomUpdatedImageName;
                        }

                        const EditUploadedImageInfoBtn = document.createElement("button");
                        EditUploadedImageInfoBtn.style.border = "none";
                        EditUploadedImageInfoBtn.style.background = "transparent";
                        EditUploadedImageInfoBtn.classList.add("edit-img-button");

                        // Create an <img> element and set its source (URL)
                        const EditUploadedImage = document.createElement("img");
                        EditUploadedImage.id = "EditUploadedImage_" + uniqueId;
                        EditUploadedImage.src = "../Image/pencil.gif";

                        EditUploadedImageInfoBtn.appendChild(EditUploadedImage);
                        EditUploadedImageInfoBtn.addEventListener("click", (e) => {
                            e.preventDefault();
                            UploadPopup.style.display = "none";
                            FileUploadContainer.style.display = "none";
                            UploadedImageContainer.style.display = "none";
                            EditPopup.style.display = "block";

                            // Show the edit popup and pass the file for editing
                            ShowEditPopup(uniqueId, file);
                        });

                        const imageSize = document.createElement("span");
                        imageSize.classList.add("selected-image-info");
                        imageSize.textContent = `Size : ${ByteFormat(file.size)}`;

                        const Type = document.createElement("span");
                        Type.classList.add("selected-image-info");
                        Type.textContent = `Type : ${type}`;

                        const Notes = document.createElement("span");
                        Notes.classList.add("selected-image-info");
                        Notes.textContent = `Notes : ${notes}`;

                        // Append child elements to their respective containers
                        ImageInfoContainer.appendChild(CancelUploadedImage);
                        ImageInfoContainer.appendChild(document.createElement("br"));
                        ImageInfoContainer.appendChild(SelectedImageName);
                        ImageInfoContainer.appendChild(EditUploadedImageInfoBtn);
                        ImageInfoContainer.appendChild(document.createElement("br"));
                        ImageInfoContainer.appendChild(imageSize);
                        ImageInfoContainer.appendChild(document.createElement("br"));
                        ImageInfoContainer.appendChild(Type);
                        ImageInfoContainer.appendChild(document.createElement("br"));
                        ImageInfoContainer.appendChild(Notes);

                        // Append the thumbnail and details containers to the SelectedImageItem
                        SelectedImageItem.appendChild(ThumbNailContainer);
                        SelectedImageItem.appendChild(ImageInfoContainer);
                        SelectedImages.appendChild(SelectedImageItem);
                    });

                    // Show/hide the UploadPopup
                    if (SelectedImageCount > 0) {
                        UploadPopup.style.display = "block";
                        FileUploadContainer.style.display = "none";
                        UploadedImageContainer.style.display = "none";
                        EditPopup.style.display = "none";
                    } else {
                        UploadPopup.style.display = "none";
                        FileUploadContainer.style.display = "block";
                        UploadedImageContainer.style.display = "block";
                        EditPopup.style.display = "none";
                    }
                }

                function RemoveSelectedFile(fileToRemove) {
                    SelectedFilesArray = SelectedFilesArray.filter((fileObject) => fileObject.file !== fileToRemove);
                    UpdateUploadPopup();

                    // Reset the existing file input field
                    FilesInput.value = '';

                    // Create a new file input element
                    const newFileInput = document.createElement("input");
                    newFileInput.type = "file";
                    newFileInput.multiple = "multiple";
                    newFileInput.classList.add("fileInputhidden");
                    newFileInput.addEventListener("change", () => {
                        SelectedFilesArray = SelectedFilesArray.concat(Array.from(newFileInput.files));
                        UpdateUploadPopup();

                        // Remove the new file input and add another one for future selections
                        NewFileInputContainer.removeChild(newFileInput);
                        CreateNewFileInput();
                    });

                    // Add the new file input to the container
                    NewFileInputContainer.appendChild(newFileInput);
                }

                // Function to create a new file input element
                function CreateNewFileInput() {
                    const newFileInput = document.createElement("input");
                    newFileInput.type = "file";
                    newFileInput.multiple = "multiple";
                    newFileInput.classList.add("fileInputhidden");
                    newFileInput.addEventListener("change", () => {
                        SelectedFilesArray = SelectedFilesArray.concat(Array.from(newFileInput.files));
                        UpdateUploadPopup();

                        // Remove the new file input and add another one for future selections
                        NewFileInputContainer.removeChild(newFileInput);
                        CreateNewFileInput();
                    });

                    NewFileInputContainer.appendChild(newFileInput);
                }

                // Initial creation of the new file input
                CreateNewFileInput();

                function ByteFormat(bytes, decimals = 2) {
                    if (bytes === 0) return "0 Bytes";

                    const k = 1024;
                    const dm = decimals < 0 ? 0 : decimals;
                    const sizes = ["Bytes", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];

                    const i = Math.floor(Math.log(bytes) / Math.log(k));

                    return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + " " + sizes[i];
                }

                function ShowEditPopup(uniqueId, file) {
                    // Find the file to edit based on its unique ID
                    const fileObject = SelectedFilesArray.find(fileObject => fileObject.id === uniqueId && fileObject.file === file);

                    if (fileObject) {
                        const file = fileObject.file;
                        const type = fileObject.type;
                        const notes = fileObject.notes;

                        const ImageNameTxt = document.getElementById("ImageNameTxt");
                        const OriginalImageName = document.getElementById("OriginalImageName");
                        const CreatedByTxt = document.getElementById("CreatedByTxt");
                        const NotesTxt = document.getElementById("NotesTxt");
                        const SaveChangesBtn = document.getElementById("SaveChangesBtn");
                        const CancelEditImageBtn = document.getElementById("CancelEditImageBtn");
                        const TypeDDL = document.getElementById("FileTypeDDL");

                        const radDropDownList = $find("<%= FileTypeDDL.ClientID %>");
                        if (radDropDownList) {
                            radDropDownList.trackChanges(); // Start tracking changes

                            // Set the selected text to 'type' if it's not blank
                            if (type && type !== "") {
                                const items = radDropDownList.get_items();

                                for (let i = 0; i < items.get_count(); i++) {
                                    const item = items.getItem(i);
                                    if (item.get_text() === type) {
                                        item.set_selected(true);
                                        break; // Exit the loop once the correct item is found
                                    }
                                }
                            } else {
                                // Clear the selection if 'type' is blank
                                radDropDownList.get_items().getItem(0).set_selected(true); // Assuming the first item is a non-selectable empty item
                            }

                            radDropDownList.commitChanges(); // Commit changes
                        }

                        ImageNameTxt.value = file.name;
                        NotesTxt.value = notes;
                        OriginalImageName.innerText = file.name;
                        CreatedByTxt.value = '<%=CurrentUser.UserName %>';
                        EditHeaderLbl.innerText = `[${file.name}]`;
                        SaveChangesBtn.addEventListener("click", (e) => {
                            e.preventDefault();
                            this.disabled = true;
                            this.innerText = "Processing..";

                            const NewImageName = ImageNameTxt.value;
                            const NewFile = new File([file], NewImageName, { type: file.type });

                            // Update the specific file object in SelectedFilesArray using its unique ID
                            const index = SelectedFilesArray.findIndex((fileObject, idx) => {
                                return fileObject.id === uniqueId && fileObject.file === file;
                            });

                            if (index !== -1) {
                                SelectedFilesArray[index].file = NewFile;
                                SelectedFilesArray[index].type = TypeDDL.value;
                                SelectedFilesArray[index].notes = NotesTxt.value;
                            }

                            UpdateUploadPopup();
                            CloseEditPopup();

                            this.disabled = false;
                            this.innerText = "Save Changes";
                        });

                        CancelEditImageBtn.addEventListener("click", (e) => {
                            e.preventDefault();
                            CloseEditPopup();
                        });
                    }
                }

                function CloseEditPopup() {
                    // Remove the popup from the DOM
                    UploadPopup.style.display = "block";
                    EditPopup.style.display = "none";
                    UploadedImageContainer.style.display = "none";
                }

                function IsImageFile(file) {
                    const allowedExtensions = ["png", "jpg", "jpeg", "gif", "bmp", "tiff", "svg", "webp", "ico", "ai", "eps"];
                    const fileExtension = file.name.split('.').pop().toLowerCase();
                    return allowedExtensions.includes(fileExtension);
                }

                function GetPlaceholderIcon(file) {
                    const FileName = file.name;
                    const FileExtension = FileName.split('.').pop().toLowerCase();

                    // Map common file extensions to Font Awesome icons
                    const IconMapping = {
                        'pdf': { class: 'far fa-file-pdf', color: 'red' },
                        'application/pdf': { class: 'far fa-file-pdf', color: 'red' },
                        'doc': { class: 'far fa-file-word', color: 'blue' },
                        'docx': { class: 'far fa-file-word', color: 'blue' },
                        'application/vnd.openxmlfo': { class: 'far fa-file-word', color: 'blue' },
                        'xls': { class: 'far fa-file-excel', color: 'green' },
                        'xlsx': { class: 'far fa-file-excel', color: 'green' },
                        'ppt': { class: 'fa-regular fa-file-powerpoint', color: 'red' },
                        'pptx': { class: 'fa-regular fa-file-powerpoint', color: 'red' },
                        'zip': { class: 'fa-solid fa-file-zipper', color: 'black' },
                        'rar': { class: 'fa-solid fa-file-zipper', color: 'black' },
                    };

                    // Get the appropriate Font Awesome class and color for the file extension
                    const Mapping = IconMapping[FileExtension.toLowerCase()];
                    const IconClass = Mapping ? Mapping.class : 'far fa-file';
                    const IconColor = Mapping ? Mapping.color : 'black';

                    // Create the icon HTML with dynamic color
                    const IconHTML = `
                                        <div class="file-icon-container" style="width: 100px; height: 100px;">
                                            <i class="${IconClass}" style="font-size: 50px; color: ${IconColor};"></i>
                                        </div>
                                    `;

                    return IconHTML;
                }

                const formData = new FormData();

                function generateUniqueId() {
                    return '_' + Math.random().toString(36).substr(2, 9); // You can use a more robust ID generation method
                }

                document.getElementById('UploadBtn').addEventListener('click', () => {
                    const formData = new FormData();

                    const currentUser = <%= Newtonsoft.Json.JsonConvert.SerializeObject(CurrentUser) %>;
                    const CurrentUserJson = JSON.stringify(currentUser);

                    formData.append("ParentId", document.getElementById("HiddenParentId").value);
                    formData.append('CurrentUser', CurrentUserJson);

                    SelectedFilesArray.forEach((fileObject) => {
                        const file = fileObject.file;
                        const type = fileObject.type;
                        const notes = fileObject.notes;
                        const uniqueId = fileObject.id;

                        formData.append(`file${uniqueId}`, file);
                        formData.append(`Type${uniqueId}`, type);
                        formData.append(`Notes${uniqueId}`, notes);
                    });


                    // Assuming 'formData' is your FormData object
                    fetch('<%=SOURCE_PAGE %>', {
                        method: 'POST',
                        body: formData,
                        timeout: 900000 // Set timeout to 15 min (in milliseconds)
                    })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Error uploading files');
                            }
                            // Handle success if needed
                        })
                        .catch(error => {
                            alert(error.message);
                        });
                });
            });
        </script>


        <script type="text/javascript">
            function DeleteButtonClick(e, Button) {
                if (confirm("Are you sure you want to delete this image?")) {
                    disableButton(Button);
                    var ImageId = Button.getAttribute("data-imageid");
                    var ImageName = Button.getAttribute("data-imagename");

                    $.ajax({
                        url: 'AttachmentUpload.aspx/DeleteImage',
                        data: JSON.stringify({
                            ImageId: ImageId,
                            ImageName: ImageName
                        }),
                        type: 'POST',
                        contentType: "application/json; charset=utf-8",
                        success: function (result) {
                            if (result.d) {
                                __doPostBack('DeleteBtn', '');
                                alert(result.d);
                            }
                        },
                        failure: function (response) {
                            alert(response);
                        }
                    });
                }
            }

            function SaveButtonClick(e, Button) {
                disableButton(Button);
                var ImageId = Button.getAttribute("data-imageid");
                var ImageName = Button.getAttribute("data-imagename");
                // Access the TypeDDL ID
                var TypeDDLId = Button.getAttribute("data-typeddlid");
                var TypeDDL = $find(TypeDDLId); // Use the $find function to get the RadDropDownList object

                var NotesTxtId = Button.getAttribute("data-notestxtid");
                var NotesTxt = $find(NotesTxtId);

                // Get the selected item
                var SelectedTypeValue = "";
                var SelectedTypeText = "";
                var SelectedItem = TypeDDL.get_selectedItem();

                if (SelectedItem) {
                    SelectedTypeValue = SelectedItem.get_value();
                    SelectedTypeText = SelectedItem.get_text();
                }

                var Notes = NotesTxt.get_value();

                $.ajax({
                    url: 'AttachmentUpload.aspx/SaveInfo',
                    data: JSON.stringify({
                        ImageId: ImageId,
                        ImageName: ImageName,
                        Type: SelectedTypeValue,
                        TypeDescr: SelectedTypeText,
                        Notes: Notes
                    }),
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        if (result.d) {
                            alert(result.d);
                            __doPostBack('', '');
                        }
                    },
                    failure: function (response) {
                        alert(response);
                    }
                });
            }

            function DownloadAllButtonClick(e, Button) {
                disableButton(Button);
                $.ajax({
                    url: 'AttachmentUpload.aspx/DownloadAll',
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                    },
                    failure: function (response) {
                        alert(response);
                    }
                });
            }
        </script>
    </form>
</body>
</html>
