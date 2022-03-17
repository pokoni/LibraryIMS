<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="../static/js/jquery.js" type="text/javascript"></script>
</head>

<body>
<button class="btn">gei</button>
<script>
    $(function() {

        $('.btn').on('click', getdata)

        function getdata() {
            $.ajax({
                method: 'GET',
                url: 'https://www.escook.cn/api/cart',
                data: {
                    name: 'zs',
                    age: 20
                },
                success: function(res) {
                    console.log(res)
                }
            })
        }
    })
</script>
</body>

</html>