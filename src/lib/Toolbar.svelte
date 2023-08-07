<script lang="ts">
	import BpfInput from "./BPFInput.svelte";
    import { WebviewWindow } from '@tauri-apps/api/window'



    function datasource() {
        const web = new WebviewWindow("DataSource", {
            url: '/datasource'
        })

        web.once('tauri://created', function () {
        // webview window successfully created
        })
        web.once('tauri://error', function (e: any) {
        // an error occurred during webview window creation
        console.log(e);
        })
        }

</script>

<div class="toolbar">
    <div class="buttons">
        <button on:click={(x) => datasource()}>Choose DataSource</button>
        <button>Start/Pause Live Mode</button>
        <button>Previous Packet</button>
        <button>Next Packet</button>
        <button>Export</button>
    </div>
    <BpfInput />
</div>


<style>
    .toolbar {
        contain: strict;
        position: relative;
        width: 100%;
        height: 100%;
        padding: 0;
        padding-left: 8px;
        overflow: hidden;
        background: hsl(0 0% 20%);
    }

    .toolbar::before {
        content: "";
        display: block;
        position: absolute;
        top: 1px;
        left: 7px;
        height: 66px;
    }

    *, ::before, ::after {
        box-sizing: border-box;
        user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        -webkit-user-select: none;

    }
</style>