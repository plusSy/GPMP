var _SPHelper = window._SPHelper || {};

//列表的一些操作
_SPHelper.List = (function () {
    //获取当前列表的ID
    var GetListID = function () {
        return SP.ListOperation.Selection.getSelectedList()
    };

    var GetListViewID = function () {
        return SP.ListOperation.Selection.getSelectedView();
    };
    return {
        GetListID: GetListID,
        GetListViewID: GetListViewID
    };
}());