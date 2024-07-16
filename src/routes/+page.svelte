<script>
    import Header from '$lib/Header/index.svelte';
    import BodyText from '$lib/BodyText/index.svelte';
    import MapScroll from "$lib/MapScroll/index.svelte";
    import Linkout from '$lib/Linkout/index.svelte';
    import Nav from '$lib/Nav/index.svelte';
    import Page from '$lib/page.json';
    import ScrollBump from '$lib/ScrollBump/index.svelte';
    import Footer from '$lib/Footer/index.svelte';
    

</script>
<Nav />
<Header {Page} />
{#each Page.blocks as block}
    {#if block.Type === 'text'}
        <BodyText {block} />
    {:else if block.Type === 'graphic' && block.Graphic === 'map'}
        <MapScroll {block} />
    {:else if block.Type === 'graphic' && block.Graphic === 'linkout'}
        <Linkout {block} />
    {:else if block.Type === 'skip-to-bottom'}
        <ScrollBump {block} />
    {/if}
{/each}

<Footer {Page} />

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

