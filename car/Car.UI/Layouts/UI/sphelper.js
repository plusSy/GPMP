var _SPHelper = window._SPHelper || {};

//�б��һЩ����
_SPHelper.List = (function () {
    //��ȡ��ǰ�б��ID
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