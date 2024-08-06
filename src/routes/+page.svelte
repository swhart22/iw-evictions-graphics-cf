<script>
    import Header from '$lib/Header/index.svelte';
    import BodyText from '$lib/BodyText/index.svelte';
    import MapScroll from "$lib/MapScroll/index.svelte";
    import Linkout from '$lib/Linkout/index.svelte';
    import Nav from '$lib/Nav/index.svelte';
    import Page from '$lib/page.json';
    import ScrollBump from '$lib/ScrollBump/index.svelte';
    import Footer from '$lib/Footer/index.svelte';
    import AboutTheData from '$lib/AboutTheData/index.svelte';
    import Solutions from '$lib/Solutions/index.svelte';
    import Photo from '$lib/Photo/index.svelte';
    import Soundcloud from '$lib/Soundcloud/index.svelte';
    import { onMount } from 'svelte';
    import PhotoDouble from '$lib/PhotoDouble/index.svelte';
    

    let ready;
    onMount(() => {
        let ready = true;
    });

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
    {:else if block.Type === 'about-the-data'}
        <AboutTheData {block} />
    {:else if block.Type === 'graphic' && block.Graphic === 'solutions'}
        <Solutions {block} />
    {:else if block.Type === 'photo'}
        <Photo {block} />
    {:else if block.Type === 'photo-double'}
        <PhotoDouble {block} />
    {:else if block.Type === 'soundcloud'}
        <Soundcloud {block}/>
    {/if}
{/each}

<Footer {Page} />

<style lang='scss' global>
  
:global(body) {
    text-rendering: optimizeLegibility;
    -webkit-font-smoothing: antialiased;
    background-color: #635E77;
    color: #fff;
    min-height: 1000px;
    // background-color: #fff;
    // color: #333;

    
    
}
:global(html) {
    font-size: 20px;
    min-height: 1000px;
    
}
  

</style>

