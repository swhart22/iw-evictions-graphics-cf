<script>
    import { marked } from 'marked';

    export let block;
    console.log(block);
</script>

<section class="body-text">
    {@html marked(block.Text)}
</section>
<style lang='scss'>
    .body-text {
        max-width: 780px;
        width: 100%;
        margin: 1rem auto;
    }

    :global(.body-text p) {
        font-size: 1em;
        font-family: 'freight-text-pro', serif;
        line-height: 1.4;
        
    }
    :global(.body-text p a) {
        color: #FF2300;
        background: linear-gradient(0deg, rgb(246 244 235 / 0%) 4px, rgba(234,109,89,0.7) 4px, rgba(234,109,89,0.7) 5px, rgba(251,50,18,0.15) 5px, rgba(251,50,18,0.15) 96%, rgb(246 244 235 / 0%) 96%);
        background-position: 0% 100%;
        background-repeat: no-repeat;
        background-size: 100% 40%;
        transition: background-size .1s ease-in;
        text-decoration: none;
        &:hover,
        &:focus {
            background-size: 100% 100%;
            color: #FF2300;
        }
    }
</style>