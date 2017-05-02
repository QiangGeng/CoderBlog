/**
 * Created by CoderQiang on 2017/5/2.
 */
var Profile=function () {
    var _self;
    return {
        init:function () {
            _self=this;
            $('.date-picker').datepicker({
                rtl: Metronic.isRTL(),
                orientation: "left",
                autoclose: true,
                format:"yyyy-mm-dd",
                language: 'ch'
            });
        },
        updateUserInfo:function () {
            var id=$("#uuiForm input[name=id]").val();
            var name=$("#uuiForm input[name=name]").val();
            var sex=$("#uuiForm input[name=sex]:checked").val();
            var birthday=$("#uuiForm input[name=birthday]").val();
            var email=$("#uuiForm input[name=email]").val();
            var phone=$("#uuiForm input[name=phone]").val();
            var introduce=$("#uuiForm textarea[name=introduce]").val();
            $.post(window.apppath+"/admin/api/user/update",{
                id:id,
                name:name,
                sex:sex,
                birthday:birthday,
                email:email,
                phone:phone,
                introduce:introduce
            },function (res) {
                $("#labelmsg").addClass('text-success');
                $("#labelmsg").text(res.message);
                setTimeout(function () {
                    window.history.back();
                },2000);
            },"json");

        },
        updateUserAvatar:function () {
            var avatarFile = $("#avatar").val();
            if (avatarFile == null || avatarFile == "") {
                $("#labelmsg-avatar").addClass('text-success');
                $("#labelmsg-avatar").text("请上传头像");
                return false;
            } else {
            }

            $.ajaxFileUpload({
                url: window.apppath + "/admin/api/user/updateAvatar",
                secureuri: false,
                fileElementId: 'avatar',//file控件id
                dataType: 'json',
                success: function (data, status) {
                    $("#labelmsg-avatar").addClass('text-success');
                    $("#labelmsg-avatar").text(data.message);
                    setTimeout(function () {
                        window.history.back();
                    },2000);
                }, error: function (data, status, e) {
                    console.log(e);
                }
            });
        }
    }
}();