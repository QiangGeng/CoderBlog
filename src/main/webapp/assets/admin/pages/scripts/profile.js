/**
 * Created by CoderQiang on 2017/5/2.
 */
var Profile = function () {
    var _self;
    return {
        init: function () {
            _self = this;
            $('.date-picker').datepicker({
                rtl: Metronic.isRTL(),
                orientation: "left",
                autoclose: true,
                format: "yyyy-mm-dd",
                language: 'ch'
            });
        },
        updateUserInfo: function () {
            var id = $("#uuiForm input[name=id]").val();
            var name = $("#uuiForm input[name=name]").val();
            var sex = $("#uuiForm input[name=sex]:checked").val();
            var birthday = $("#uuiForm input[name=birthday]").val();
            var email = $("#uuiForm input[name=email]").val();
            var phone = $("#uuiForm input[name=phone]").val();
            var introduce = $("#uuiForm textarea[name=introduce]").val();
            $.post(window.apppath + "/admin/api/user/update", {
                id: id,
                name: name,
                sex: sex,
                birthday: birthday,
                email: email,
                phone: phone,
                introduce: introduce
            }, function (res) {
                $("#labelmsg").addClass('text-success');
                $("#labelmsg").text(res.message);
                setTimeout(function () {
                    window.location.reload();
                }, 2000);
            }, "json");

        },
        updateUserAvatar: function () {
            var avatarFile = $("#avatar").val();
            if (avatarFile == null || avatarFile == "") {
                $("#labelmsg-avatar").addClass('text-error');
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
                        window.location.reload();
                    }, 2000);
                }, error: function (data, status, e) {
                    console.log(e);
                }
            });
        },
        updateUserPwd: function () {
            $(this).attr("disabled","true");
            var id = $("#uuiForm input[name=id]").val();
            var oldPwd = $("input[name=oldPwd]").val();
            var newPwd = $("input[name=newPwd]").val();
            if (_self.checkPwdForm()) {
                //更新密码
                $.post(window.apppath + "/admin/api/user/updateUserPwd", {
                    id: id,
                    currentPassword: oldPwd,
                    newPassword: newPwd
                }, function (res) {
                    $(this).removeAttr("disabled");
                    if (res.success) {
                        $("#labelmsg-pwd").addClass('text-success');
                        $("#labelmsg-pwd").text(res.message);
                        setTimeout(function () {
                            window.location.reload();
                        }, 2000);
                    }
                    else {
                        $("#labelmsg-pwd").text(res.message);
                    }

                }, 'json');
            }
        },
        checkPwdForm: function () {
            var oldPwd = $("input[name=oldPwd]").val();
            var newPwd = $("input[name=newPwd]").val();
            var newPwd2 = $("input[name=newPwd2]").val();
            if (isNULL(oldPwd)) {
                return hasError_input("oldPwd", "请输入旧密码");
            } else if (isNULL(newPwd)) {
                return hasError_input("newPwd", "请输入新密码");
            } else if (isNULL(newPwd2)) {
                return hasError_input("newPwd2", "请再次输入新密码");
            }
            else if (newPwd != newPwd2) {
                return hasError_input("newPwd2", "两次密码不一致");
            }
            return true;
        }
    }
}();