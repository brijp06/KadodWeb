$(document).ready(function () {
    var usname = localStorage.getItem("uname");
    var upassword = localStorage.getItem("upassword");

    if (usname != "") {
        $('#txtuserid').val(usname)
    }

    if (upassword != "") {
        $('#txtpass').val(upassword)
    }
   

    function getUrlParameter(name) {
        var urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }

    // Check if the URL has the "isAuth" parameter
    var isAuthValue = getUrlParameter('isAuth');

    if (isAuthValue !== null) {                

        // Example: Show an alert based on the isAuth value
        if (isAuthValue === 'false') {
            Swal.fire({
                icon: "error",
                title: "Oops... Username or Passowrd is Incorrent",
            });
        }
        else {
           

        }
    }
    $("#btnsave").click(function () {
        var usname = $('#txtuserid').val();
        var upassword = $('#txtpass').val();
        //window.location.href = '/KhatarSale/index?saltype="Khatar"';
        window.location.href = '/KhatarSale/index?saltype=Khatar';

        
    });
    $("#btnsaveb").click(function () {
        var usname = $('#txtuserid').val();
        var upassword = $('#txtpass').val();
        //window.location.href = '/KhatarSale/index?saltype="Khatar"';
        window.location.href = '/KhatarSale/index?saltype=Bhandar';
    });

});