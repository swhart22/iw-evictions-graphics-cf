<script>
    import { marked } from 'marked';

    export let block;
</script>

<section class="body-text">
    {@html marked(block.Text)}
</section>
<style lang='scss'>
    .body-text {
        max-width: 780px;
        width: 100%;
        margin: 1rem auto;
        padding-left:10px;
        padding-right: 10px;
        box-sizing: border-box;
    }

    :global(.body-text p) {
        font-size: 1rem;
        font-family: 'Freight Text Pro', serif;
        line-height: 1.4;

        @media screen and (max-width: 600px) {
            font-size: 0.9rem;
        }
        
    }
    
</style>