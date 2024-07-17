<script>
    import { marked } from 'marked';
    export let block;


</script>
<div class="pad">
    <div class="scroll-bump about-the-data" >
        {@html marked(block.Text)}
    </div>
</div>
<style lang='scss'>
    
    .scroll-bump {
        max-width: 780px;
        width: 100%;
        margin: 1rem auto;
        border: 2px solid #f8cd65;
        background-color: rgba(248,205,101,.1);
        
    }
    :global(.scroll-bump.about-the-data p) {
        font-family: 'Sofia Pro', sans-serif;
        font-size: 0.9rem;
        padding: 0rem 2.5rem 1rem 1.5rem;
        line-height: 1.5;
        margin: 0;
    }
    :global(.scroll-bump.about-the-data h3) {
        padding: 0.75rem 2.5rem 0.25rem 1.5rem;
        font-size: 1.25rem;
        margin: 0;
    }
    :global(span.click-here) {
        text-decoration:underline;
        font-weight: 800;
        cursor: pointer;
    }
    :global(.about-the-data a) {
        color: #000;
    }
</style>