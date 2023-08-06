<script lang="ts">
    import DataInspector from "$lib/DataInspector.svelte";
    import HexEditor from "$lib/HexEditor.svelte";
	import Toolbar from "$lib/Toolbar.svelte";
    let hexdata = [0x2b,0x66,2,0xff, 128, 192, 1, 1, 1, 1, 1, 1, 1, 1,1,1,1,1,1,1,1,1,1,1, 0x14,0xae,0x07,0x40,0];
    let selection: string[];
    $: console.log(selection)
</script>

<div class="container">
    <div class="Top"><Toolbar /></div>
    <div class="HEX"> <HexEditor data={hexdata} bind:selection={selection} /> </div>
    <div class="Data"><DataInspector selection={selection} /></div>
  </div>

<style>
    :global(body) {
        margin: 0;
    }


    .container {  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: 0.5fr 5fr 5.8fr;
  gap: 0px 0px;
  grid-auto-flow: row;
  justify-content: space-around;
  grid-template-areas:
    "menubar menubar menubar"
    "HEX HEX Data"
    "PROT PROT Data"
}

    .Top { grid-area: menubar; background-color: aqua; }

    .HEX { grid-area: HEX; background-color: red;}

    .Data { grid-area: Data; background-color: brown; }

</style>