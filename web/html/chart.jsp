<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>报表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="../lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/themes/flat-blue.css">
</head>

<body class="flat-blue">
<input type="hidden" value="3">
<div class="app-container">
    <div class="row content-container">
        <%@include file="top.jsp" %>
        <!-- Main Content -->
        <div class="container-fluid">
            <div class="side-body">
                <div class="page-title">
                    <span class="title">销售报表</span>
                </div>
                <div id="chartbyline" style="width:600px; height: 400px;"></div>
                <div id="chartbybar" style="width:600px; height: 400px;"></div>
                <div id="chartbypie" style="width:600px; height: 400px;"></div>
                <div id="chartmain" style="width:600px; height: 400px;"></div>

            </div>
        </div>
    </div>
    <%@include file="footer.jsp" %>
    <div>
        <!-- Javascript Libs -->
        <script type="text/javascript" src="../lib/js/jquery.min.js"></script>
        <script type="text/javascript" src="../lib/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../lib/js/Chart.min.js"></script>
        <script type="text/javascript" src="../lib/js/bootstrap-switch.min.js"></script>

        <script type="text/javascript" src="../lib/js/jquery.matchHeight-min.js"></script>
        <script type="text/javascript" src="../lib/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../lib/js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="../lib/js/select2.full.min.js"></script>
        <script type="text/javascript" src="../lib/js/ace/ace.js"></script>
        <script type="text/javascript" src="../lib/js/ace/mode-html.js"></script>
        <script type="text/javascript" src="../lib/js/ace/theme-github.js"></script>
        <script type="text/javascript" src="../lib/js/echarts.min.js"></script>
        <!-- Javascript -->
        <script type="text/javascript" src="../js/app.js"></script>
        <script type="text/javascript" src="../js/ordermanage.js"></script>
        <script type="text/javascript">
            //指定图标的配置和数据
            myChartbyline.setOption ({
                title:{
                    text:'销售总量报表-折线图'
                },
                tooltip:{},
                legend:{
                    data:['月销量']
                },
                xAxis:{
                    data:[]
                },
                yAxis:{

                },
                series:[{
                    name:'销量',
                    type:'line',
                    data:[]
                }]
            });
            //初始化echarts实例
            var myChartbyline = echarts.init(document.getElementById('chartbyline'));
            //使用制定的配置项和数据显示图表

            $.ajax({
                url:"",
                cache:false,
                seccess:function (data) {
                    myChartbyline.setOption({
                        xAxis:{
                            data:data.months
                        },
                        series:[{
                            name:'销量',
                            type:'line',
                            data:data.data
                        }]
                    })
                },
                error:function (error) {
                    console.log(error);
                }
            })

        </script>

        <script type="text/javascript">
            //指定图标的配置和数据
            var optionbybar = {
                title:{
                    text:'销售报表-条形图'
                },
                tooltip:{},
                legend:{
                    data:['用户来源']
                },
                xAxis:{
                    data:["Android","IOS","PC","Ohter"]
                },
                yAxis:{

                },
                series:[{
                    name:'访问量',
                    type:'bar',
                    data:[500,200,360,100]
                }]
            };
            //初始化echarts实例
            var myChart = echarts.init(document.getElementById('chartbybar'));
            //使用制定的配置项和数据显示图表
            myChart.setOption(optionbybar);
        </script>

        <script type="text/javascript">
        var optionbypie = {
        title:{
        text:'销售报表-饼状图'
        },
        series:[{
        name:'访问量',
        type:'pie',
        radius:'60%',
        data:[
        {value:500,name:'Android'},
        {value:200,name:'IOS'},
        {value:360,name:'PC'},
        {value:100,name:'Ohter'}
        ]
        }]
        };
        //初始化echarts实例
        var myChart = echarts.init(document.getElementById('chartbypie'));
        //使用制定的配置项和数据显示图表
        myChart.setOption(optionbypie);
        </script>
    </div>
</div>
</body>

</html>
