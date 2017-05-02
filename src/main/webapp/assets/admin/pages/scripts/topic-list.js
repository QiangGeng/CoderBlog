var TopicList = function () {
    var _self = "";
    var tableContainer = $("#table-topic-list").parents(".table-container");
    return {
        grid: "",
        init: function () {
            _self = this;
            _self.tableInit();
        }
        , tableInit: function () {
            _self.grid = new Datatable();
            _self.grid.init({
                src: $("#table-topic-list"),
                loadingMessage: '加载中...',
                dataTable: {
                    "ajax": function (params, callback, obj) {
                        $.post(window.apppath + "/admin/api/topic/list", {
                            length: params.length,
                            start: params.start,
                            state:2//已发布的
                        }, function (res) {
                            if (res) {
                                callback(res);
                            } else {
                                callback({
                                    data: null,
                                    recordsFiltered: 0
                                });
                            }
                        }, 'json');
                    },
                    "searching": false,
                    "ordering": false,
                    "columns": [
                        {"data": "title"},
                        {
                            "data": "state", render: function (data, row) {
                            var str = ["未审核", "草稿", "已发布"];
                            if (data == null || data == "")
                                return "未审核";
                            else
                                return str[data];
                        }
                        },
                        {"data": "readCount"},
                        {"data": "commentCount"},
                        {
                            "data": "comment", render: function (data, row) {
                            if (data == false) {
                                return "<a>开启评论</a>"
                            }
                            else {
                                return "<a>禁止评论</a>"
                            }

                        }
                        },
                        {
                            "data": "id", render: function (data, row) {
                            var html = "";
                            html += '<a href="' + window.apppath + '/admin/topic/topic-info.html/' + data + '" class="btn btn-sm btn-danger">编辑 </a>'
                            if (row.top == 1)
                                html += '<a href="#" data="' + data + '" data-top="0" class="btn btn-sm btn-info putTop">取消置顶 </a>';
                            else
                                html += '<a href="#" data="' + data + '" data-top="1" class="btn btn-sm btn-info putTop">置顶 </a>';
                            html += '<a href="#" data="' + data + '" data-delete="3" class="btn btn-sm btn-warning delete">删除 </a>'
                            html += '<a href="#" class="btn btn-sm btn-success ">分类 </a>'
                            return html;
                        }
                        }
                    ]
                }
            });
            //置顶
            _self.grid.getTable().on("click", "a.putTop", function (e) {
                var id = $(this).attr("data");
                var top = $(this).data("top");
                _self.putTop(id, top);
            });
            //删除
            _self.grid.getTable().on("click", "a.delete", function (e) {
                var id = $(this).attr("data");
                var state = $(this).data("delete");
                _self.deleteTopic(id, state);
            });

        },
        deleteTopic: function (id, state) {
            $.post(window.apppath + "/admin/api/topic/updateTopic", {
                id: id,
                state: state
            }, function (res) {
                window.location.reload();
            }, 'json');
        },
        putTop: function (id, top) {
            $.post(window.apppath + "/admin/api/topic/updateTopic", {
                id: id,
                top: top
            }, function (res) {
                window.location.reload();
            }, 'json');
        }
    }
}();