<script lang="ts">
    export let data: number[];
    export let selection: String[] = [];
    //CONFIG
    const ROW_LENGTH = 0x10;


    function printable(num: number){
        if (num < 32 || num > 127) {
            return ".";
        }
        return String.fromCharCode(num);
    }

    function handleSelection(e: any) {
        
        if(e.buttons == 1){
            console.log(e)
            selection.push(e.fromElement.firstChild.data);
            e.fromElement.classList.add("selected");
            selection = selection;
        }
    }
    function clearSelection() {
        //if(selection.length == 1)
        //{return;}
        const elements = document.querySelectorAll('*');

        elements.forEach((element) => {
        element.classList.remove('selected');
        });
        selection = [];
    }

</script>

<!--<div class = "hexedit">
    <h1>HexEditor</h1>
    <div class = "offset notranslate">
        {#each {length: Math.ceil(data.length / ROW_LENGTH)} as _, index}
            <div>{(index * 10).toString().padStart(4, "0")}</div>    
        {/each}    
    </div>

    <div class = "hex notranslate">
        {#each data as num, index}
            <span data-index={index} on:mousedown={clearSelection} on:mouseover={handleSelection} on:focus={null} role="contentinfo">
                {num.toString(16).padStart(2,'0')}
            </span>    
        {/each}
    </div>
    <div class="text notranslate">
        {#each data as current, index}
            <span data-index={index}>{printable(current)}</span>    
        {/each}
    </div>


</div>-->

<div class="editor">
    <div class="offset">
        {#each {length: Math.ceil(data.length / ROW_LENGTH)} as _, index}
            <span>{(index * 10).toString().padStart(4, "0")}</span>    
        {/each}
     </div>

    <div class="data">
        {#each data as num, index}
            <span data-index={index}>{num.toString(16).padStart(2,'0')}</span>
        {/each}
    </div>
    
    <div class="text">
        {#each data as current, index}
            <span data-index={index}>{printable(current)}</span>    
        {/each}
    </div>
</div>

<style>
    .editor {
        display: grid; 
        grid-template-columns: min-content min-content min-content; 
        grid-template-rows: 100%; 
        gap: 0px 0px; 
        grid-template-areas: 
            "offset data text"; 
        font-size: 20pt;
    }

    .offset, .data, .text {
        font-family: "Source Code Pro", "HexEd.it Symbols", "Courier New", Consolas, Menlo, "PT Mono", "Liberation Mono", monospace;

        contain: content;
        display: inline-block;
        height: 100%;
        overflow: hidden;
        vertical-align: top;
        direction: ltr;
    }



    .offset {
        grid-area: offset;
        justify-content: space-around;
        display: inline-block;
        padding-right: 5px;
        padding-left: 5px;
        margin-right: 5px;
        text-align: right;
        background-color: #adadad;
    }

    .data {
        grid-area: data;
        color: #333;
        margin-right: 10px;
    }

    .data span {
        padding: 1px 1px 4px 5px;
    }

    .data span:nth-child(2n) {
        color: #545454;
    }

    .text {
        grid-area: text;
    }


    .text > span:nth-child(16n)::after, .data span:nth-child(16n)::after,  .offset span::after{
        content: "\a";
        white-space: pre;
    }





    /*
    :global(.selected) {
        background-color: aqua;
    }

    .hexedit, .hexedit * {
        unicode-bidi: bidi-override;
        box-sizing: border-box;
        user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        -webkit-user-select: none;
    }s

    .hexedit {
        white-space: nowrap;
    }

    .hexedit .offset {
        background-color: #ededed;
        color: #545454;
        padding-left: 10px;
        padding-right: 10px;
    }

    .hexedit .offset, .hexedit span {
        

        text-align: right;
        font-size: 20px;
        font-variant: normal;
        line-height: 25px;
        text-transform: none;
        cursor: default;
    }

    .hexedit .offset, .hexedit .hex, .hexedit .text {
        font-family: "Source Code Pro", "HexEd.it Symbols", "Courier New", Consolas, Menlo, "PT Mono", "Liberation Mono", monospace;

        contain: content;
        display: inline-block;
        height: 100%;
        overflow: hidden;
        vertical-align: top;
        direction: ltr;
    }

    .hexedit span {
        contain: strict;
        display: inline;
        white-space: pre;
    }

    .hexedit .hex > span {
        padding: 1px 1px 4px 5px;
        border-right: 0;
        color: #333;
    }

    .hexedit .hex > span:nth-child(2n) {
        color: var(--hexedit-area-hex-column-even-foreground, #545454);
    }

    .hexedit .hex > span:nth-child(8n) {
        padding-right: 4px;
        border-right: 1px solid var(--hexedit-area-hex-grouping-borderColor, #ccc);
    }

    .hexedit .hex > span:nth-child(16n)::after {
        content: "\a";
        margin: 0 -5.3px 0 5px;
    }
    .hexedit .hex > span:nth-child(16n) {
        padding-right: 5px;
        border-right: 0;
    }

    
    .hexedit .text {
        padding: 0 5px;
    }
    .hexedit .text > span {
        padding: 1px 0;
        color: inherit;
    }

    .hexedit .text > span:nth-child(16n)::after {
        content: "\a";
    }*/

</style>