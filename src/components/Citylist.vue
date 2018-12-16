<template>
    <table>
        <tr>
            <td>id</td>
            <td>name</td>
            <td>state</td>
            <td>do</td>
        </tr>
    </table>
</template>
<script>
export default {
    mounted: function () {
        // GET /someUrl
        this.$http.get('/api/city').then(response => {
             console.log(response.data);
            // get body data
            // this.someData = response.body;

        }, response => {
            console.log("error");
        });
        }
}
</script>
>
