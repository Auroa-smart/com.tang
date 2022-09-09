$(function() {
    //通过jquery的class选择器（数组）
    //对每个class为viewUser的元素进行动作绑定（click）
    /*
     * bind、live、delegate
     * on
     */
    $(".viewUser").on("click", function () {
        //将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
        var obj = $(this);

        var currentPageUrl ="";
        if (typeof this.href === "undefined") {
            currentPageUrl = document.location.toString().toLowerCase();
        } else {
            currentPageUrl = this.href.toString().toLowerCase();
        }

        window.location.href =currentPageUrl+ "/user.do?method=view&userid=" + obj.attr("userid");
    });
});