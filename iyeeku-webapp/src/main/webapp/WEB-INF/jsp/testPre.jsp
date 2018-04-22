<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <style type="text/css">
        .ctrl-file {
            height: 30px;
            width: 70px;
            display: inline-block;
            *display: inline;
            *zoom: 1;
            overflow: hidden;
            position: relative;
        }

            .ctrl-file .filehide {
                position: absolute;
                z-index: 10;
                opacity: 0;
                font-size: 60px;
                filter: alpha(opacity = 0);
                width: 70px;
                height: 30px;
                left: 0;
                top: 0;
            }

            .ctrl-file a {
                width: 70px;
                line-height: 30px;
                height: 30px;
                display: block;
                background: #000;
                color: #fff;
                font-family: '微软雅黑';
                font-size: 14px;
                text-align: center;
                text-decoration: none;
                border-radius: 5px;
            }
    </style>
</head>
<body>
    <span class="ctrl-file">
        <input type="file" class="filehide" name="filehide" onchange="filechange(this)" />
        <a href="#">浏 览</a>
    </span>
    <div>
        <img src="" id="imgview" style="display:none;" alt="" />
    </div>
</body>
<script type="text/javascript">
    function $(id) {
        return document.getElementById(id);
    }

    function filechange(file) {
        if (file.files && file.files[0]) {
            var reader = new FileReader();
            reader.onload = function (evt) {
                showimg(evt.target.result);
            };
            reader.readAsDataURL(file.files[0]);
        } else {
            file.select();
            var src = document.selection.createRange().text;
            showimg(src);
        }
    }

    function showimg(src) {
        var img = $('imgview');
        img.src = src;
        img.style.display = 'block';
    }
</script>
</html>