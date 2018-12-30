<template>
    <el-container>
<el-header>
    <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <router-link to="/index" style="float:left;text-decoration:none" class="el-icon-back">
        </router-link>
        用户信息
    </h1>
</el-header>
<el-main>
   <el-table
   order size="mini" fit highlight-current-row height="500" :data='tableDate'>
    <el-table-column label="id" prop='id'></el-table-column>
    <el-table-column label='name' prop='name'></el-table-column>
    <el-table-column label='age' prop='age'></el-table-column>
    <el-table-column label='sex' prop='sex'></el-table-column>
     <el-table-column label='phone' prop='phone'></el-table-column>
    <el-table-column label='salary(单位元)' prop='salary'></el-table-column>
    <el-table-column label='address' prop='address'></el-table-column>
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
    mounted:function() {
        this.initData();
    },
    methods:{
        initData(){
        this.$http.get('/api/user').then(response => {
              console.log(response.data.users);
             this.tableDate=response.data.users;
             console.log( this.tableDate);
             this.tableDate.forEach(item=>{
                 if(item.sex==0){
                     item.sex='女';
                 }
                 else{
                     item.sex='男';
                 }
             })
             
            
         }, response => {
             console.log("error");
         });
        } ,
        upd(row){
            console.log(row.id);
        },
        del(row){
            console.log(row.id);
        }  

        }

}
</script>
