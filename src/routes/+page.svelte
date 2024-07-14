<script>
    import Header from '$lib/Header/index.svelte';
    import BodyText from '$lib/BodyText/index.svelte';
    import MapScroll from "$lib/MapScroll/index.svelte";
    import Linkout from '$lib/Linkout/index.svelte';
    import Nav from '$lib/Nav/index.svelte';
    import Page from '$lib/page.json';
    

</script>
<Nav />
<Header {Page} />
{#each Page.blocks as block}
    {#if block.Type === 'text'}
        <BodyText {block} />
    {:else if block.Type === 'graphic' && block.Graphic === 'map'}
        <MapScroll />
    {:else if block.Type === 'graphic' && block.Graphic === 'linkout'}
        <Linkout {block} />
    {/if}
{/each}

<style lang='scss' global>
  
:global(body) {
    text-rendering: optimizeLegibility;
    -webkit-font-smoothing: antialiased;
    background-color: #ffffff;
    color: #333;

    
    
}
:global(html) {
    font-size: 20px;
    
}
  

</style>

