window.onload = resize;
window.onresize = resize;
function resize() {
    var height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
    height = height - 50;
    var mainArticle = document.getElementById("mainArticle");
    mainArticle.style.height = height + 'px';
}