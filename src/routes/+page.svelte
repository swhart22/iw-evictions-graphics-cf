<script>
    import Header from '$lib/Header/index.svelte';
    import BodyText from '$lib/BodyText/index.svelte';
    import MapScroll from "$lib/MapScroll/index.svelte";
    import Linkout from '$lib/Linkout/index.svelte';
</script>

<Header />
<BodyText />
<MapScroll />
<BodyText />
<Linkout />

<style lang='scss'>
    :global(body) {
        background-color: #ffffff !important;
    }
</style>

