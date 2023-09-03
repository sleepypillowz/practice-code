<!DOCTYPE html>
<html>
<head>
    <!--Title at the top left--> 
    <title>Home</title>

    <!--I have no idea--> 
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--links to External CSS--> 
    <link rel="stylesheet" href="../main.css">
    <link rel="stylesheet" href="map.css">
    <link rel="stylesheet" href="map.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!--JQuery Script to import header.html--> 
    <script
        src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous">
    </script>

    <!--Load Script-->
    <script> 
        $(function(){
            $("#header").load("../header.php"); 
        });

        // Function to open images in a modal
        function openModal(imageUrl) {
            var modal = document.getElementById("imageModal");
            var modalImg = document.getElementById("modalImage");
            modal.style.display = "block";
            modalImg.src = imageUrl;
        }

        // Close the modal when the user clicks outside of it
        window.onclick = function(event) {
            var modal = document.getElementById("imageModal");
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>  



</head>
<body>
    <!--imported header-->
    <div id="header"></div>
 
    <!-- Start body -->
    <h2>Image Maps</h2>
    <p>Click on the main, the phone, or the cup of coffee to view more details:</p>

    <img src="../images/maps/gmap.jpg" alt="gmap" usemap="#main_map" width="400" height="379">

    <map name="main_map">
        <!-- Area for court (top) -->
        <area shape="rect" coords="0,0,400,126" alt="court" href="#court">
    
        <!-- Area for annexA (middle) -->
        <area shape="rect" coords="0,127,400,253" alt="annexA" href="#annexA">
    
        <!-- Area for main_bldg (bottom) -->
        <area shape="rect" coords="0,254,400,379" alt="sti_main" href="#main_bldg">
    </map>

    <div id="court" class="image-category">
        <h3>Court</h3>
        <div class="image-container">
            <!-- Other images with labels (unchanged) -->
            <div class="image-card" onclick="openModal('../images/maps/court_1f.jpg')">
                <img src="../images/maps/court_1f.jpg" alt="court_1f" width="200" height="189" id="court_1f">
                <p>Court 1F</p>
            </div>

            <div class="image-card" onclick="openModal('../images/maps/court_2f.jpg')">
                <img src="../images/maps/court_2f.jpg" alt="court_2f" width="200" height="189" id="court_2f">
                <p>Court 2F</p>
            </div>

            <div class="image-card" onclick="openModal('../images/maps/court_3f.jpg')">
                <img src="../images/maps/court_3f.jpg" alt="court_3f" width="200" height="189" id="court_3f">
                <p>Court 3F</p>
            </div>
        </div>
    </div>

    <div id="annexA" class="image-category">
        <h3>AnnexA</h3>
        <div class="image-container">
            <!-- Other images with labels (unchanged) -->
            <div class="image-card" onclick="openModal('../images/maps/annexA_1f.jpg')">
                <img src="../images/maps/annexA_1f.jpg" alt="annexA_1f" width="200" height="189" id="annexA_1f">
                <p>AnnexA 1F</p>
            </div>

            <div class="image-card" onclick="openModal('../images/maps/annexA_2f.jpg')">
                <img src="../images/maps/annexA_2f.jpg" alt="annexA_2f" width="200" height="189" id="annexA_2f">
                <p>AnnexA 2F</p>
            </div>
        </div>
    </div>

    <div id="main_bldg" class="image-category">
        <h3>Main Bldg</h3>
        <div class="image-container">
            <!-- Other images with labels (unchanged) -->
            <div class="image-card" onclick="openModal('../images/maps/main_entry.png')">
                <img src="../images/maps/main_entry.png" alt="main_entry" width="200" height="189" id="main_entry">
                <p>Main Entry</p>
            </div>

            <div class="image-card" onclick="openModal('../images/maps/main_2f.jpg')">
                <img src="../images/maps/main_2f.jpg" alt="main_2f" width="200" height="189" id="main_2f">
                <p>Main 2F</p>
            </div>

            <div class="image-card" onclick="openModal('../images/maps/main_3f.jpg')">
                <img src="../images/maps/main_3f.jpg" alt="main_3f" width="200" height="189" id="main_3f">
                <p>Main 3F</p>
            </div>
        </div>
    </div>
    
    <!-- The Modal -->
    <div id="imageModal" class="modal">
        <span class="modal-content">
            <img id="modalImage" style="width:100%">
        </span>
    </div>
    <!-- End body -->
</body>
</html>
