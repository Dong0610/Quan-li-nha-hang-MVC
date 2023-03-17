﻿let arrow = document.querySelectorAll(".arrow");
for (var i = 0; i < arrow.length; i++) {
    arrow[i].addEventListener("click", (e) => {
        let arrowParent = e.target.parentElement.parentElement; //selecting main parent of arrow
        arrowParent.classList.toggle("showMenu");
    });
}
let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".bx-menu");
sidebarBtn.addEventListener("click", () => {
    sidebar.classList.toggle("close");
});
let infuser = document.getElementById("list_info_user");
function ShowUserInf() {
    infuser.style.display = "block";
}
function HideInf() {
    infuser.style.display = "none";
}
function CloseViewDetali() {
    $("#detail_val_sp").css("display", "none");
}
