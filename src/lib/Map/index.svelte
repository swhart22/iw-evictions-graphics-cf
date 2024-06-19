<script>
    import {  onMount, tick } from "svelte";
    import boundaries from './layers/community_areas.topo.json';
    import { mesh, feature } from 'topojson-client';
    import { geoPath,  geoMercator } from 'd3-geo';
    import { scaleLinear } from 'd3-scale';
    import { extent } from 'd3-array';
    import buildings from './chronic_buildings_FINAL.csv';
    import evictions from './chronic_evictions.csv';
    import tracts from './layers/tracts.topo.json';
    import poverty from './layers/poverty.csv';
    import Scroller from "@sveltejs/svelte-scroller";

    let index, offset, progress;

    let w, h, path, ctx, off, dom, canvas;

    // geography stuff
    const chicago = feature(boundaries, boundaries.objects.community_areas);
    const chicagoBoundary = mesh(boundaries, boundaries.objects.community_areas, ((a, b) => a === b))

    const tractFeatures = feature(tracts, tracts.objects.tracts);
    let projection = geoMercator();

    // math stuff 
    const povertyExtent = extent(poverty, d => +d.pct_poverty);
    const povertyScale = scaleLinear()
        .domain(povertyExtent)
        .range(['#fff', 'purple']);
    // console.log(tractFeatures);
    
    
    onMount(async() => {
        dom = true;
        createIcons();
        canvas = document.querySelector('.map-container canvas');
        ctx = canvas.getContext('2d');
    });
    


    $: {
        projection = projection.fitExtent([[10, 10], [w - 10, h -10]], chicago);
        if (canvas) {
            ctx = canvas.getContext('2d');
            path = geoPath(projection, ctx);
            draw(index, w, h);
        }
    }

    function draw (index, w, h) {
        
        if (index === 0) {
            ctx.clearRect(0, 0, w, h);
            ctx.save();
            drawShowTracts();
            ctx.restore();
        }
        if (index === 1) {
            ctx.clearRect(0, 0, w, h);
            ctx.save();
            drawShowTracts();
            drawShowBuildings();
            ctx.restore();
        }
        if (index === 2) {
            ctx.clearRect(0, 0, w, h);
            ctx.save();
            drawShowTracts();
            // drawShowBuildings();
            drawShowEvictions();
            ctx.restore();
        }
       
    }

    function drawShowTracts () {
        
        ctx.beginPath();
        path(chicagoBoundary);
        ctx.strokeStyle = '#666';
        ctx.stroke();
        
        ctx.save();
        ctx.clip();

        tractFeatures.features.forEach(t => {
            const pov = poverty.find(p => p.GEOID === t.properties.GEOID);
            const val = +pov.pct_poverty;
            
            ctx.beginPath();
            path(t);
            ctx.fillStyle = povertyScale(val);
            ctx.fill();
        });
    }

    function drawShowBuildings () {
        
        buildings.forEach(b => {
            const r = 3;
            const coords = projection([b.LONGITUDE, b.LATITUDE]);
            // ctx.beginPath();
            ctx.drawImage(off, coords[0], coords[1]);
            // ctx.strokeStyle = null;
            // ctx.globalAlpha = 0.1;
            // ctx.globalCompositeOperation = 'multiply';
            
            // ctx.fill();
        });
    }

    function drawShowEvictions() {
        ctx.fillStyle = '#000';
        evictions.forEach(e => {
            const r = 2;
            const coords = projection([e['LONGITUDE.x'], e['LATITUDE.x']]);

            ctx.drawImage(off, coords[0], coords[1]);
        });
    }

    function createIcons () {
        const bldgR = 3;
        const bldgD = bldgR * 2;
        const bldgFill = 'red';
        
        const evcR = 2;
        const evcD = evcR * 2;
        const evcFill = 'red';

        off = document.createElement('canvas');
        off.width = bldgD + evcD;
        off.height = bldgD;
        const offctx = off.getContext('2d');

        offctx.fillStyle = evcFill;
        offctx?.beginPath();
        offctx?.arc(evcR, bldgR, evcR, 0, 2 * Math.PI);
        offctx?.closePath();
        offctx?.fill();

        offctx.fillStyle = bldgFill;
        offctx?.beginPath();
        offctx?.arc(evcD + bldgR, evcR, bldgR, 0, 2 * Math.PI);
        offctx?.closePath();
        offctx?.fill();
    }
</script>

<Scroller top="{0}" bottom="{1}" bind:index bind:offset bind:progress>
    <div slot="background">
        <div class="map-scroll-container">
            <div class="map-container" bind:clientWidth={w} bind:clientHeight={h}>
                <canvas width={w} height={h}>
                </canvas>
            </div>
        </div>
    </div>
  
    <div slot="foreground">
      <section>This is the first section.</section>
      <section>This is the second section.</section>
      <section>This is the third section.</section>
    </div>
  </Scroller>


<style lang='scss'>
    section {
        height: 100vh;
    }
    .map-scroll-container {
        max-width: 1400px;
        width: 100%;
        height: 100vh;
        
        margin: 1rem auto;
    }
    .map-container {
        position:relative;
        max-width: 1000px;
        width:100%;
        height:100%;
    }
    .map-container svg, canvas {
           width: 100%;
           height: 100%;
           top: 0;
           left: 0;
        }
</style>