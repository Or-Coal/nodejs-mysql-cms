(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["tag-list"],{"37ba":function(e,t,r){"use strict";r("3883")},3883:function(e,t,r){},"80e1":function(e,t,r){"use strict";r.r(t);var n=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("el-card",{staticClass:"box-card"},[r("div",{staticClass:"header",attrs:{slot:"header"},slot:"header"},[r("span",[e._v("标签列表")]),r("el-button",{attrs:{plain:"",type:"primary",icon:"el-icon-circle-plus-outline"},on:{click:function(t){e.insert_dialog_visible=!0}}},[e._v(" 添加标签 ")])],1),r("el-table",{attrs:{data:e.tableData}},[r("el-table-column",{attrs:{prop:"id",label:"#"}}),r("el-table-column",{attrs:{prop:"name",label:"标签名称"}}),r("el-table-column",{attrs:{label:"操作",width:"180"},scopedSlots:e._u([{key:"default",fn:function(t){return[r("el-button",{attrs:{icon:"el-icon-edit",type:"primary",plain:""},on:{click:function(r){return e.openEditDialog(t.row)}}},[e._v("编辑")]),r("el-button",{attrs:{icon:"el-icon-delete",type:"danger",plain:""},on:{click:function(r){return e.handleRemove(t.row.id,t.$index)}}},[e._v("删除 ")])]}}])})],1),r("el-dialog",{attrs:{title:"添加标签",visible:e.insert_dialog_visible},on:{"update:visible":function(t){e.insert_dialog_visible=t},close:function(t){return e.handleDialogClose("insert_form")}}},[r("el-form",{ref:"insert_form",attrs:{rules:e.rules,model:e.insert_form,"label-width":"80px"}},[r("el-form-item",{attrs:{label:"标签名称",prop:"name"}},[r("el-input",{model:{value:e.insert_form.name,callback:function(t){e.$set(e.insert_form,"name",t)},expression:"insert_form.name"}})],1)],1),r("div",{attrs:{slot:"footer"},slot:"footer"},[r("el-button",{on:{click:function(t){e.insert_dialog_visible=!1}}},[e._v("取 消")]),r("el-button",{attrs:{type:"primary"},on:{click:e.handleInsert}},[e._v("确 定")])],1)],1),r("el-dialog",{attrs:{title:"编辑标签",visible:e.edit_dialog_visible},on:{"update:visible":function(t){e.edit_dialog_visible=t},close:function(t){return e.handleDialogClose("edit_form")}}},[r("el-form",{ref:"edit_form",attrs:{rules:e.rules,model:e.edit_form,"label-width":"80px"}},[r("el-form-item",{attrs:{label:"标签名称",prop:"name"}},[r("el-input",{model:{value:e.edit_form.name,callback:function(t){e.$set(e.edit_form,"name",t)},expression:"edit_form.name"}})],1)],1),r("div",{attrs:{slot:"footer"},slot:"footer"},[r("el-button",{on:{click:function(t){e.edit_dialog_visible=!1}}},[e._v("取 消")]),r("el-button",{attrs:{type:"primary"},on:{click:e.handleEdit}},[e._v("保 存")])],1)],1)],1)},i=[],a=r("5530"),s=r("1da1"),o=(r("a434"),r("96cf"),r("365c")),l={data:function(){return{tableData:[],insert_dialog_visible:!1,edit_dialog_visible:!1,insert_form:{name:""},edit_form:{id:"",name:""},currentData:"",rules:{name:[{required:!0,message:"请输入角色名称",trigger:"blur"}]}}},created:function(){document.title="标签列表",this.loadList()},methods:{loadList:function(){var e=this;return Object(s["a"])(regeneratorRuntime.mark((function t(){var r,n,i;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,o["k"].list();case 2:r=t.sent,n=r.status,i=r.data,n&&(e.tableData=i);case 6:case"end":return t.stop()}}),t)})))()},handleInsert:function(){var e=this;this.$refs.insert_form.validate(function(){var t=Object(s["a"])(regeneratorRuntime.mark((function t(r){var n,i,s,l;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:if(!r){t.next=8;break}return t.next=3,o["k"].insert(Object(a["a"])({},e.insert_form));case 3:n=t.sent,i=n.status,s=n.msg,l=n.data,i&&(e.tableData.push(Object(a["a"])(Object(a["a"])({},l),e.insert_form)),e.insert_dialog_visible=!1,e.$message.success(s));case 8:case"end":return t.stop()}}),t)})));return function(e){return t.apply(this,arguments)}}())},openEditDialog:function(e){this.edit_form=Object(a["a"])({},e),this.edit_dialog_visible=!0,this.currentData=e},handleEdit:function(){var e=this;this.$refs.edit_form.validate(function(){var t=Object(s["a"])(regeneratorRuntime.mark((function t(r){var n,i,s;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:if(!r){t.next=7;break}return t.next=3,o["k"].edit(e.edit_form.id,Object(a["a"])({},e.edit_form));case 3:n=t.sent,i=n.status,s=n.msg,i?(e.$message.success(s),e.edit_dialog_visible=!1,Object.assign(e.currentData,e.edit_form)):e.$message.error(s);case 7:case"end":return t.stop()}}),t)})));return function(e){return t.apply(this,arguments)}}())},handleRemove:function(e,t){var r=this;return Object(s["a"])(regeneratorRuntime.mark((function n(){return regeneratorRuntime.wrap((function(n){while(1)switch(n.prev=n.next){case 0:r.$confirm("此操作将永久删除该标签, 是否继续?",{type:"warning"}).then(Object(s["a"])(regeneratorRuntime.mark((function n(){var i,a,s;return regeneratorRuntime.wrap((function(n){while(1)switch(n.prev=n.next){case 0:return n.next=2,o["k"].remove(e);case 2:i=n.sent,a=i.status,s=i.msg,a&&(r.tableData.splice(t,1),r.$message.success(s));case 6:case"end":return n.stop()}}),n)})))).catch((function(){r.$message.info("取消成功")}));case 1:case"end":return n.stop()}}),n)})))()},handleDialogClose:function(e){this.$refs[e].resetFields()}}},c=l,u=(r("37ba"),r("2877")),d=Object(u["a"])(c,n,i,!1,null,"9253d006",null);t["default"]=d.exports},a434:function(e,t,r){"use strict";var n=r("23e7"),i=r("da84"),a=r("23cb"),s=r("5926"),o=r("07fa"),l=r("7b0b"),c=r("65f0"),u=r("8418"),d=r("1dde"),f=d("splice"),m=i.TypeError,p=Math.max,b=Math.min,_=9007199254740991,v="Maximum allowed length exceeded";n({target:"Array",proto:!0,forced:!f},{splice:function(e,t){var r,n,i,d,f,h,g=l(this),w=o(g),k=a(e,w),x=arguments.length;if(0===x?r=n=0:1===x?(r=0,n=w-k):(r=x-2,n=b(p(s(t),0),w-k)),w+r-n>_)throw m(v);for(i=c(g,n),d=0;d<n;d++)f=k+d,f in g&&u(i,d,g[f]);if(i.length=n,r<n){for(d=k;d<w-n;d++)f=d+n,h=d+r,f in g?g[h]=g[f]:delete g[h];for(d=w;d>w-n+r;d--)delete g[d-1]}else if(r>n)for(d=w-n;d>k;d--)f=d+n-1,h=d+r-1,f in g?g[h]=g[f]:delete g[h];for(d=0;d<r;d++)g[d+k]=arguments[d+2];return g.length=w-n+r,i}})}}]);
//# sourceMappingURL=tag-list.8d337537.js.map