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
    import lowenstein from './layers/lowenstein_properties.csv';
    import carlson from './layers/carlson.csv';

 
    export let index;
    export let landlords;
    export let universe;

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
    let properties;

    if (universe === 'carlson') {
        properties = carlson;
    } else if (universe === 'lowenstein') {
        properties = lowenstein;
    }

    let projection = geoMercator();

    let wardEls, wardBoundEls, roadEls, buildingEls, evictionEls;
    onMount(async () => {
        dom = true;
        wardEls = document.querySelector(".wards");
        roadEls = document.querySelector(".roads");
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
                        stroke="#666"
                        stroke-width="1"
                        fill="none"
                    >
                    </path>
                    
                </clipPath>
                
                <g class="wards" clip-path="url(#chicago)" >
                    {#each wardFeatures.features as ward}
                        {@const bounds = path.bounds(ward)}
                        <path
                            d={path(ward)}
                            fill="#efefef"
                            class="ward-shape"
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
                
                <path
                    class="ward-boundaries wards"
                    clip-path="url(#chicago)"
                    d={path(wardBounds)}
                    fill="none"
                    stroke="#fff"
                    stroke-width="1px"
                    bind:this={wardBoundEls}
                    style="display: none;"
                ></path>
               
                    <g class="landlords">
                        {#each properties as p}
                        {@const r = 3};
                        {@const coords = projection([
                            p.X,
                            p.Y,
                        ])}
                        <circle
                            cx={coords[0]}
                            cy={coords[1]}
                            {r}
                            fill="#FF7171"
                            stroke="#C62C2C"
                            stroke-width="1"
                            class="lowenstein"
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
        
    </div>

<style lang='scss'>
    .map-container {
        position: relative;
        max-width: 390px;
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
        // cursor: crosshair;
        // &:hover {
        //     fill: #eaeaea;
        // }
    }
    .building,
    .eviction, .lowenstein {
        // fill-opacity: 0.6;
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