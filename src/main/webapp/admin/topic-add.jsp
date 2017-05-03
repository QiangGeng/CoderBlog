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
        Coder Blog - 添加文章
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css?v=1"/>
        <link rel="stylesheet"
              type="text/css" href="${pageContext.request.contextPath}/assets/global/plugins/select2/select2.css"/>
    </tiles:putAttribute>
    <tiles:putAttribute name="content">
        <div class="page-fixed-main-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="portlet light bordered">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-equalizer font-red-sunglo"></i>
                                <span class="caption-subject font-red-sunglo bold uppercase">撰写博客</span>
                                <span class="caption-helper">天行健，君子以自强不息</span>
                            </div>
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <form action="#" class="form-horizontal">
                                <input id="id" name="id" type="hidden" class="form-control" value="${topic.id}">
                                <div class="form-body">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">标题</label>
                                        <div class="col-md-10">
                                            <input id="title" name="title" type="text" class="form-control"
                                                   placeholder="标题" value="${topic.title}">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">摘要</label>
                                        <div class="col-md-10">
                                            <textarea id="decoration" name="decoration" class="form-control"
                                                      placeholder="摘要">${topic.decoration}</textarea>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">正文</label>
                                        <div class="col-md-10">
                                           <textarea id="editor_id" name="content"
                                                     style="width:100%;height:440px;">${topic.content}</textarea>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">标签</label>
                                        <div class="col-md-10">
                                            <input id="label" name="label" type="text"
                                                   class="form-control todo-taskbody-tags" placeholder="添加标签..."
                                                    value="${topic.label}" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">类别</label>
                                        <div class="col-md-10">
                                            <select id="type" class="form-control">
                                                <option value="1" selected>原创</option>
                                                <option value="2">转载</option>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-offset-3 col-md-9">
                                            <button id="saveBtn" type="button" class="btn green">保存</button>
                                            <span id="labelmsg" class="label "></span>
                                            <button id="cancelBtn" onclick="window.history.back()" type="button" class="btn default">取消</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/kindeditor/kindeditor-all-min.js"></script>
        <script type="text/javascript" charset="utf-8"
                src="${pageContext.request.contextPath }/assets/global/plugins/kindeditor/lang/zh-CN.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/plugins/select2/select2.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/assets/admin/pages/scripts/topic-add.js?v=1.1"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                setMenu("side-topic");
                TopicAdd.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
