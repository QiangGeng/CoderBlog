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
                            start: params.start
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
                                return "否"
                            }
                            else {
                                return "是"
                            }

                        }
                        },
                        {
                            "data": "id", render: function (data, row) {
                                var html="";
                                html+='<a href="#" class="btn btn-sm green-stripe">编辑 </a>'
                                html+='<a href="#" class="btn btn-sm blue-stripe">置顶 </a>'
                                html+='<a href="#" class="btn btn-sm green-stripe">删除 </a>'
                                html+='<a href="#" class="btn btn-sm yellow-stripe">分类 </a>'
                            return html;
                        }
                        }
                    ]
                }

            });
        }
    }
}();