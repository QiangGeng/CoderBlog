<%--
  Created by IntelliJ IDEA.
  User: MaiBenBen
  Date: 2017/4/21
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <ul class="page-sidebar-menu" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
            <li  class="active">
                <a>
                    <i class="icon-book-open"></i>
                    <span class="title">文章管理</span>
                </a>
            </li>
            <li>
                <a>
                    <i class="icon-list"></i>
                    <span class="title">类别管理</span>
                </a>
            </li>
            <li>
                <a href="index-boxed.html">
                    <i class="icon-layers"></i>
                    <span class="title">评论管理</span>
                </a>
            </li>
            <li>
                <a href="profile.html">
                    <i class="icon-paper-clip"></i>
                    <span class="title">草稿箱</span>
                </a>
            </li>
            <li>
                <a>
                    <i class="icon-trash"></i>
                    <span class="title">回收站</span>
                </a>
            </li>
            <li>
                <a>
                    <i class="icon-user"></i>
                    <span class="title">个人信息</span>
                </a>
            </li>
        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
</div>
<!-- END SIDEBAR -->
