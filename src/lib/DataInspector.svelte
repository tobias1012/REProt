<script lang="ts">
    export let selection: string[] = [];
    let endianness: String;
    let data = selection;
    $: {
        if (endianness == "little"){
            data = selection.slice().reverse();
        } else {
            data = selection;
        }
        //Create the data types
    }

    //TODO: Fix the parse float to work, this is stolen from stackoverflow
    function parseFloat(str: string) {
        var float = 0, sign, order, mantiss,exp,
            int = 0, multi = 1;
        if (/^0x/.exec(str)) {
            int = parseInt(str,16);
        }else{
            for (var i = str.length -1; i >=0; i -= 1) {
            if (str.charCodeAt(i)>255) {
                console.log('Wrong string parametr'); 
                return false;
            }
            int += str.charCodeAt(i) * multi;
            multi *= 256;
            }
        }
        sign = (int>>>31)?-1:1;
        exp = (int >>> 23 & 0xff) - 127;
        let mantissa = ((int & 0x7fffff) + 0x800000).toString(2);
        for (i=0; i<mantissa.length; i+=1){
            float += parseInt(mantissa[i])? Math.pow(2,exp):0;
            exp--;
        }
        return float*sign;
    }

</script>


<!--TODO Prettyfi-->
<div class= "sidebar">
    <select bind:value={endianness}>
        <option value="little">Little-Endian</option>
        <option value="big">Big-Endian</option>
    </select>
    {#key data}
        <h1>Integer: {parseInt(data.join(''), 16)}</h1>
        <h1>Float: {parseFloat(data.join(''))}</h1>
    {/key}
</div>


<style>
    .sidebar {
        position: absolute;
        contain: content;
        right: 0;
        scrollbar-width: none;
        top: 100px;
        width: 320px;
        overflow-x: hidden;
        overflow-y: auto;
    }
</style>