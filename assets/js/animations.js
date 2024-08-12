// ########## Heart animation on hover ##########
// play animation when cursor on footer
// WARN: Order of declaration is important

let heart = document.getElementById("heart");
let footer = document.getElementById("general_footer");

const startAnimHeart = function() {
    heart.classList.add("heartBeat");
}

const stopAnimHeart = function() {
    heart.classList.remove("heartBeat");
}

footer.addEventListener("mouseenter", startAnimHeart);
footer.addEventListener("mouseleave", stopAnimHeart);