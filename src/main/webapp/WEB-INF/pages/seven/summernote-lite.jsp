<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <title>Lite版</title>
    <link href="https://cdn.bootcss.com/summernote/0.8.10/summernote-lite.css" rel="stylesheet">
  </head>
  <body>
    <div id="summernote"></div>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/summernote/0.8.10/summernote-lite.js"></script>
    <script>
      $('#summernote').summernote({
        placeholder: '我是Lite版的Summernote，看我漂亮吗？',
        height: 100
      });
    </script>
  </body>
</html>