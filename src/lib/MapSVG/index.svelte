<script>
    import { onMount } from 'svelte';
    import boundaries from "./layers/community_areas.topo.json";
    import { mesh, feature } from "topojson-client";
    import { geoPath, geoMercator } from "d3-geo";
    import wards from "./layers/wards.topo.json";
    import buildings from "./chronic_buildings_FINAL.csv";
    import evictions from "./chronic_evictions.csv";
    import roads from "./layers/roads.topo.json";
    import Tooltip from '../Tooltip/index.svelte';

 
    export let index;

    let path, dom;
    let w = 600;
    let h = 600;

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

    let projection = geoMercator();

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
                showEls([roadEls, buildingEls]);
                hideEls([wardEls, wardBoundEls,  evictionEls]);
            }
            if (index === 1) {
                showEls([roadEls, wardEls, wardBoundEls, buildingEls]);
                hideEls([evictionEls]);
            }
            if (index === 2) {
                // buildings = buildings.sort((a, b) => a.);
                showEls([
                    roadEls,
                    wardEls,
                    wardBoundEls,
                    buildingEls,
                    
                ]);
                hideEls([evictionEls]);
            }
            if (index === 3) {
                showEls([
                    roadEls,
                    wardEls,
                    wardBoundEls,
                    buildingEls,
                    evictionEls,
                ]);
                hideEls([evictionEls]);
            }
            if (index === 4) {
                showEls([
                    roadEls,
                    wardEls,
                    wardBoundEls,
                    buildingEls,
                    evictionEls,
                ]);
                hideEls([]);
            }
            if (index === 5) {
                showEls([
                    roadEls,
                    wardEls,
                    wardBoundEls,
                    buildingEls,
                    evictionEls,
                ]);
                hideEls([]);
            }
            if (index === 6) {
                showEls([
                    roadEls,
                    wardEls,
                    wardBoundEls,
                    buildingEls,
                    evictionEls,
                ]);
                hideEls([]);
            }
        }
    }

    let tooltipDisplay = 'none';
    let activeWard = {};
    let activeWardBounds = [];
   
    function showEls(arr) {
        arr.forEach(( el) => {
            if (el) {
                el.style.display = "block";
            }
        });
    }

    function hideEls(arr) {
        arr.forEach(( el) => {
            if (el) {
                el.style.display = "none";
            }
        });
    }
    function hover (e, ward, bounds) {
        tooltipDisplay = 'block';
        activeWard = ward;
        activeWardBounds = bounds;
        // console.log(e, ward);
    }
    function mouseout () {
        tooltipDisplay = 'none';
        activeWard = {};
    }

    $: console.log(w, h);

</script>
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
                        {@const bounds = path.bounds(ward)}
                        <path
                            d={path(ward)}
                            fill="green"
                            class="ward-shape"
                            on:mouseover={(e) => hover(e, ward, bounds)}
                            on:mouseout={mouseout}
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
                    {#each buildings as b, i}
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
                    class="chicago-boundary"
                >
                </path>
            {/if}
        </svg>
        <div class="labels">
            {#if w}
            <Tooltip 
                {tooltipDisplay} 
                {activeWard}
                {w}
                {h}
                {activeWardBounds}
            />
            {/if}
        </div>
    </div>
</div>
<style lang='scss'>
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
    .ward-shape {
        cursor: crosshair;
        &:hover {
            fill: #eaeaea;
        }
    }
    .building,
    .eviction {
        fill-opacity: 0.6;
        /* mix-blend-mode: multiply; */
    }
    .building {
        
        &.highlighted {
            opacity: 1;
        }
    }
    .chicago-boundary, .roads, .buildings, .ward-boundaries {
        pointer-events:none;
    }
    .labels {
        width: 100%; 
        height: 100%;
        pointer-events:none;
        position: absolute;
        top:0px;
        left:0px;
    }
</style>