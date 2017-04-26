<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<!--
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.5
Version: 4.1.0
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>
        <tiles:insertAttribute name="title" ignore="true"/>
    </title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="${pageContext.request.contextPath}/assets/global/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/css/bootstrap.min.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/uniform/css/uniform.default.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"
          rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
    <link href="${pageContext.request.contextPath}/assets/global/plugins/morris/morris.css" rel="stylesheet"
          type="text/css">
    <!-- END PAGE LEVEL PLUGIN STYLES -->
    <!-- BEGIN PAGE STYLES -->
    <tiles:insertAttribute name="page_css" ignore="true"/>
    <!-- END PAGE STYLES -->
    <!-- BEGIN THEME STYLES -->
    <!-- DOC: To use 'rounded corners' style just load 'components-rounded.css' stylesheet instead of 'components.css' in the below style tag -->
    <link href="${pageContext.request.contextPath}/assets/global/css/components-rounded.css" id="style_components"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/admin/layout/css/layout.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/admin/layout/css/custom.css" rel="stylesheet"
          type="text/css"/>
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-quick-sidebar-over-content">

<!-- BEGIN MAIN LAYOUT -->
<!-- HEADER BEGIN -->
<header class="page-header">
    <nav class="navbar" role="navigation">
        <div class="container-fluid">
            <div class="havbar-header">
                <!-- BEGIN LOGO -->
                <a id="index" class="navbar-brand" href="start.html">
                    <img src="${pageContext.request.contextPath}/assets/admin/layout/img/logo.png?v=1" alt="Logo">
                </a>
                <!-- END LOGO -->

                <!-- BEGIN TOPBAR ACTIONS -->
                <div class="topbar-actions">
                    <!-- DOC: Apply "search-form-expanded" right after the "search-form" class to have half expanded search box -->
                    <form class="search-form" action="extra_search.html" method="GET">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search here" name="query">
                            <span class="input-group-btn">
									<a href="javascript:;" class="btn submit"><i class="fa fa-search"></i></a>
								</span>
                        </div>
                    </form>
                    <!-- END HEADER SEARCH BOX -->

                    <!-- BEGIN GROUP NOTIFICATION -->
                    <div class="btn-group-notification btn-group" id="header_notification_bar">
                        <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                                data-close-others="true">
                            <span class="badge">0</span>
                        </button>
                        <ul class="dropdown-menu-v2">
                            <li class="external">
                                <h3><span class="bold">12 pending</span> notifications</h3>
                                <a href="#">view all</a>
                            </li>
                        </ul>
                    </div>
                    <!-- END GROUP NOTIFICATION -->

                    <!-- BEGIN USER PROFILE -->
                    <div class="btn-group-img btn-group">
                        <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown"
                                data-hover="dropdown" data-close-others="true">
                            <img src="${pageContext.request.contextPath}/assets/admin/layout/img/avatar1.jpg" alt="">
                        </button>
                        <ul class="dropdown-menu-v2" role="menu">
                            <li class="active">
                                <a href="profile.html">个人信息 <span class="badge badge-danger">1</span> </a>
                            </li>
                            <li>
                                <a href="lock_screen.html">锁屏</a>
                            </li>
                            <li>
                                <a href="login.html">退出</a>
                            </li>
                        </ul>
                    </div>
                    <!-- END USER PROFILE -->
                </div>
                <!-- END TOPBAR ACTIONS -->
            </div>
        </div>
        <!--/container-->
    </nav>
</header>
<!-- HEADER END -->

<!-- PAGE CONTENT BEGIN -->
<div class="container-fluid">
    <div class="page-content page-content-popup">
        <!-- BEGIN PAGE CONTENT FIXED -->
        <div class="page-content-fixed-header">
            <ul class="page-breadcrumb">
                <li>博客</li>
            </ul>
        </div>
        <tiles:insertAttribute name="side-menu" ignore="true"/>
        <tiles:insertAttribute name="content" ignore="true"/>
        <tiles:insertAttribute name="side-copyright" ignore="true"/>
    </div>
</div>
<!-- PAGE CONTENT END -->
<!-- END MAIN LAYOUT -->
<a href="#index" class="go2top"><i class="icon-arrow-up"></i></a>

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/assets/global/plugins/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-migrate.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap/js/bootstrap.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.blockui.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/uniform/jquery.uniform.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"
        type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${pageContext.request.contextPath}/assets/global/plugins/amcharts/amcharts/amcharts.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/amcharts/amcharts/serial.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/amcharts/amcharts/pie.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/amcharts/amcharts/themes/light.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/morris/morris.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/morris/raphael-min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/global/plugins/jquery.sparkline.min.js"
        type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- END CORE PLUGINS -->
<script type="text/javascript">
    window.apppath = '${pageContext.request.contextPath }';
    $("html,body").animate({scrollTop:$("body").offset().top},200);
    function setMenu(id) {
        $("#" + id).addClass("active");
    }

    function isNULL(str) {
        if (str == null || str == "")
            return true;
        return false;
    }
    function hasError_input(id,str) {
        $("#"+id).parent().parent().addClass("has-error")
        $("#"+id).parent().find(".help-block").html(str);
        $("html,body").animate({scrollTop:$("#"+id).offset().top-100},200);
        return false;
    }
</script>
<tiles:insertAttribute name="page_script" ignore="true"/>
<tiles:insertAttribute name="page_script_jq" ignore="true"/>
</body>

<!-- END BODY -->
</html>