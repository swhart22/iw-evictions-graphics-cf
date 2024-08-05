<script>
    import Linkout from '$lib/Linkout/index.svelte';
    import Page from '$lib/page.json';
    import { page } from '$app/stores';


    const block = Page.blocks.find(d => d.Graphic === 'linkout');

    const story = 'sue-the-landlord';
   
</script>
<div class="linkout-container">
   <Linkout embed={true} {block} {story}/>
</div>
<style lang='scss'>
    :global(html) {
        font-size: 20px;
    }
</style>