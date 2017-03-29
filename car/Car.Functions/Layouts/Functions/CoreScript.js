///此文件运行依赖如下文件
/// <reference path="easyUI144/jquery.min.js" />
/// <reference path="artDialog/dist/dialog-plus-min.js" />

/// <reference path="../plugins/moment/moment.js" />

$.extend({
    ///选人控件
    ///使用方法：$.UserPicker(function(user){
    ///             do somethine
    ///          });
    UserPicker: function (callback) {
        top.dialog({
            height: 500,
            width: 700,
            padding: 10,
            url: "/opzoon/control/userpicker.aspx",
            quickClose: false,
            data: {}, // 给 dialog 的数据
            cancelValue: '取消',
            cancel: function () { },
            onclose: function () {
                //dialog返回数据
                var _returnValue = this.returnValue;
                //回调给调用者
                callback(_returnValue);
            },
            oniframeload: function () {
                //窗口内网页加载完成后的事件
            }
        }).showModal();
    },
    DepartmentPicker: function (callback) {
        top.dialog({
            height: 500,
            width: 400,
            padding: 10,
            url: "/opzoon/control/departmentpicker.aspx",
            quickClose: false,
            data: {}, // 给 dialog 的数据
            cancelValue: '取消',
            cancel: function () { },
            onclose: function () {
                //dialog返回数据
                var _returnValue = this.returnValue;
                //回调给调用者
                callback(_returnValue);
            },
            oniframeload: function () {
                //窗口内网页加载完成后的事件
            }
        }).showModal();
    },
    ModelDialog: function (param) {
        //默认参数：height\高度，width\宽度，padding\对话框内边距，quickClose\是否点空白快速关闭，callback\回调方法
        var defParam = {
            height: 500,
            width: 700,
            padding: 10,
            quickClose: true,
            data: {},
            callback: function () { },
            title: "对话框",
            onclose: function () {
                //dialog返回数据
                var _returnValue = this.returnValue;
                //回调给调用者
                this.callback(_returnValue);
            },
            oniframeload: function () {
                //窗口内网页加载完成后的事件
            }
        };
        //合并参数
        var _param = $.extend(defParam, param);

        top.dialog(_param).showModal();
    },
    //显示错误信息，后台返回为ServerResult类型，$.AlertError(error);
    AlertError: function (result, title) {
        var _title = title || "提示";

        if ($.type(result) === 'object') {
            if (!result.Result) {
                var _content = "";
                if (!!result.Errors && result.Errors.length > 0) {
                    _content = "<span style='color:red'>" + result.Message + "</span><br/>";
                    for (var i = 0; i < result.Errors.length; i++) {
                        _content += (i + 1) + "、" + result.Errors[i].ErrorMessage + "<br/>";
                    }
                } else {
                    _content = "<span style='color:red'>" + result.Message + "</span><br/>";
                }
                $.ModelDialog({
                    title: _title,
                    height: 'auto',
                    content: _content,
                    cancelValue: '关闭',
                    cancel: function () { }
                });
            }
        }
        else {
            $.ModelDialog({
                title: _title,
                height: 'auto',
                width: 'auto',
                content: result,
                cancelValue: '关闭',
                cancel: function () { }
            });
        }
    },
    CloseDialog: function (val) {
        var dialog = top.dialog.get(window);
        dialog.close(val);
        dialog.remove();
    },

    GetJSONDate: function (date) {
        //$.GetJSONDate("1990-1-1" + " " + $("#txtEarliestWorkDateTime").timespinner("getValue"));
        ///返回Date(1449777843000+0800)/

        return "/Date(" + moment(date, "YYYY-MM-DD HH:mm").valueOf() + "+0800)/";
    },
    //获取地址栏的参数值，http://baidu.com?aaa=bbb
    //OpzoonGetQueryParam(aaa)
    OpzoonGetQueryParam: function (f) {
        a:;
        var b = window.location.search.substring(1);
        if (b && b.length > 2)

            for (var c = b.split("&"), e = c.length, a = 0; a < e; a++) {
                var d = c[a].split("=");
                if (d[0].toLowerCase() == f)
                    return d[1]
            }
    },
    //设置地址栏参数（名，值，url）
    OpzoonSetUrlKeyValue: function (b, e, a) {
        ULSiIp:;
        if (a == null) a = window.location.href + "";
        var c = e, d = new CUrl(a);
        a = d.query;

        if (a.indexOf(b + "=") < 0) {
            if (a.length > 1) a += "&";
            else if (a.length == 0)
                a += "?"; a += b + "=" + c
        } else {
            var g = new RegExp(b + "=[^&]*");
            a = a.replace(g, b + "=" + c)
        }
        d.query = a;

        var a = d.path + d.query + d.hash;
        return a
    },
    //删除连接地址中的所有参数，hash，参数为
    //c
    OpzoonRemoveQueryStringsAndHash: function (a) {
        if (a) {
            var b = a.indexOf("#");
            if (b >= 0) a = a.substr(0, b); b = a.indexOf("?");
            if (b >= 0) a = a.substr(0, b)
        } return a
    },
    //将JSON对象转化为字符串
    json2string: function (strObject) {
        var c, i, l, s = '', v, p;
        switch (typeof strObject) {
            case 'object':
                if (strObject) {
                    if (strObject.length && typeof strObject.length == 'number') {
                        for (i = 0; i < strObject.length; ++i) {
                            v = $.json2string(strObject[i]);
                            if (s) {
                                s += ',';
                            }
                            s += v;
                        }
                        return '[' + s + ']';
                    } else if (typeof strObject.toString != 'undefined') {
                        for (i in strObject) {
                            v = strObject[i];
                            if (typeof v != 'undefined' && typeof v != 'function') {
                                v = $.json2string(v);
                                if (s) {
                                    s += ',';
                                }
                                s += $.json2string(i) + ':' + v;
                            }
                        }
                        return '{' + s + '}';
                    }
                }
                return 'null';
            case 'number':
                return isFinite(strObject) ? String(strObject) : 'null';
            case 'string':
                l = strObject.length;
                s = '"';
                for (i = 0; i < l; i += 1) {
                    c = strObject.charAt(i);
                    if (c >= ' ') {
                        if (c == '\\' || c == '"') {
                            s += '\\';
                        }
                        s += c;
                    } else {
                        switch (c) {
                            case '\b':
                                s += '\\b';
                                break;
                            case '\f':
                                s += '\\f';
                                break;
                            case '\n':
                                s += '\\n';
                                break;
                            case '\r':
                                s += '\\r';
                                break;
                            case '\t':
                                s += '\\t';
                                break;
                            default:
                                c = c.charCodeAt();
                                s += '\\u00' + Math.floor(c / 16).toString(16) +
		       (c % 16).toString(16);
                        }
                    }
                }
                return s + '"';
            case 'boolean':
                return String(strObject);
            default:
                return 'null';
        }
    },
    //阿拉伯数字转中文大写
    DX: function (n) {
        if (!/^(0|[1-9]\d*)(\.\d+)?$/.test(n))
            return "数据非法";
        var unit = "千百拾亿千百拾万千百拾元角分", str = "";
        n += "00";
        var p = n.indexOf('.');
        if (p >= 0)
            n = n.substring(0, p) + n.substr(p + 1, 2);
        unit = unit.substr(unit.length - n.length);
        for (var i = 0; i < n.length; i++)
            str += '零壹贰叁肆伍陆柒捌玖'.charAt(n.charAt(i)) + unit.charAt(i);
        return str.replace(/零(千|百|拾|角)/g, "零").replace(/(零)+/g, "零").replace(/零(万|亿|元)/g, "$1").replace(/(亿)万|壹(拾)/g, "$1$2").replace(/^元零?|零分/g, "").replace(/元$/g, "元整");
    },
    //打印方法，如果页面在iframe中，弹出新窗口，如果不在iframe中直接调用打印；
    print: function (c) {
        if (self != top) {
            var _url = window.location.href;
            _url = $.OpzoonSetUrlKeyValue("print", 1, _url)
            $(c).attr("href", _url);
            return true;
        } else {
            window.print();
            return false;
        }
    } 

});




//编外方法
function dateboxParser(s) {
    if (s) {
        if (moment(s).isValid()) {
            return moment(s).toDate();
        } else {
            return moment(s, "YYYY-MM-DD").toDate();
        }
    } else {
        return new Date();
    }
}
function dateboxFormatter(date) {
    return moment(date).format("YYYY-MM-DD");
}

function datetimeboxFormatter(date) {
    return moment(date).format("YYYY-MM-DD HH:mm");
}

//不许删除，
function CUrl(b) {
    a:;
    var c = b.indexOf("?"), a = b.indexOf("#");
    if (a >= 0 && a < c)
        a = -1;
    this.path = b;
    this.query = "";
    this.hash = "";
    if (c >= 0) {
        this.path = b.substr(0, c);
        if (a >= c)
            this.query = b.substr(c, a - c);
        else
            this.query = b.substr(c)
    } if (a >= 0) {
        if (c < 0) this.path = b.substr(0, a);
        this.hash = b.substr(a)
    }
}




Date.prototype.toMSJSON = function () {
    var date = '/Date(' + this.getTime() + '+0800)/'; //CHANGED LINE
    return date;
};



