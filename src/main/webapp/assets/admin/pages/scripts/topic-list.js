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
                            orderField:"a.is_top DESC , a.id",
                            orderDir:"desc",
                            state: 2//已发布的
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
                        {
                            "data": "readCount", render: function (data, type, full) {
                            if (data == null)
                                return 0;
                            return data;
                        }
                        },
                        {
                            "data": "commentCount", render: function (data, type, full) {
                            if (data == null)
                                return 0;
                            return data;
                        }
                        },
                        {
                            "data": "comment", render: function (data, type, full) {
                            if (data == false) {
                                return "<a>开启评论</a>"
                            }
                            else {
                                return "<a>禁止评论</a>"
                            }

                        }
                        },
                        {
                            "data": "id", render: function (data, type, row) {
                            var html = "";
                            html += '<a href="' + window.apppath + '/admin/topic/topic-info.html/' + data + '" class="btn btn-sm btn-danger">编辑 </a>'
                            if (row.top == true)
                                html += '<a href="#" data="' + data + '" data-top="0" class="btn btn-sm  putTop">取消置顶 </a>';
                            else
                                html += '<a href="#" data="' + data + '" data-top="1" class="btn btn-sm btn-info putTop">置顶 </a>';
                            html += '<a id="deleteBtn" href="#" data="' + data + '" data-delete="3" class="btn btn-sm btn-warning delete" >删除 </a>'
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
                var curRow = $(this).closest('tr');
                var id = $(this).attr("data");
                var state = $(this).data("delete");
                $(this).confirmation({
                    'title': '确认删除？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                    'onConfirm': function () {
                        _self.deleteTopic(id, state,curRow);
                    },
                }).confirmation('toggle');
            });

        },
        deleteTopic: function (id, state,curRow) {
            $.post(window.apppath + "/admin/api/topic/updateTopic", {
                id: id,
                state: state
            }, function (res) {
                if (res.success) {
                    _self.grid.getDataTable().row(curRow).remove().draw(false);
                }
            }, 'json');
        },
        putTop: function (id, top) {
            $.post(window.apppath + "/admin/api/topic/updateTopic", {
                id: id,
                top: top
            }, function (res) {
                if (res.success) {
                    _self.grid.getDataTable().ajax.reload();
                }
            }, 'json');
        }
    }
}();