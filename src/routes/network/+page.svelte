<script>
    import Network from '$lib/ai2svelte/network.svelte';
    import Page from '$lib/page.json';
    import { assets } from '$app/paths';

    
    const graphicInfo = Page.network;
</script>
<div class="chatter">
    <h3>{graphicInfo.GraphicTitle}</h3>
    <p class="chatter">{graphicInfo.GraphicDek}</p>
</div>
<div class="container ai2html network">
    <Network assetsPath={assets}/>
    <div class="network-text">
        {#each graphicInfo.blocks as block, i}
        <div class="footnote">
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
   
    .container {
        max-width: 780px;
        width: 100%;
        margin: 0rem auto;
    }
    .network-text {
        // display: flex;
        // flex-wrap: wrap;
        // justify-content: space-between;
        // flex-direction: column;
    }
    .footnote {
        max-width: 780px;
        width: 100%;
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
</style>
