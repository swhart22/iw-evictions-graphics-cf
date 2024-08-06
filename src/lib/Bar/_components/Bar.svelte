<!--
  @component
  Generates an SVG bar chart.
 -->
 <script>
    import { getContext } from 'svelte';
    import { format } from 'd3-format';
  
    const { data, xGet, yGet, xScale, yScale } = getContext('LayerCake');
  
    /** @type {String} [fill='#00bbff'] - The shape's fill color. This is technically optional because it comes with a default value but you'll likely want to replace it with your own color. */
    export let fill = '#00bbff';

  </script>
  
  <g class="bar-group">
    {#each $data as d, i}
      <rect
        class="group-rect"
        data-id={i}
        x={$xScale.range()[0]}
        y={$yGet(d)}
        height={$yScale.bandwidth()}
        width={$xGet(d)}
        {fill}
      ></rect>
      <text x={d.value < 200 ? $xGet(d) + 5 : $xGet(d) - 5}
        y={$yGet(d) + ($yScale.bandwidth() / 2) + 5} 
        text-anchor="end"
        class="bar-label"
        class:outside={d.value < 200}
        >{format(',')(d.value)}
    </text>
    {/each}
  </g>
  <style lang='scss'>
    .bar-label {
        font-family: 'Sofia Pro', sans-serif;
        // font-weight: 800;
        font-size: 0.6rem;
        fill: rgb(35, 37, 41);
        text-anchor: end;
        &.outside {
          text-anchor: start;
          fill: #ffffff;
        }
    }
  </style>