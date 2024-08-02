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
    import properties from './layers/lowenstein_properties.csv';

 
    export let index;
    export let landlords;

    let path, dom, w, h;


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

    let wardEls, wardBoundEls, roadEls, buildingEls, evictionEls, simEls;
    onMount(async () => {
        dom = true;
        wardEls = document.querySelector(".wards");
        // wardBoundEls = document.querySelector(".ward-boundaries");
        roadEls = document.querySelector(".roads");
        // buildingEls = document.querySelector(".buildings");
        // evictionEls = document.querySelector(".evictions");
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
                hideEls([wardEls, wardBoundEls,  evictionEls, simEls]);
            }
            if (index === 1) {
                showEls([roadEls, buildingEls]);
                hideEls([wardEls, wardBoundEls, evictionEls, simEls]);
            }
            if (index === 2) {
                // buildings = buildings.sort((a, b) => a.);
                showEls([
                    roadEls,
                    wardEls,
                    wardBoundEls,
                    buildingEls,
                    
                ]);
                hideEls([evictionEls, simEls]);
            }
            if (index === 3) {
                showEls([
                    roadEls,
                    wardEls,
                    wardBoundEls,
                    buildingEls,
                    evictionEls,
                ]);
                hideEls([evictionEls, simEls]);
            }
            if (index === 4) {
                showEls([
                    roadEls,
                    wardEls,
                    wardBoundEls,
                    buildingEls,
                    evictionEls,
                ]);
                hideEls([simEls]);
            }
            if (index === 5) {
                showEls([
                    roadEls,
                    wardEls,
                    
                    simEls
                ]);
                
                // console.log(fades);
                fadeEls([
                    buildingEls,
                    evictionEls,
                    wardBoundEls,
                ]);
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
                el.style.opacity = 1;
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
    function fadeEls (arr) {
        arr.forEach((el) => {
            if (el) {
                el.style.opacity = 0.1;
            }
        })
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
 
    // console.log(buildings);

</script>
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
                        stroke="#fff"
                        stroke-width="1"
                        fill="none"
                    >
                    </path>
                </clipPath>
                <path
                    d={path(chicagoBoundary)}
                    stroke="none"
                    fill="#333"
                    class="chicago-boundary"
                    fill-opacity=0
                >
                </path>
                <g class="wards" clip-path="url(#chicago)">
                    {#each wardFeatures.features as ward}
                        {@const bounds = path.bounds(ward)}
                        <path
                            d={path(ward)}
                            fill="#fff"
                            class="ward-shape"
                            on:mouseover={(e) => hover(e, ward, bounds)}
                            on:mouseout={mouseout}
                        >
                        </path>
                    {/each}
                </g>
                <g class="roads" clip-path="url(#chicago)" bind:this={roadEls} >
                    <path
                        d={path(roadLines)}
                        stroke="#999"
                        stroke-width="0.5"
                        fill="none"
                    >
                    </path>
                </g>
                {#if !landlords}
                
                <path
                    class="ward-boundaries wards"
                    clip-path="url(#chicago)"
                    d={path(wardBounds)}
                    fill="none"
                    stroke="#F9DADA"
                    stroke-width="1px"
                    bind:this={wardBoundEls}
                >
                </path>
                
                    <g class="buildings" bind:this={buildingEls}>
                        {#each buildings as b, i}
                            {#if b.LONGITUDE != 'NA'}
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
                            {/if}
                        {/each}
                        
                    </g>
                    <g class="evictions" bind:this={evictionEls}>
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
                                fill="#FF7B4D"
                                stroke="#FF7B4D"
                                stroke-width="1"
                                class="eviction"
                            ></circle>
                        {/each}
                    </g>
                    <g class="simultaneous" bind:this={simEls}>
                        {#each evictions.filter(d => d.simultaneous === 'TRUE') as e}
                            {@const r = 2};
                            {@const coords = projection([
                                e["LONGITUDE.x"],
                                e["LATITUDE.x"],
                            ])};
                            <circle
                                cx={coords[0]}
                                cy={coords[1]}
                                {r}
                                fill="#FF7B4D"
                                stroke="#FF7B4D"
                                stroke-width="1"
                                class="eviction sim"
                            ></circle>
                        {/each}
                    </g>
                {/if}
                <path
                    d={path(chicagoBoundary)}
                    stroke="#fff"
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

<style lang='scss'>
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
        fill-opacity: 0.01;
        &:hover {
            fill: #eaeaea;
            fill-opacity: 0.5;
        }
    }
   
    .building,
    .eviction, .lowenstein {
        fill-opacity: 1;
        // stroke-width: 0.25;
        // stroke: #eaeaea;
        /* mix-blend-mode: multiply; */
    }
    .building, .eviction {
        
        &.highlighted {
            stroke: #eaeaea;
            stroke-width: 0.25;
            r: 3;
        }
        &.faded {
            opacity: 0.1;
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