$.showErr = function(str, funcok) {
    layer.alert(str, {
        icon : 2,
        title : '错误'
    }, function(index) {
        funcok.call();
        layer.close(index);
    });
};