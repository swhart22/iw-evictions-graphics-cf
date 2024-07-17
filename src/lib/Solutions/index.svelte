<script>
    import Fa from 'svelte-fa';
    import { faCity } from '@fortawesome/free-solid-svg-icons'
    
    import { marked } from 'marked';
    export let block;
</script>

<div class="pad">
    <div class="solutions-container">
        <p class='icon'><Fa icon={faCity} /></p>
        {@html marked(block.Text)}
    </div>
</div>

<style lang='scss'>
    
    .solutions-container {
        max-width: 780px;
        width: 100%;
        margin: 1rem auto;
        border: 2px solid #3d3741;
        background-color: rgba(61, 55, 65, .1);
        margin-bottom: 6rem;
    }
    :global(.solutions-container .icon) {
        padding: 0.5rem 2.5rem 0rem 1.5rem;
        margin-bottom: 0;
    }
    :global(.solutions-container p:not(:first-child)) {
        font-family: 'Sofia Pro', sans-serif;
        font-size: 0.9rem;
        padding: 0rem 2.5rem 1rem 1.5rem;
        line-height: 1.5;
        margin: 0;
    }
    :global(.solutions-container h3) {
        padding: 0rem 2.5rem 0.25rem 1.5rem;
        font-size: 1.25rem;
        margin: 0;
    }
    :global(span.click-here) {
        text-decoration:underline;
        font-weight: 800;
        cursor: pointer;
    }
    :global(.solutions-container a) {
        color: #000;
    }
</style>