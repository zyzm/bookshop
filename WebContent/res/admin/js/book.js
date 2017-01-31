/**
 * Created by Caleb on 2016/4/20.
 */
var dialog;
BUI.use(['bui/tree', 'bui/data', 'bui/menu','bui/overlay','bui/mask'],function (Tree, Data, Menu, Overlay) {
    //树节点数据，
    //text : 文本，
    //id : 节点的id,
    //leaf ：标示是否叶子节点，可以不提供，根据childern,是否为空判断
    //expanded ： 是否默认展开

    var store = new Data.TreeStore({
        url : ctx + '/categories', //返回的数据如果数据有children字段，且children.length == 0 ，则认为存在未加载的子节点
        //leaf = false，没有children字段也会认为子节点未加载，展开时会自动加载
        autoLoad : true,
        map : {
            'cname': 'text',
            'cid': 'id',
            'childrens': 'children'
        },
        root: {
            text: '图书分类',
            id: '0'
        }
    });

    var menu = new Menu.ContextMenu({
        children : [
            {
                iconCls:' icon-plus',
                text : '添加分类',
                listeners:{
                    'click':addCategory
                }
            },
            {
                iconCls:'icon-pencil',
                text : '编辑',
                listeners:{
                    'click':editCategory
                }
            },
            {
                iconCls:'icon-remove',
                text: '删除',
                listeners:{
                    click: delCategory
                }
            }
        ]
    });

    //由于这个树，不显示根节点，所以可以不指定根节点
    var tree = new Tree.TreeList({
        render: '#tree_categories',
        store: store,
        dirCls : 'icon-pkg',
        leafCls : 'icon-example',
        showLine : true, //显示连接线
        showRoot: true,
        accordion : true,
        collapseEvent : null
    });
    tree.render();


    tree.on('itemclick', function(ev){
        var item = ev.item;
        if(item.leaf){
            $('#book').attr('src', ctx + '/admin/book/getCategoryBooks?cid='+item.id);
        }
    });

    tree.on('itemcontextmenu', function(ev){
        var item = ev.item;
        tree.setSelected(item);
        menu.set('xy',[ev.pageX, ev.pageY]);

        menu.show();

        return false; //prevent the default menu
    });

     dialog = new Overlay.Dialog({
        title: '添加分类',
        width: 500,
        height: 300,
        mask: true,
        loader : {
            url : ctx + '/admin/category/editCategory',
            autoLoad : false, //不自动加载
            lazyLoad : false,//不延迟加载
        },
        success: function () {
            var dialog = this;
            $.ajax({
               url:ctx + '/admin/category/saveCategory',
               type: 'post',
               data: {
                    'category.cid': $('#cid').val(),
                    'category.cname': $("#cname").val(),
                    'category.description': $('#description').val(),
                    'category.pid': $('#pid').val()
               },
               success: function(){
                   store.reloadNode();
                   dialog.close();
                   BUI.Message.Alert('保存成功','success');
               }
            });

        }
    });
    function addCategory(e){
        var item = tree.getSelected();
        dialog.set("title","添加分类");
        dialog.show();
        dialog.get('loader').load({pid:item.id});
    }

    function editCategory(e){
        var item = tree.getSelected();
        dialog.set("title","编辑分类");
        dialog.show();
        dialog.get('loader').load({cid:item.id});
    }

    function delCategory(e){
        BUI.Message.Confirm('确认要删除么？',function(){
            setTimeout(function(){
                var item = tree.getSelected();
                $.ajax({
                    url:ctx + '/admin/category/delCategory?cid='+item.id,
                    success:function(data){
                        if(data.status === 1){
                            store.reloadNode();
                            BUI.Message.Alert('删除成功','success');
                        }
                        else{
                            BUI.Message.Alert(data.msg,'error');
                        }
                    },
                    error:function(){
                        BUI.Message.Alert('删除失败','error');
                    }
                });
            }, 0);

        },'question');
    }
});