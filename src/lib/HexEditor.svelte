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

<div class = "hexedit">
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


</div>

<style>
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
    }

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

    /*TEXT FORMATTING*/
    .hexedit .text {
        padding: 0 5px;
    }
    .hexedit .text > span {
        padding: 1px 0;
        color: inherit;
    }

    .hexedit .text > span:nth-child(16n)::after {
        content: "\a";
    }

</style>