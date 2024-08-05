<script>
    import Linkout from '$lib/Linkout/index.svelte';
    import Page from '$lib/page.json';

    const block = Page.blocks.find(d => d.Graphic === 'linkout');
   
</script>
<div class="linkout-container">
   <Linkout embed={true} {block}/>
</div>