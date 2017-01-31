/**
 * Created by zhaop on 2016/3/29.
 */
String.prototype.format = function () {
    var reg = /{(\d+)}/gm,
        args = arguments;
    return this.replace(reg, function (match, name) {
        return args[~~name];
    });
};