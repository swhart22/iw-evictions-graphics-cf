<script>
    import Linkout from '$lib/Linkout/index.svelte';
    import Page from '$lib/page.json';
   


    const block = Page.blocks.find(d => d.Graphic === 'linkout');

    const story = 'call-the-city';
   
</script>
<div class="linkout-container">
   <Linkout embed={true} {block} {story}/>
</div>
<style lang='scss'>
    :global(html) {
        font-size: 20px;
    }
</style>