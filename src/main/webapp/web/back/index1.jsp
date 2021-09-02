
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"><link rel="icon" href="https://jscdn.com.cn/highcharts/images/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../layui/css/layui.css"  media="all">
    <style>
        /* css 代码  */
    </style>
    <script src="../layui/layui.js" charset="utf-8"></script>
    <script src="https://code.highcharts.com.cn/jquery/jquery-1.8.3.min.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts/highcharts.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts/modules/exporting.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts/modules/data.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts/modules/series-label.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts/modules/oldie.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
</head>
<body >




<div style="padding: 0px;">

    <div class="layui-row layui-col-space15">
        <!-- 选项卡宽度1-12  移动：xs | 平板：sm | 桌面：md-->
        <div class="layui-col-xs12 layui-col-sm6 layui-col-md4" >
            <div class="layui-card">
                <div class="layui-card-header layui-col-xs9 layui-col-sm10 layui-col-md10 ">访问量</div>
                <div ><span class="layui-badge layui-bg-blue" style="float: right;margin: 10px 20px 0 0;">年</span></div>
                <div class=" layui-row">
                    <div class="layui-col-sd12" style="font-size: 50px;margin: 20px 20px 20px 20px;color: gray;">
                        118565
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
            <div class="layui-card">
                <div class="layui-card-header layui-col-xs9 layui-col-sm10 layui-col-md10">访问量</div>
                <div class="layui-card-header layui-col-xs3 layui-col-sm2 layui-col-md2"><span class="layui-badge layui-bg-blue">月</span></div>

                <div class=" layui-row">
                    <div class="layui-col-sd12" style="font-size: 50px;margin: 20px 20px 20px 20px;color: gray;">
                        118565
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-xs12 layui-col-sm6 layui-col-md4">
            <div class="layui-card">
                <div class="layui-card-header layui-col-xs9 layui-col-sm10 layui-col-md10">访问量</div>
                <div class="layui-card-header layui-col-xs3 layui-col-sm2 layui-col-md2"><span class="layui-badge layui-bg-blue">日</span></div>

                <div class=" layui-row">
                    <div class="layui-col-sd12" style="font-size: 50px;margin: 20px 20px 20px 20px;color: gray;">
                        118565
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="container" style="min-width:400px;height:400px"></div>
<div class="message"></div>
<script>
    var chart = null;
    // 获取 CSV 数据并初始化图表
    $.getJSON('https://data.jianshukeji.com/jsonp?filename=csv/analytics.csv&callback=?', function (csv) {
        chart = Highcharts.chart('container', {
            data: {
                csv: csv
            },
            title: {
                text: '日常访问量'
            },
            // subtitle: {
            //     text: '数据来源: Google Analytics'
            // },
            xAxis: {
                tickInterval: 7 * 24 * 3600 * 1000, // 坐标轴刻度间隔为一星期
                tickWidth: 0,
                gridLineWidth: 1,
                labels: {
                    align: 'left',
                    x: 3,
                    y: -3
                },
                // 时间格式化字符
                // 默认会根据当前的刻度间隔取对应的值，即当刻度间隔为一周时，取 week 值
                dateTimeLabelFormats: {
                    week: '%Y-%m-%d'
                }
            },
            yAxis: [{ // 第一个 Y 轴，放置在左边（默认在坐标）
                title: {
                    text: null
                },
                labels: {
                    align: 'left',
                    x: 3,
                    y: 16,
                    format: '{value:.,0f}'
                },
                showFirstLabel: false
            }, {    // 第二个坐标轴，放置在右边
                linkedTo: 0,
                gridLineWidth: 0,
                opposite: true,  // 通过此参数设置坐标轴显示在对立面
                title: {
                    text: null
                },
                labels: {
                    align: 'right',
                    x: -3,
                    y: 16,
                    format: '{value:.,0f}'
                },
                showFirstLabel: false
            }],
            legend: {
                align: 'left',
                verticalAlign: 'top',
                y: 20,
                floating: true,
                borderWidth: 0
            },
            tooltip: {
                shared: true,
                crosshairs: true,
                // 时间格式化字符
                // 默认会根据当前的数据点间隔取对应的值
                // 当前图表中数据点间隔为 1天，所以配置 day 值即可
                dateTimeLabelFormats: {
                    day: '%Y-%m-%d'
                }
            },
            plotOptions: {
                series: {
                    cursor: 'pointer',
                    point: {
                        events: {
                            // 数据点点击事件
                            // 其中 e 变量为事件对象，this 为当前数据点对象
                            click: function (e) {
                                $('.message').html( Highcharts.dateFormat('%Y-%m-%d', this.x) + ':<br/>  访问量：' +this.y );
                            }
                        }
                    },
                    marker: {
                        lineWidth: 1
                    }
                }
            }
        });
    });
</script>
</body>
</html>