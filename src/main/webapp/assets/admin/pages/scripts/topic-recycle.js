var TopicRecycle = function () {
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
                            state: 3//已删除的
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
                            var str = ["未审核", "草稿", "已发布", "已删除"];
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
                            html += '<a href="#" data="' + data + '" data-state="2" class="btn btn-sm btn-info restore" >还原 </a>'
                            html += '<a href="#" data="' + data + '" data-delete="3" class="btn btn-sm btn-warning delete" >删除 </a>'
                            return html;
                        }
                        }
                    ]
                }
            });
            //还原
            _self.grid.getTable().on("click", "a.restore", function (e) {
                var curRow = $(this).closest('tr');
                var id = $(this).attr("data");
                var state = $(this).data("state");
                $(this).confirmation({
                    'title': '确认还原？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                    'onConfirm': function () {
                        _self.restoreTopic(id, state, curRow);
                    },
                }).confirmation('toggle');
            });
            //删除
            _self.grid.getTable().on("click", "a.delete", function (e) {
                var curRow = $(this).closest('tr');
                var id = $(this).attr("data");
                $(this).confirmation({
                    'title': '确认删除？', 'placement': 'left', 'btnOkLabel': '确认', 'btnCancelLabel': '取消',
                    'onConfirm': function () {
                        _self.deleteTopic(id, curRow);
                    },
                }).confirmation('toggle');
            });

        },
        deleteTopic: function (id,curRow) {
            $.post(window.apppath + "/admin/api/topic/deleteTopic", {
                id: id
            }, function (res) {
                if (res.success) {
                    _self.grid.getDataTable().row(curRow).remove().draw(false);
                }
            }, 'json');
        },
        restoreTopic: function (id, state,curRow) {
            $.post(window.apppath + "/admin/api/topic/updateTopic", {
                id: id,
                state: state
            }, function (res) {
                if (res.success) {
                    _self.grid.getDataTable().row(curRow).remove().draw(false);
                }
            }, 'json');
        }
    }
}();