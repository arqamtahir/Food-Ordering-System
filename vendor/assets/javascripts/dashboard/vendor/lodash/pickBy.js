var arrayMap=require("./_arrayMap"),baseIteratee=require("./_baseIteratee"),basePickBy=require("./_basePickBy"),getAllKeysIn=require("./_getAllKeysIn");function pickBy(e,a){if(null==e)return{};var r=arrayMap(getAllKeysIn(e),function(e){return[e]});return a=baseIteratee(a),basePickBy(e,r,function(e,r){return a(e,r[0])})}module.exports=pickBy;