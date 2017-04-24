var TopicList=function () {
    var _self="";
    var tableContainer = $("#table-topic-list").parents(".table-container");
    return {
        grid:"",
        init:function () {
            _self=this;
            _self.tableInit();
        }
        ,tableInit:function () {
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
                        {"data": "state"},
                        {"data": "title"},
                        {"data": "title"},
                        {"data": "title"},
                        {"data": "title"}
                    ]
                }

            });
        }
    }
}();