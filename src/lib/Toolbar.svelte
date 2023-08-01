<script lang="ts">

</script>

<div class="toolbar">
    
</div>


<style>
    .toolbar {
        contain: strict;
        position: relative;
        width: 100%;
        height: 68px;
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