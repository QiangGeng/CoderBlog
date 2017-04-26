<%--
  Created by IntelliJ IDEA.
  User: MaiBenBen
  Date: 2017/4/21
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="title">
        Coder Blog - 文章管理
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css?v=1"/>
        <style>
            .table-container
            {
                min-height: 600px;
            }
        </style>
    </tiles:putAttribute>
    <tiles:putAttribute name="content">
        <div class="page-fixed-main-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="portlet light bordered">
                        <div class="portlet-title">
                            <div class="caption font-dark">
                                <span class="caption-subject bold uppercase">文章列表</span>
                                <span class="caption-helper">.</span>
                            </div>
                            <div class="actions">
                                <a href="${pageContext.request.contextPath}/admin/topic/topic-add.html" class="btn btn-circle btn-default btn-sm">
                                    <i class="fa fa-plus"></i> 添加 </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-container">
                                <table id="table-topic-list" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr class="">
                                            <th width="40%">标题</th>
                                            <th width="10%">状态</th>
                                            <th width="5%">阅读</th>
                                            <th width="5%"> 评论</th>
                                            <th width="10%">评论权限</th>
                                            <th width="30%">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/assets/global/scripts/datatable_zh.js?v=1"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/assets/admin/pages/scripts/topic-list.js?v=1.1"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                setMenu("side-topic");
                TopicList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
