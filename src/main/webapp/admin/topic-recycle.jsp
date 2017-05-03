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
        Coder Blog - 回收站
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
                                <span class="caption-subject bold uppercase">回收站</span>
                                <span class="caption-helper">.</span>
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
                src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/assets/admin/pages/scripts/topic-recycle.js?v=1.6"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                setMenu("side-topic-recycle");
                TopicRecycle.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
