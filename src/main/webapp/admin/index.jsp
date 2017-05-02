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
        Coder Blog
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
    </tiles:putAttribute>
    <tiles:putAttribute name="content">
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                setMenu("side-topic");
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
