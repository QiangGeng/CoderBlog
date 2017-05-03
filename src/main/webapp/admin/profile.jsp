<%--
  Created by IntelliJ IDEA.
  User: MaiBenBen
  Date: 2017/4/21
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tiles:insertDefinition name="tiles.template.admin.layout">
    <tiles:putAttribute name="title">
        Coder Blog - 个人中心
    </tiles:putAttribute>
    <tiles:putAttribute name="page_css">
        <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
              rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css"
              rel="stylesheet" type="text/css"/>
    </tiles:putAttribute>
    <tiles:putAttribute name="content">
        <!-- BEGIN PROFILE CONTENT -->
        <div class="page-fixed-main-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="portlet light">
                        <div class="portlet-title tabbable-line">
                            <div class="caption caption-md">
                                <i class="icon-globe theme-font hide"></i>
                                <span class="caption-subject font-blue-madison bold uppercase">用户信息</span>
                            </div>
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#tab_1_1" data-toggle="tab">个人信息</a>
                                </li>
                                <li>
                                    <a href="#tab_1_2" data-toggle="tab">修改头像</a>
                                </li>
                                <li>
                                    <a href="#tab_1_3" data-toggle="tab">修改密码</a>
                                </li>
                            </ul>
                        </div>
                        <div class="portlet-body">
                            <div class="tab-content">
                                <!-- PERSONAL INFO TAB -->
                                <div class="tab-pane active" id="tab_1_1">
                                    <form id="uuiForm" role="form" action="#">
                                        <input type="hidden" name="id" value="${sessionScope.login_user.id}">
                                        <div class="form-group">
                                            <label class="control-label">姓名</label>
                                            <div>
                                                <input type="text" placeholder="${sessionScope.login_user.name}"
                                                       class="form-control" name="name"/>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">性别</label>
                                            <div class="md-radio-inline">
                                                <div class="md-radio ">
                                                    <input type="radio" id="sex1" name="sex" class="md-radiobtn"
                                                           value="1"
                                                           <c:if test="${sessionScope.login_user.sex==1}">checked</c:if> >
                                                    <label for="sex1">
                                                        <span></span>
                                                        <span class="check"></span>
                                                        <span class="box"></span>
                                                        男</label>
                                                </div>
                                                <div class="md-radio has-error">
                                                    <input type="radio" id="sex2" name="sex" class="md-radiobtn"
                                                           value="2"
                                                           <c:if test="${sessionScope.login_user.sex==2}">checked</c:if>>
                                                    <label for="sex2">
                                                        <span></span>
                                                        <span class="check"></span>
                                                        <span class="box"></span>
                                                        女 </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">出生年月日</label>
                                            <input class="form-control date-picker" name="birthday" size="16"
                                                   type="text" value=""
                                                   placeholder="${sessionScope.login_user.birthday}"/>
                                            <span class="help-block"></span>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">邮箱</label>
                                            <input type="text" name="email"
                                                   placeholder="${sessionScope.login_user.email}"
                                                   class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">联系方式</label>
                                            <input type="text" name="phone"
                                                   placeholder="${sessionScope.login_user.phone}"
                                                   class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">自我介绍</label>
                                            <textarea class="form-control" name="introduce" rows="3"
                                                      placeholder="${sessionScope.login_user.introduce}"></textarea>
                                        </div>
                                        <div class="margiv-top-10">
                                            <a href="javascript:;" class="btn green-haze submit"
                                               onclick="Profile.updateUserInfo()">
                                                保存 </a>
                                            <span id="labelmsg" class="label "></span>
                                        </div>
                                    </form>
                                </div>
                                <!-- END PERSONAL INFO TAB -->
                                <!-- CHANGE AVATAR TAB -->
                                <div class="tab-pane" id="tab_1_2">
                                    <form action="#" role="form">
                                        <div class="form-group">
                                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                                <div class="fileinput-new thumbnail"
                                                     style="width: 200px; height: 150px;">
                                                    <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
                                                         alt=""/>
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail"
                                                     style="max-width: 200px; max-height: 150px;">
                                                </div>
                                                <div>
                                                    <span class="btn default btn-file">
                                                    <span class="fileinput-new">
                                                    选择图片 </span>
                                                    <span class="fileinput-exists">
                                                    修改 </span>
                                                    <input type="file" name="avatar" id="avatar">
                                                    </span>
                                                    <a href="javascript:;" class="btn default fileinput-exists"
                                                       data-dismiss="fileinput">
                                                        清除 </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="margin-top-10">
                                            <a href="javascript:;" class="btn green-haze"
                                               onclick="Profile.updateUserAvatar()">
                                                提交 </a>
                                            <span id="labelmsg-avatar" class="label "></span>
                                        </div>
                                    </form>
                                </div>
                                <!-- END CHANGE AVATAR TAB -->
                                <!-- CHANGE PASSWORD TAB -->
                                <div class="tab-pane" id="tab_1_3">
                                    <form action="#">
                                        <div class="form-group">
                                            <label class="control-label">当前密码</label>
                                            <div>
                                                <input id="oldPwd" type="password" name="oldPwd" class="form-control"/>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">新密码</label>
                                            <div>
                                                <input id="newPwd"  type="password" name="newPwd"   class="form-control"/>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">确认密码</label>
                                            <div>
                                                <input id="newPwd2" type="password" name="newPwd2" class="form-control"/>
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="margin-top-10">
                                            <button type="button" class="btn green-haze " onclick="Profile.updateUserPwd()">
                                                修改密码</button>
                                            <span id="labelmsg-pwd" class="label "></span>
                                        </div>
                                    </form>
                                </div>
                                <!-- END CHANGE PASSWORD TAB -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
    <tiles:putAttribute name="page_script">
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath }/assets/global/scripts/ajaxfileupload.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/assets/admin/pages/scripts/profile.js?v=1.3"></script>
        <script>
            jQuery(document).ready(function () {
                Metronic.init();
                Layout.init();
                setMenu("side-profile");
                Profile.init();
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
