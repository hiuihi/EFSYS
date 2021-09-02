$('.btn-edit').on('click',function(){
    $('.updatemodal').show();
});

$('#add-btn').on('click',function(){
    $('.addmodal').show();
});
$('#add-btn-x').on('click',function(){
        $('.addmodal').hide();
 });
$('#upd-btn-x').on('click',function(){
    $('.updatemodal').hide();
});
$('.img-close').on('click',function(){
    $(this).parent().remove();
});