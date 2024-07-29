<script>
    import Network from '$lib/ai2svelte/network.svelte';
    import Page from '$lib/page.json';
    
    const graphicInfo = Page.network;
</script>
<div class="chatter">
    <h3>{graphicInfo.GraphicTitle}</h3>
    <p class="chatter">{graphicInfo.GraphicDek}</p>
</div>
<div class="container">
    <Network />
</div>
<style lang='scss'>
    :global(html) {
        font-size: 20px;
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
    .container {
        max-width: 780px;
        width: 100%;
        margin: 0rem auto;
    }
</style>
