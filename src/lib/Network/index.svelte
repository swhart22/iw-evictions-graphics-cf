<script>
    import Network from '$lib/ai2svelte/network.svelte';
    import Page from '$lib/page.json';
    import { assets } from '$app/paths';
    import SvgMD from './svg/network_md.svelte';
    import SvgSM from './svg/network_sm.svelte';
    import SvgXS from './svg/network_xs.svelte';
   

    
    const graphicInfo = Page.network;
    const hovers = ['drillman', 'oron', 'aron', 'eli', 'chaim', 'jpc', 'better-housing'];
    const mouseover = (el, h) => {
        const text = document.querySelector(`.text-${h}`);
        text.classList.add('shown');
    }
    const mouseout = (el, h) => {
        const text = document.querySelector(`.text-${h}`);
       
        text.classList.remove('shown');
    }
    const hover = (el) => {
        // console.log(el);
        hovers.forEach(h => {
            const shape = el.querySelector(`#${h}`);
            shape.addEventListener('mouseover', () => mouseover(el, h));
            shape.addEventListener('mouseout', () => mouseout(el, h));
            shape.setAttribute('tabindex', '0');
            // console.log(shape);
        });
        const drillman = el.querySelector('#drillman');
        
    }
</script>
<div class="chatter">
    <h3>{graphicInfo.GraphicTitle}</h3>
    <p class="chatter">{graphicInfo.GraphicDek}</p>
</div>
<div class="container ai2html network">
    
    <div class="svg md" use:hover>
        <SvgMD />
    </div>
    <div class="svg sm" use:hover>
        <SvgSM />
    </div>
    <div class="svg xs" use:hover>
        <SvgXS />
    </div>
    <Network assetsPath={assets}/>
    <div class="network-text">
        {#each graphicInfo.blocks as block, i}
        <div class="footnote text-{block.Id}">
            <p class="title"><span class="number">{i + 1}</span><span class="name">{block.Name}</span></p>
            <p class="desc">{block.Desc}</p>
        </div>
        {/each}
    </div>
</div>

<style lang='scss'>
    :global(html) {
        font-size: 20px;
    }
    :global(#g-network-box) {
        pointer-events: none;
    }
    :global(.network .g-aiImg) {
        display: none;
    }
   
    .container {
        max-width: 775px;
        margin: 0rem auto;
        position: relative;
    }
    .network-text {
        position:absolute;
        top:0px;
        left:0px;
        pointer-events:none;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height:100%;
        // flex-wrap: wrap;
        // justify-content: space-between;
        // flex-direction: column;
    }
    .footnote {
        max-width: 350px;
        width: 100%;
        display: none;
        background-color: #fff;
        border: 1px solid #999;
        padding: 0.25rem 1rem 0.5rem;
        border-radius: 2px;
        &.shown {
            display: block;
        }
        // padding-left: 5px;
        // padding-right: 5px;
    }
    .title {
        display: flex;
        align-items: center;
        margin-bottom: 0;
        .number {
            font-size: 0.8rem;
            color: #fff;
            background-color: #c62c2c;
            border-radius: 50%;
            display: inline-block;
            width: 1.1rem;
            height: 1.1rem;
            font-weight: 800;
            text-align: center;
            padding-top: 2px;
            margin-right: 5px;
        }
        .name {
            font-family: 'Sofia Pro', sans-serif;
            font-weight: 800;
            font-size: 1rem;
            
        }
        
    }
    .desc {
        font-family: 'Sofia Pro', sans-serif;
        font-size: 0.7rem;
        line-height: 1.3;
        margin-top: 0.3rem;
    }
    .chatter {
        width: 100%;
        h3 {
            font-family: 'Meursault', serif;
            // text-align: center;
            font-size: 1.8rem;
            margin-top: 0.25rem;
            margin-bottom: 0.5rem;
            @media screen and (max-width: 775px){
                font-size: 1.26rem;
            }
        }
        .chatter{
           font-family: 'Sofia Pro', sans-serif;
           font-size: 0.9rem; 
           margin: 0;
           line-height: 1.3;
           font-weight: 400;
           
        }
    }
    :global(.svg circle){
        &:hover {
            cursor: crosshair;
        }
    }
    .container .svg {
        width: 100%;
        position: absolute;
        top: 0px;
        left: 0px;
        display: none;
       
        @media screen and (min-width:775px) {
            &.md {
                display: block;
            }
            
        }
        @media screen and (min-width: 510px) and (max-width: 775px) {
            &.sm {
                display: block;
            }
        }
        @media screen and (max-width: 510px) {
            &.xs {
                display: block;
            }
        }
    }
   
</style>
