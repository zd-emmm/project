(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-2d0da964"],{"6bdf":function(t,e,s){"use strict";s.r(e);var n=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{ref:"container",staticClass:"bill-details"},[s("div",{staticClass:"nav acea-row"},[s("div",{staticClass:"item",class:0==t.types?"on":"",on:{click:function(e){return t.changeTypes(0)}}},[t._v("\n      全部\n    ")]),s("div",{staticClass:"item",class:1==t.types?"on":"",on:{click:function(e){return t.changeTypes(1)}}},[t._v("\n      消费\n    ")]),s("div",{staticClass:"item",class:2==t.types?"on":"",on:{click:function(e){return t.changeTypes(2)}}},[t._v("\n      充值\n    ")])]),s("div",{staticClass:"sign-record"},[s("div",{staticClass:"list"},t._l(t.list,function(e,n){return s("div",{key:n,staticClass:"item"},[s("div",{staticClass:"data"},[t._v(t._s(e.time))]),t._l(e.list,function(e,n){return s("div",{key:n,staticClass:"listn"},[s("div",{staticClass:"itemn acea-row row-between-wrapper"},[s("div",[s("div",{staticClass:"name line1"},[t._v(t._s(e.title))]),s("div",[t._v(t._s(e.add_time))])]),s("div",{staticClass:"num",class:0==e.pm?"font-color-red":""},[t._v("\n              "+t._s(0==e.pm?"-":"+")+t._s(e.number)+"\n            ")])])])})],2)}),0)]),s("Loading",{attrs:{loaded:t.loaded,loading:t.loading}})],1)},i=[],a=s("c24f"),l=s("3a5e"),d={name:"UserBill",components:{Loading:l["a"]},props:{},data:function(){return{types:"",where:{page:1,limit:5},list:[],loaded:!1,loading:!1}},watch:{"$route.params.types":function(t){var e=this;void 0!=t&&(e.types=t,e.list=[],e.where.page=1,e.loaded=!1,e.loading=!1,e.getIndex())},types:function(){this.getIndex()}},mounted:function(){var t=this;t.types=t.$route.params.types,t.getIndex(),t.$scroll(t.$refs.container,function(){!t.loading&&t.getIndex()})},methods:{code:function(){this.sendCode()},changeTypes:function(t){t!=this.types&&(this.types=t,this.list=[],this.where.page=1,this.loaded=!1,this.loading=!1)},getIndex:function(){var t=this;1!=t.loaded&&1!=t.loading&&(t.loading=!0,Object(a["n"])(t.where,t.types).then(function(e){t.loading=!1,t.loaded=e.data.length<t.where.limit,t.where.page=t.where.page+1,t.list.push.apply(t.list,e.data)},function(e){t.$dialog.message(e.msg)}))}}},o=d,c=s("2877"),r=Object(c["a"])(o,n,i,!1,null,null,null);e["default"]=r.exports}}]);
//# sourceMappingURL=chunk-2d0da964.2b7839ca.js.map