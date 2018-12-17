<template>
 <el-container>
<el-header>
    <h1>城市信息表</h1>
</el-header>
<el-main>
   <el-table
   order size="mini" fit highlight-current-row height="500" :data='tableDate'>
    <el-table-column label="id" prop='id'></el-table-column>
    <el-table-column label='name' prop='name'></el-table-column>
    <el-table-column label='state' prop='state'></el-table-column>
    <el-table-column
              fixed="right"
              label="操作"
              width="195">
    <template slot-scope="scope">
                <el-button @click="upd(scope.row)" style="padding: 3px 4px 3px 4px;margin: 2px"
                           size="mini">编辑
                </el-button>
                <el-button type="danger" style="padding: 3px 4px 3px 4px;margin: 2px" size="mini"
                           @click="del(scope.row)">删除
                </el-button>
    </template>
    </el-table-column>
   </el-table> 
   </el-main>
 </el-container>
</template>
 
<script>
export default {
    data(){
        return{
             tableDate:[]
           
        }
    },
    mounted: function () {
        //GET /someUrl
        this.initData();
        },
        methods:{
        //初始化城市列表
        initData(){
             this.$http.get('/api/city').then(response => {
              console.log(response.data);
             this.tableDate=response.data.citys;
             this.someData = response.body;

         }, response => {
             console.log("error");
         });
        },
        //更新城市列表
        upd(row){
              this.$http.get('/api/city/'+row.id).then(response => {
              console.log(response.data);

         }, response => {
             console.log("error");
         });
        },
        //删除选中城市
        del(row){
            this.$http.delete('/api/city/'+row.id).then(response=>{
                console.log(response.data);
                this.initData();
            });
        }
      
    }
   

}
</script>
>
