<script>
    import { onMount, tick } from "svelte";
    import boundaries from "./layers/community_areas.topo.json";
    import { mesh, feature } from "topojson-client";
    import { geoPath, geoMercator } from "d3-geo";
    import { scaleLinear } from "d3-scale";
    import { extent } from "d3-array";
    import wards from "./layers/wards.topo.json";
    import buildings from "./chronic_buildings_FINAL.csv";
    import evictions from "./chronic_evictions.csv";
    import tracts from "./layers/tracts.topo.json";
    import roads from "./layers/roads.topo.json";
    import poverty from "./layers/poverty.csv";
    import Scroller from "@sveltejs/svelte-scroller";
    import PovertyHistogram from "../PovertyHistogram/index.svelte";
    import RaceHistogram from "../RaceHistogram/index.svelte";

  
    let index, offset, progress;

    let w, h, path, ctx, off, dom, canvas;

    // geography stuff
    const chicago = feature(boundaries, boundaries.objects.community_areas);
    const chicagoBoundary = mesh(
        boundaries,
        boundaries.objects.community_areas,
        (a, b) => a === b,
    );
    const roadLines = mesh(roads, roads.objects.roads);
    const wardBounds = mesh(wards, wards.objects.wards);
    const wardFeatures = feature(wards, wards.objects.wards);

    const tractFeatures = feature(tracts, tracts.objects.tracts);
    let projection = geoMercator();

    // math stuff
    const povertyExtent = extent(
        poverty,
        (d) => +d.pct_poverty,
    );
    const midpoint = (0.5 - povertyExtent[0]) / 2 + 0.5;
    const povertyScale = scaleLinear()
        .domain([0, 0.25, 0.5])
        .range(["#c9e6ff", "#868cd3", "#810f7c"])
        .clamp(true);
    // console.log(tractFeatures);

    let wardEls, wardBoundEls, roadEls, buildingEls, evictionEls;
    onMount(async () => {
        dom = true;
        wardEls = document.querySelector(".wards");
        wardBoundEls = document.querySelector(".ward-boundaries");
        roadEls = document.querySelector(".roads");
        buildingEls = document.querySelector(".buildings");
        evictionEls = document.querySelector(".evictions");
    });

    $: {
        projection = projection.fitExtent(
            [
                [10, 10],
                [w - 10, h - 10],
            ],
            chicago,
        );
        path = geoPath(projection);
    }

    $: {
        if (dom) {
            if (index === 0) {
                showEls([roadEls]);
                hideEls([wardEls, wardBoundEls, buildingEls, evictionEls]);
            }
            if (index === 1) {
                showEls([roadEls, wardEls, wardBoundEls, buildingEls]);
                hideEls([evictionEls]);
            }
            if (index === 2) {
                showEls([
                    roadEls,
                    wardEls,
                    wardBoundEls,
                    buildingEls,
                    evictionEls,
                ]);
                hideEls([]);
            }
            if (index === 3) {
                showEls([
                    roadEls,
                    wardEls,
                    wardBoundEls,
                    buildingEls,
                    evictionEls,
                ]);
                hideEls([]);
            }
            if (index === 4) {
            }
        }
    }

   
    function showEls(arr) {
        arr.forEach(( el) => {
            el.style.display = "block";
        });
    }

    function hideEls(arr) {
        arr.forEach(( el) => {
            el.style.display = "none";
        });
    }
</script>

<Scroller top={0} bottom={1} bind:index bind:offset bind:progress>
    <div slot="background">
        <div class="map-scroll-container">
            <div
                class="map-container"
                bind:clientWidth={w}
                bind:clientHeight={h}
            >
                <svg width={w} height={h}>
                    {#if w}
                        <clipPath id="chicago">
                            <path
                                d={path(chicagoBoundary)}
                                stroke="#666"
                                stroke-width="1"
                                fill="none"
                            >
                            </path>
                        </clipPath>
                        <g class="wards" clip-path="url(#chicago)">
                            {#each wardFeatures.features as ward}
                                <path
                                    d={path(ward)}
                                    fill="#fff"
                                    class="ward-shape"
                                >
                                </path>
                            {/each}
                        </g>
                        <g class="roads" clip-path="url(#chicago)">
                            <path
                                d={path(roadLines)}
                                stroke="#eaeaea"
                                stroke-width="0.5"
                                fill="none"
                            >
                            </path>
                        </g>
                        <path
                            class="ward-boundaries wards"
                            clip-path="url(#chicago)"
                            d={path(wardBounds)}
                            fill="none"
                            stroke="#666"
                            stroke-width="1px"
                        >
                        </path>

                        <g class="buildings">
                            {#each buildings as b}
                                {@const r = 2};
                                {@const coords = projection([
                                    b.LONGITUDE,
                                    b.LATITUDE,
                                ])};
                                <circle
                                    cx={coords[0]}
                                    cy={coords[1]}
                                    {r}
                                    fill="#FFC612"
                                    stroke="#FFC612"
                                    class="building"
                                ></circle>
                            {/each}
                        </g>
                        <g class="evictions">
                            {#each evictions as e}
                                {@const r = 2};
                                {@const coords = projection([
                                    e["LONGITUDE.x"],
                                    e["LATITUDE.x"],
                                ])};
                                <circle
                                    cx={coords[0]}
                                    cy={coords[1]}
                                    {r}
                                    fill="#C62C2C"
                                    stroke="#C62C2C"
                                    stroke-width="1"
                                    class="eviction"
                                ></circle>
                            {/each}
                        </g>
                        <path
                            d={path(chicagoBoundary)}
                            stroke="#333"
                            stroke-width="1"
                            fill="none"
                        >
                        </path>
                    {/if}
                </svg>
            </div>
        </div>
    </div>

    <div slot="foreground">
        <section class="map-section">
            <div class="content">
                <p>
                    Injustice Watch found <span class="buildings"
                        >2,XXX buildings</span
                    > with xyz code violations across the city of Chicago.
                </p>
            </div>
        </section>
        <section class="map-section">
            <div class="content">
                <p>Wards with buildings</p>
            </div>
        </section>
        <section class="map-section">
            <div class="content">
                <p>Wards with buildings with evictions</p>
            </div>
        </section>
        <section class="map-section">
            <div class="content">
                <p>Buildings with poverty</p>
                <div class="histogram-container poverty">
                    <PovertyHistogram />
                </div>
            </div>
        </section>
        <section class="map-section">
            <div class="content">
                <p>Buildings with pct. black</p>
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
        }
    }

    section p {
        font-family: "sofia-pro", sans-serif;
    }
    .histogram-container {
        width: 300px;
    }
    .map-scroll-container {
        width: 50%;
        height: 100vh;
    }
    .map-container {
        position: relative;
        max-width: 1000px;
        width: 100%;
        height: 100%;
    }
    .map-container svg,
    canvas {
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
    }

    .building,
    .eviction {
        fill-opacity: 0.6;
        /* mix-blend-mode: multiply; */
    }
</style>
