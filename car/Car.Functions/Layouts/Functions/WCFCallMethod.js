
//添加方法，使用Jquery对象方式
$.extend({
    WCFCallMethod: function (url) {
        //访问地址
        this._url = url;
        //Get方式
        this.GetMethod = function (FuncName, ParamData, SuccessCallback, ErrorCallback) {
            var r = $.ajax({
                cache: false,
                type: "GET",
                dataType: "json",
                url: this._url + FuncName,
                data: ParamData,
                success: function (ResponseData) {
                    if (typeof (SuccessCallback) == 'function') {
                        SuccessCallback(ResponseData);
                    }
                },
                error: function (xhr) {
                    if (ErrorCallback) {
                        ErrorCallback(xhr);
                    }

                    $.error(xhr);
                }
            });
            return r;
        }
        //Post方式,使用方法
        // var _data = {};
        //_data.rule = _selectRow;
        //$.WCFCallMethod("/opzoon/service/kqservice.svc/").PostMethod("DeleteAttendaceRule", _data, function (res) {
        //    //do sth
        //});
        this.PostMethod = function (FuncName, ParamData, SuccessCallback, ErrorCallback) {

            var dataString = "";
            if (ParamData) {
                dataString = _JsonToStr(ParamData);
            } else {
                dataString = null;
            }
            var r = $.ajax({
                cache: false,
                type: "POST",
                url: this._url + FuncName,
                data: dataString,
                contentType: 'application/json',
                dataType: "json",
                success: function (ResponseData) {
                    if (typeof (SuccessCallback) == 'function') {
                        SuccessCallback(ResponseData);
                    }
                },
                error: function (xhr) {
                    if (ErrorCallback) {
                        ErrorCallback(xhr);
                    }

                    $.error(xhr);
                }
            });
            return r;
        }


        //返回对象
        return this;
    }
});

function _JsonToStr(strObject) {
    var c, i, l, s = '', v, p;

    switch (typeof strObject) {
        case 'object':
            if (strObject) {
                if (strObject.length && typeof strObject.length == 'number') {
                    for (i = 0; i < strObject.length; ++i) {
                        v = _JsonToStr(strObject[i]);
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
                            v = _JsonToStr(v);
                            if (s) {
                                s += ',';
                            }
                            s += _JsonToStr(i) + ':' + v;
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
}