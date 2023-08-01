<script lang="ts">
    import DataInspector from "$lib/DataInspector.svelte";
    import HexEditor from "$lib/HexEditor.svelte";
	import Toolbar from "$lib/Toolbar.svelte";
    let hexdata = [0x2b,0x66,2,0xff, 128, 192, 1, 1, 1, 1, 1, 1, 1, 1,1,1,1,1,1,1,1,1,1,1, 0x14,0xae,0x07,0x40,0];
    let selection: string[];
    $: console.log(selection)
</script>

<Toolbar />
<div class = "inline">
    <div class = "stacked">
        <HexEditor data={hexdata} bind:selection={selection}/>
        <h1>Reversed Protocol</h1>
    </div>
    <DataInspector selection={selection}/>
</div>

<style>
    .inline {
        display: inline-block;
    }

</style>