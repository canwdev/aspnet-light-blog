
$(document).ready(function () {
    $("#{$active}").addClass('active');
});
//导航条菜单
$('.nav .dropdown').mouseenter(function () {
    $(document).off('click.bs.dropdown.data-api');
    $(this).addClass('open');
});
$('.nav .dropdown').mouseleave(function () {
    $(this).removeClass('open');
    $(document).on('click.bs.dropdown.data-api');
});
