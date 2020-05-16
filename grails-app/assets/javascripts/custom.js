$(document).on('click','.remove-sub',function () {
    $(this).prev().remove();
    $(this).remove();
});

$('.editCategory').on('click',function (e) {
    e.preventDefault();
    $tr = $(this).closest('tr');
    $data = $tr.children('td').map(function () {
        return $(this).text();
    }).get();
    $id = $(this).attr('data-id');
    $('input[name=id]').val($id);
    $('#editCategory').modal('show');
});
$('#addSub').on('click',function (e) {
    e.preventDefault();
    $(".sub-category:last").append($("#main-sub").clone());
    $(".sub-category:last").append("&nbsp;<a class='btn btn-danger remove-sub'>Remove</a>");
});

$('#newSub').on('submit',function (e) {
    e.preventDefault();
    $.ajax({
        type: "POST",
        url:'/product/addSubCategory',
        data:$(this).serialize(),
        success: function (data) {
            // window.location.reload();
            if(data!="error")
            {
            $("#addNewSub").modal('toggle');
            $('#main-sub').append(new Option(data, data))

            }
            else{
                alert("Check if category already exists!");
            }
            console.log(data)
        },
        error: function (data) {
            // window.location.reload();
            console.log(data)

        }
    });


});

$(".add-size").click(function () {
    $(".addSize").modal('show');
    $('#addSizes')[0].reset();

});
$(document).on('submit','#addSizes',function (e) {
    e.preventDefault();
    console.log('hii');
    size=$('#addSizes').find('[name=size]').val();
    console.log($('[name=size]').val());
    stock=$('#addSizes').find('[name=stock]').val();
    $('#sizeTable').append('<tr><td><input type="hidden" name="sizes" value="'+size+'"> '+size+'</td><td><input type="hidden" name="stocks" value="'+stock+'">'+stock+'</td><td><a class="btn btn-danger remove-size">Remove</a></td></tr>')
    $('#addSizes')[0].reset();
    $(".addSize").modal('toggle');
});

$(document).on('click','.remove-size',function () {
    console.log($(this));
    $(this).closest('tr').remove();
});

$(document).on('click','.remove-savedSize',function () {
    savedSize=$(this).attr('data-id');
    var tr=$(this).closest('tr');
    $.ajax({
        type: "GET",
        url:'/options/remove_size/',
        data:{id:savedSize},
        success: function (data) {
            // window.location.reload();
            tr.remove();
            console.log(data)
        },
        error: function (data) {
            // window.location.reload();
            console.log(data)

        }
    });
    console.log($(this));

});
$(".create-promo").click(function () {
    $("#promoModal").modal('show');
});

$(".image-checkbox").each(function () {
    if ($(this).find('input[type="checkbox"]').first().attr("checked")) {
        $(this).addClass('image-checkbox-checked');
    }
    else {
        $(this).removeClass('image-checkbox-checked');
    }
});
var selected = [];

// sync the state to the input
$(".image-checkbox").on("click", function (e) {
    $(this).toggleClass('image-checkbox-checked');
    var $checkbox = $(this).find('input[type="checkbox"]');
    $checkbox.prop("checked",!$checkbox.prop("checked"));
    if ($checkbox.prop('checked')) {
        selected.push($checkbox.val());
    }else {
        for (var i = 0; i < selected.length; i++) {
            if (selected[i] === $checkbox.val()) {
                selected.splice(i, 1);
            }
        }
    }
    e.preventDefault();
});

$('#delete-multiple').on('click', function (e) {
    e.preventDefault();
    var myjson = selected[0].trim();
    for (var i = 1; i < selected.length; i++) {
        myjson += '~' + selected[i].trim();

    }
    console.log(myjson);
    $.ajax({
        type: "GET",
        url:'/options/remove_image/' ,
        data:{images:myjson},
        success: function (data) {
            window.location.reload();
            console.log(data)
        },
        error: function (data) {
            // window.location.reload();
            console.log(data)

        }
    });
});

$('#addFeatured').on('click',function () {
    $('#addfeaturedModal').modal('show');
});

$('.editFeatured').on('click',function (e) {
    console.log(this);
    e.preventDefault();
    $tr = $(this).closest('tr');
    $data = $tr.children('td').map(function () {
        return $(this).text();
    }).get();
    $id = $(this).attr('data-id');
    $('#editfeaturedModal').modal('show');
    $('input[name=name]').val($data[1]);
    $('input[name=title]').val($data[2]);
    $('input[name=link]').val($data[3]);
    $('input[name=id]').val($id);
});