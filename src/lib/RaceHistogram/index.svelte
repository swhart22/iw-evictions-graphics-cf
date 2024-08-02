<script>
    import { LayerCake, Svg, flatten, stack } from 'layercake';
  
    import { scaleBand, scaleOrdinal } from 'd3-scale';
    import { format } from 'd3-format';
  
    import ColumnStacked from '../Histogram/_components/ColumnStacked.svelte';
    import AxisX from '../Histogram/_components/AxisX.svelte';
    import AxisY from '../Histogram/_components/AxisY.svelte';
  
    // This example loads csv data as json using @rollup/plugin-dsv
    import data from '../Histogram/_data/bldg_blk_pop_hist.csv';
  
    const xKey = 'x';
    const yKey = [0, 1];
    const zKey = 'key';
  
    const seriesNames = ['total'];
    const seriesColors = ['#FFC612'];
  
    /* --------------------------------------------
     * Cast data
     */

     
    data.forEach(d => {
      seriesNames.forEach(name => {
        d[name] = +d[name];
      });
      d.x = +d.x
    });

    const formatLabelY = (d, i) => {
      const formatted = format(`~s`)(d);
      
      if (d === 600) {
        return `${formatted} buildings`;
      } else {
        return formatted;
      }
    };
  
    const stackedData = stack(data, seriesNames);

   
  </script>
  
  <div class="chart-container">
    <LayerCake
        padding={{ top: 0, right: 0, bottom: 20, left: 0 }}
        x={d => d.data[xKey]}
        y={yKey}
        z={zKey}
        xScale={scaleBand().paddingInner(0.05).round(true)}
        xDomainSort={false}
        zScale={scaleOrdinal()}
        zDomain={seriesNames}
        zRange={seriesColors}
        flatData={flatten(stackedData)}
        data={stackedData}
    >
      <Svg>
        <AxisX
          gridlines={false}
          tickMarks={true}
          tickMarkLength={6}
          ticks={[0.5, 1]}
          format={d => {
                if (+d === 0.5 || +d === 1 || +d === 0) {
                  return format('.0%')(+d);
                } else {
                  return '';
                }
              }
            }
            title="% Black"
        />
        <AxisY
          ticks={3}
          gridlines={true}
          format={formatLabelY}
          
        />
        <ColumnStacked/>
      </Svg>
    </LayerCake>
  </div>

  <style lang='scss'>
     .chart-container {
      width: 100%;
      height: 180px;
    }
    
    :global(.axis .tick text) {
        font-family: 'Sofia Pro', 'sans-serif';
    }
  </style>