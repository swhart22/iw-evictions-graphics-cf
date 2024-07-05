<script>
    import MapSVG from '../MapSVG/index.svelte';
    import Scroller from "@sveltejs/svelte-scroller";
    import PovertyHistogram from "../PovertyHistogram/index.svelte";
    import RaceHistogram from "../RaceHistogram/index.svelte";

  
    let index, offset, progress;

  
    
</script>

<Scroller top={0} bottom={1} bind:index bind:offset bind:progress>
    <div slot="background">
        <MapSVG  {index} />
    </div>

    <div slot="foreground">
        <section class="map-section">
            <div class="content">
                <p>
                    Injustice Watch found <span class="buildings"
                        >2,650 buildings</span
                    > with xyz code violations across the city of Chicago.
                </p>
            </div>
        </section>
        <section class="map-section">
            <div class="content">
                <p>Each of Chicago’s 50 <span class="wards">wards</span> had at least 3 such buildings, with the most found in Ward 6, which contained 184 buildings.
                </p>
                <p><em>Hover over or tap on a ward to see more details.</em></p>
            </div>
        </section>
        <section class="map-section">
            <div class="content">
                <p>TKTK buildings met this criteria (data point here.)</p>
            </div>
        </section>
        <section class="map-section">
            <div class="content">
                <p>And TKTK buildings met this other criteria (data point here.)</p>
            </div>
        </section>
        <section class="map-section">
            <div class="content">
                <p><span class="evictions"
                    >1,736 buildings</span> evicted tenants over the timespan studied.</p>
            </div>
        </section>
        <section class="map-section">
            <div class="content">
                <p>The buildings were found overwhelmingly in neighborhoods with high percentages of population considered <strong>low income</strong> by the city of Chicago (household income under $TK,TKT).</p>
                <h3>Most buildings in low income neighborhoods</h3>
                <div class="histogram-container poverty">
                    <PovertyHistogram />
                </div>
            </div>
        </section>
        <section class="map-section">
            <div class="content">
                <h3>Most buildings in majority Black neighborhoods</h3>
                <div class="histogram-container race">
                    <RaceHistogram />
                </div>
            </div>
        </section>
        <section class="map-section">
            <div class="content">
                <p>More content</p>
            </div>
        </section>
    </div>
</Scroller>

<style lang="scss">
    section.map-section {
        height: 100vh;
        display: flex;
        align-items: center;
        &:not(:last-child) {
            margin-bottom: 50vh;
        }

        .content {
            margin-left: 60vw;
            max-width: 450px;
            p {
                font-size: 1.2rem;
            }
        }
    }

    section p {
        font-family: "sofia-pro", sans-serif;
    }
    .histogram-container {
        width: 100%;
        max-width: 350px;
        display: flex;
        justify-content: center;
    }
    
    :global(h3) {
        font-family: "sofia-pro", sans-serif;
        font-weight: 800;
        font-size: 1.2rem;
        margin: 0;
        margin-bottom: 0.4rem;
    }
    :global(.buildings){
        background-color: rgba(255, 198, 18, 1);
        padding: 0px 6px 4px;
        border-radius: 2px;
        // border: 2px solid #FFC612;
    }
    :global(.wards) {
        border-radius: 2px;
        padding: 0px 6px 4px;
        border: 1px solid #666666;
    }
    :global(.evictions) {
        background-color: #C62C2C;
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
</style>
