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
        <link href="${pageContext.request.contextPath}/assets/global/plugins/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet"
              type="text/css"/>
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
                                <a href="#" class="btn btn-circle btn-default btn-sm">
                                    <i class="fa fa-plus"></i> 添加 </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div id="columnLine" class="columnLine">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script src="${pageContext.request.contextPath}/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/global/scripts/datatable.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/global/scripts/datatable.js" type="text/javascript"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                TopicList.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
