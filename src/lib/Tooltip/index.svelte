<script>
    export let tooltipDisplay;
    export let activeWard;
    export let w;
    export let h;
    export let activeWardBounds;

    let xpos, ypos;
    $: if (activeWardBounds.length > 0) {
        ypos = activeWardBounds[0][1] + (activeWardBounds[1][1] - activeWardBounds[0][1]) / 2;
        xpos = activeWardBounds[1][0];
    }
   
    
    
</script>

<div class="tooltip" style="display: {tooltipDisplay}; top: {ypos - 15}px; left: {xpos}px;">
    <p class="ward-title">Ward {activeWard.properties?.Ward}</p>
    <p>{activeWard.properties?.bldg_count} buildings</p>
</div>
<style lang='scss'>
    .tooltip {
        position: absolute;
        top: 50px;
        left: 50px;
        max-width: 200px;
        background-color: #fff;
        border: 1px solid #999;
        border-radius: 2px;
        padding: 0.25rem 0.5rem 0.5rem;
        p {
            line-height: 1.2;
            margin: 0;
            font-family: "sofia-pro", sans-serif;
            font-size: 0.9rem;
            &.ward-title {
                font-weight: 700;
            }
        }
    }
</style>