<script lang="ts">
    import { invoke } from '@tauri-apps/api/tauri'

    let devices: string[] = [];
    async function get_devices() {
        devices = await invoke("get_devices");
    }
    get_devices();
</script>
<div>
<input type="file" />
<select>
    <option>None</option>
    {#each devices as device}
        <option>{device}</option>
    {/each}
</select>
</div>