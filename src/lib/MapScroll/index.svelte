<script>
    import MapSVG from '../MapSVG/index.svelte';
    import Scroller from "@sveltejs/svelte-scroller";
    import PovertyHistogram from "../PovertyHistogram/index.svelte";
    import RaceHistogram from "../RaceHistogram/index.svelte";
    import { marked } from 'marked'

  
    export let block;
    let index, offset, progress;
    
</script>

<Scroller top={0} bottom={1} bind:index bind:offset bind:progress>
    <div slot="background">
        <div class="map-scroll-container">
            <MapSVG  {index} />
        </div>
    </div>

    <div slot="foreground">
        {#each block.graphicBlocks as gblock}
        <section class="map-section">
            <div class="content">
                {@html marked(gblock.Text)}
                {#if gblock.Chart && gblock.Chart === 'income'}
                    <div class="histogram-container income">
                        <PovertyHistogram />
                    </div>
                    <p class="source">Source: U.S. Census</p>
                {:else if gblock.Chart && gblock.Chart === 'race'}
                    <div class="histogram-container race">
                        <RaceHistogram />
                    </div>
                    <p class="source">Source: U.S. Census</p>
                {/if}
            </div>
            
        </section>
        {/each}
        
    </div>
</Scroller>

<style lang="scss">
    $break: 780px;
    .map-scroll-container {
        width: 50%;
        height: 100vh;
        @media screen and (max-width:$break) {
            width: 100%;
        }
    }
    section.map-section {
        height: 100vh;
        display: flex;
        align-items: center;
        &:not(:last-child) {
            margin-bottom: 50vh;
        }

        &:last-child {
            padding-bottom: 100vh;
        }
        .content {
            margin-left: 60vw;
            max-width: 380px;
            width: 100%;
            @media screen and (max-width:$break) {
                width: 100%;
                margin: 0rem auto;
                background: #333;
                padding: 0.5rem 1rem 1rem;
                border: 1px solid #eaeaea;
            }
        }
    }

    :global(.map-section p) {
        font-family: "Sofia Pro", sans-serif;
        font-size: 1rem;
        line-height: 1.3;
    }
    .histogram-container {
        width: 100%;
        max-width: 350px;
        display: flex;
        justify-content: center;
    }
    .source {
        font-size: 0.8rem;
        margin-top: 1.5rem;
    }
    
    :global(.map-section h3) {
        font-family: "Sofia Pro", sans-serif;
        font-weight: 800;
        font-size: 1.2rem;
        margin: 0;
        margin-bottom: 0.4rem;
        text-align: left;
    }
    :global(.buildings-span){
        background-color: rgba(255, 198, 18, 1);
        padding: 0px 6px 4px;
        border-radius: 2px;
        // border: 2px solid #FFC612;
    }
    :global(.wards-span) {
        border-radius: 2px;
        padding: 0px 6px 4px;
        border: 1px solid #666666;
    }
    :global(.evictions-span) {
        background-color: #FF7B4D;
        padding: 0px 6px 4px;
        border-radius: 2px;
        color: #fff;
    }
    :global(svelte-scroller-background) {
        pointer-events: all;
    }

    :global(svelte-scroller-foreground) {
        pointer-events: none;
    }
    :global(.map-section .content) {
        pointer-events: all;
    }
</style>
