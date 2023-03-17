


function ShowPass() {
    var ispass = document.getElementById("check_showpass");

    if (ispass.checked == true) {
        document.getElementById("password_user").type = "text";
        document.getElementById("repass").type = "text";
    }
    else {
        document.getElementById("password_user").type = "password";
        document.getElementById("repass").type = "password";

    }

}
function ShowPassReg() {
    var ispass = document.getElementById("check_showpassREG");
    if (ispass.checked == true) {
        document.getElementById("password_userREG").type = "text";
    }
    else {
        document.getElementById("password_userREG").type = "password";
    }
}