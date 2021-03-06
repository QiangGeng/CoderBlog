var TopicAdd = function () {
    var _self = "";
    return {
        grid: "",
        init: function () {
            _self = this;
            KindEditor.ready(function (K) {
                window.editor = K.create('#editor_id', {
                    uploadJson: '${pageContext.request.contextPath }/file/kindeditor/u',
                    allowFileManager: false
                })
            })
            $(".todo-taskbody-tags").select2({
                tags: []
            })
            $("#saveBtn").click(function () {
                if (_self.checkForm())
                    _self.submitForm();
            })
            
            $("#cancelBtn").click(function () {
                    window.history.back();
            })
        },
        checkForm: function () {
            var type = $("#type").val();
            var title = $("input[name=title]").val();
            var decoration = $("textarea[name=decoration]").val();
            var content = editor.html();
             if (isNULL(title)) {
                return hasError_input("title", "请输入标题");
            } else if (isNULL(decoration)) {
                return hasError_input("decoration", "请输入摘要");
            } else if (isNULL(content)) {
                return hasError_input("editor_id", "请输入正文");
            }
            return true;
        },
        submitForm: function () {
            var $btn = $("saveBtn").button('loading');
            $("#labelmsg").text('');
            editor.readonly();
            var id = $("#id").val();
            var type = $("#type").val();
            var title = $("input[name=title]").val();
            var decoration = $("textarea[name=decoration]").val();
            var content = editor.html();
            var label = $("#label").val();
            //提交
            $.post(window.apppath + "/admin/api/topic/addOrUpdate", {
                id:id,
                type: type,
                title: title,
                decoration: decoration,
                content: content,
                label: label
            }, function (res) {
                $($btn).button('reset');
                editor.readonly(false);
                if(res.success)
                {
                    $("#labelmsg").addClass('text-success');
                    $("#labelmsg").text(res.message);
                    setTimeout(function () {
                        window.history.back();
                    },2000);
                }
                else{
                    $("#labelmsg").text(res.message);
                }

            }, 'json');
        }
    }
}();