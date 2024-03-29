<!DOCTYPE html>

<!--

HOW TO CREATE A UPLOAD FORM [TUTORIAL]

"How to create a Upload Form [Tutorial]" was specially made for DesignModo by our friend Valeriu Timbuc.

Links:
http://vtimbuc.net/
https://twitter.com/vtimbuc
http://designmodo.com
http://vladimirkudinov.com

-->

<html lang="en">

<head>

  <meta charset="utf-8">

  <title>Upload Form Tutorial - by Valeriu Timbuc for Design Modo</title>

  <!-- Stylesheets -->
  <link rel="stylesheet" href="css/style7.css" media="screen">

  <!-- Scripts -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
  <script src="js/plupload.full.js"></script>
  <script src="js/jquery-progressbar.min.js"></script>
  <script>
    // Upload Form
    $(function() {
      // Settings ////////////////////////////////////////////////
      var uploader = new plupload.Uploader({
        runtimes : 'html5,flash,silverlight', // Set runtimes, here it will use HTML5, if not supported will use flash, etc.
        browse_button : 'pickfiles', // The id on the select files button
        multi_selection: false, // Allow to select one file each time
        container : 'uploader', // The id of the upload form container
        max_file_size : '800kb', // Maximum file size allowed
        url : 'upload.php', // The url to the upload.php file
        flash_swf_url : 'js/plupload.flash.swf', // The url to thye flash file
        silverlight_xap_url : 'js/plupload.silverlight.xap', // The url to the silverlight file
        filters : [ {title : "Image files", extensions : "jpg,gif,png"} ] // Filter the files that will be showed on the select files window
      });

      // RUNTIME
      uploader.bind('Init', function(up, params) {
        $('#runtime').text(params.runtime);
      });

      // Start Upload ////////////////////////////////////////////
      // When the button with the id "#uploadfiles" is clicked the upload will start
      $('#uploadfiles').click(function(e) {
        uploader.start();
        e.preventDefault();
      });

      uploader.init(); // Initializes the Uploader instance and adds internal event listeners.

      // Selected Files //////////////////////////////////////////
      // When the user select a file it wiil append one div with the class "addedFile" and a unique id to the "#filelist" div.
      // This appended div will contain the file name and a remove button
      uploader.bind('FilesAdded', function(up, files) {
        $.each(files, function(i, file) {
          $('#filelist').append('<div class="addedFile" id="' + file.id + '">' + file.name + '<a href="#" id="' + file.id + '" class="removeFile"></a>' + '</div>');
        });
        up.refresh(); // Reposition Flash/Silverlight
      });

      // Error Alert /////////////////////////////////////////////
      // If an error occurs an alert window will popup with the error code and error message.
      // Ex: when a user adds a file with now allowed extension
      uploader.bind('Error', function(up, err) {
        alert("Error: " + err.code + ", Message: " + err.message + (err.file ? ", File: " + err.file.name : "") + "");
        up.refresh(); // Reposition Flash/Silverlight
      });

      // Remove file button //////////////////////////////////////
      // On click remove the file from the queue
      $('a.removeFile').live('click', function(e) {
        uploader.removeFile(uploader.getFile(this.id));
        $('#'+this.id).remove();
        e.preventDefault();
      });

      // Progress bar ////////////////////////////////////////////
      // Add the progress bar when the upload starts
      // Append the tooltip with the current percentage
      uploader.bind('UploadProgress', function(up, file) {
        var progressBarValue = up.total.percent;
        $('#progressbar').fadeIn().progressbar({
          value: progressBarValue
        });
        $('#progressbar .ui-progressbar-value').html('<span class="progressTooltip">' + up.total.percent + '%</span>');
      });

      // Close window after upload ///////////////////////////////
      // If checkbox is checked when the upload is complete it will close the window
      uploader.bind('UploadComplete', function() {
        if ($('.upload-form #checkbox').attr('checked')) {
          $('.upload-form').fadeOut('slow');
        }
      });

      // Close window ////////////////////////////////////////////
      // When the close button is clicked close the window
      $('.upload-form .close').on('click', function(e) {
        $('.upload-form').fadeOut('slow');
        e.preventDefault();
      });

    }); // end of the upload form configuration

    // Check Box Styling
    $(document).ready(function() {

      var checkbox = $('.upload-form span.checkbox');

      // Check if JavaScript is enabled
      $('body').addClass('js');

      // Make the checkbox checked on load
      checkbox.addClass('checked').children('input').attr('checked', true);

      // Click function
      checkbox.on('click', function() {

        if ($(this).children('input').attr('checked')) {
          $(this).children('input').attr('checked', false);
          $(this).removeClass('checked');
        }

        else {
          $(this).children('input').attr('checked', true);
          $(this).addClass('checked');
        }

      });

    });
  </script>

  <!-- Preview Styles -->
  <style type="text/css">
    html, body { margin: 0;	padding: 0; }
    body { background: #f2f2f2 url(img/bg.png) no-repeat top center; padding-top: 265px; }
    #uploader { margin: 0 auto; }
    .info { text-align: center; padding: 50px 0; color: #666; font-family: Helvetica, Arial, sans-serif; }
    #runtime { text-transform: uppercase; }
    .info span { color: #81c468; }
  </style>
  <meta name="robots" content="noindex,follow" />
</head>

<body>

<div class="upload-form" id="uploader">

  <!-- Form Heading -->
  <h1 class="replace-text">Upload Form</h1>
  <a href="#" class="close" title="Close Window"><img src="img/close-button.png" alt="Close"></a>

  <p>Laos, alongside many of its Southeast Asian neighbours, is well known for producing.</p>

  <!-- Select & Upload Button -->
  <div>
    <a class="button" id="pickfiles" href="#">Select</a>
    <a class="button" id="uploadfiles" href="#">Upload</a>
  </div>

  <!-- File List -->
  <div id="filelist" class="cb"></div>

  <!-- Progress Bar -->
  <div id="progressbar"></div>

  <!-- Close After Upload -->
  <div id="closeAfter">
		<span class="checkbox">
			<input type="checkbox" name="checkbox" id="checkbox">
			<label for="checkbox">Close window after upload</label>
		</span>
  </div>

</div>

<div class="info">Max File Size <span>800KB</span> | Only <span>Images</span> Allowed | Using <span id="runtime"></span></div>

</body>

</html>